package com.migimnasio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.migimnasio"}) 
public class MiGimnasioApplication {
    public static void main(String[] args) {
        SpringApplication.run(MiGimnasioApplication.class, args);
    }
}
