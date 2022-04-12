package com.semi.heyearth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import mission.MissionController;

@SpringBootApplication
@ComponentScan //현재패키지 다른 설정 인식
@ComponentScan(basePackageClasses = MissionController.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
