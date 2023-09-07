package com.example.r2dbc;

import io.micrometer.core.instrument.Gauge;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.time.Duration;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

@Component
public class R2dbcConnectionLeakDemo {

    private static final Logger logger = Logger.getLogger(R2dbcConnectionLeakDemo.class.getName());
    public static final Set<String> METRICS = Set.of("r2dbc.pool.acquired", "r2dbc.pool.idle", "r2dbc.pool.pending");
    private final DemoRepository demoRepository;
    private final MeterRegistry meterRegistry;

    public R2dbcConnectionLeakDemo(
        DemoRepository demoRepository,
        MeterRegistry meterRegistry
    ) {
        this.demoRepository = demoRepository;
        this.meterRegistry = meterRegistry;
    }

    @EventListener(ApplicationReadyEvent.class)
    private void runGoodQueryPeriodically() {
        demoRepository.findById(1L)
            .delaySubscription(Duration.ofMillis(1000))
            .repeat()
            .subscribe();
    }


    @EventListener(ApplicationReadyEvent.class)
    private void runMetrics() {
        Flux.interval(Duration.ofMillis(2000))
            .doOnNext(_ignore -> meterRegistry.getMeters().stream()
                .filter(meter -> METRICS.contains(meter.getId().getName()))
                .forEach(meter -> logger.info(meter.getId().getName() + ": " + ((Gauge) meter).value()))
            )
            .repeat()
            .subscribe();
    }

    @EventListener(ApplicationReadyEvent.class)
    private void runSomethingBadPeriodically() {
        getDemoEntitiesAsList()
            .zipWith(runSomethingFailing())
            .delaySubscription(Duration.ofMillis(1000))
            // resume on error to repeat
            .onErrorResume(e -> Mono.empty())
            .repeat()
            .subscribe();
    }

    private Mono<List<DemoEntity>> getDemoEntitiesAsList() {
        return demoRepository
            .findAll()
            .collectList()
            .doOnCancel(() -> logger.info("Canceled"));
    }

    private static Mono<?> runSomethingFailing() {
        return Mono.error(RuntimeException::new)
            .delaySubscription(Duration.ofMillis(10));
    }
}