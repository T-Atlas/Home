package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author LianJunhong
 */
@SpringBootApplication
@EnableScheduling
public class HomeApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(HomeApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(HomeApplication.class);
    }

}
