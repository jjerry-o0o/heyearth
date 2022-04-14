package com.semi.heyearth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import member.MemberController;
import member.MemberDAO;
import board.BoardController;
import carbon.CarbonController;
import mission.MissionController;
import mypage.MypageController;
import zeroshop.LocationDAO;
import zeroshop.ZeroshopController;

@SpringBootApplication
@Component
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = MemberDAO.class)
@ComponentScan(basePackageClasses = MissionController.class)
@ComponentScan(basePackageClasses = BoardController.class)
@ComponentScan(basePackageClasses = ZeroshopController.class)
@ComponentScan(basePackageClasses = CarbonController.class)
@ComponentScan(basePackageClasses = MypageController.class)
@MapperScan(basePackageClasses = LocationDAO.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
