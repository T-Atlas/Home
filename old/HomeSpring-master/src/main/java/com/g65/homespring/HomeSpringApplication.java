package com.g65.homespring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author LianJunhong
 */
@MapperScan("com.g65.homespring.mapper")
@SpringBootApplication
public class HomeSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(HomeSpringApplication.class, args);
    }

}
