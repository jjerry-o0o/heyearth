package com.semi.heyearth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import member.MemberController;
import member.MemberDAO;
import board.BoardController;
import board.BoardDAO;
import carbon.CarbonController;
import mission.MissionController;
import mission.MissionDAO;
import mypage.MypageController;
import recycling.RecyclingController;
import recycling.VisionController;
import participation.ParticipationController;
import participation.ParticipationDAO;
import zeroshop.LocationDAO;
import zeroshop.ZeroshopController;
import zeroshop.ZeroshopDAO;

@SpringBootApplication
@Component
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = MemberDAO.class)
@ComponentScan(basePackageClasses = MissionController.class)
@ComponentScan(basePackageClasses = BoardController.class)
@MapperScan(basePackageClasses = BoardDAO.class)
@ComponentScan(basePackageClasses = ZeroshopController.class)
@ComponentScan(basePackageClasses = CarbonController.class)
@ComponentScan(basePackageClasses = MypageController.class)
@ComponentScan(basePackageClasses = ParticipationController.class)
@MapperScan(basePackageClasses = LocationDAO.class)
@MapperScan(basePackageClasses = ZeroshopDAO.class)
@MapperScan(basePackageClasses = MissionDAO.class)
@ComponentScan(basePackageClasses = RecyclingController.class)
@ComponentScan(basePackageClasses = VisionController.class)
@MapperScan(basePackageClasses = ParticipationDAO.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
