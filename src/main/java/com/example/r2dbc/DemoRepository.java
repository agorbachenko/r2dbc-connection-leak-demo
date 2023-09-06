package com.example.r2dbc;

import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DemoRepository extends ReactiveCrudRepository<DemoEntity, Long> {
}