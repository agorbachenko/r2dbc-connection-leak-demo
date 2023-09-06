package com.example.r2dbc;

import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.time.Duration;
import java.util.List;
import java.util.logging.Logger;

@Component
public class R2dbcConnectionLeakDemo {

    private static final Logger logger = Logger.getLogger(R2dbcConnectionLeakDemo.class.getName());
    private final DemoRepository demoRepository;

    public R2dbcConnectionLeakDemo(DemoRepository demoRepository) {
        this.demoRepository = demoRepository;
    }

    @EventListener(ApplicationReadyEvent.class)
    private void runGoodQueryPeriodically() {
        demoRepository.findById(1L)
            .delaySubscription(Duration.ofMillis(1000))
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