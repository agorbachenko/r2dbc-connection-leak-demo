package com.example.r2dbc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.r2dbc.repository.config.EnableR2dbcRepositories;

@SpringBootApplication
@Configuration
@EnableR2dbcRepositories("com.example.r2dbc")
public class R2dbcConnectionLeakDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(R2dbcConnectionLeakDemoApplication.class, args);
    }
}