package com.semi.heyearth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import member.MemberController;
import member.MemberDAO;
import board.BoardController;
import mission.MissionController;
import recycling.RecyclingController;
//import recycling.VisionController;
import zeroshop.LocationDAO;
import zeroshop.ZeroshopController;

@SpringBootApplication
@Component
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = MemberDAO.class)
@ComponentScan(basePackageClasses = MissionController.class)
@ComponentScan(basePackageClasses = BoardController.class)
@ComponentScan(basePackageClasses = ZeroshopController.class)
@MapperScan(basePackageClasses = LocationDAO.class)
@ComponentScan(basePackageClasses = RecyclingController.class)
//@ComponentScan(basePackageClasses = VisionController.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
