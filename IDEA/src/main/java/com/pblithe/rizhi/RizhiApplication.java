package com.pblithe.rizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.pblithe.rizhi.dao")
public class RizhiApplication {

    public static void main(String[] args) {
        SpringApplication.run(RizhiApplication.class, args);
    }

}
