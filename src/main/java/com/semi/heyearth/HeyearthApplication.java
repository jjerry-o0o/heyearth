package com.semi.heyearth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

import board.BoardController;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = BoardController.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
