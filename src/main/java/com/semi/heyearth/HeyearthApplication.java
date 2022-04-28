package com.semi.heyearth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import admin.AdminController;
import admin.AdminDAO;
import member.MemberController;
import member.MemberDAO;
import board.BoardController;
import board.BoardDAO;
import carbon.CarbonController;
import carbon.CarbonDAO;
import comment.CommentContoller;
import comment.CommentDAO;
import mission.MissionController;
import mission.MissionDAO;
import mypage.MyguideDAO;
import mypage.MypageController;
import recycling.RecyclingDAO;
import participation.ParticipationController;
import participation.ParticipationDAO;
import recycling.RecyclingController;
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
@MapperScan(basePackageClasses = RecyclingDAO.class)
@MapperScan(basePackageClasses = BoardDAO.class)
@MapperScan(basePackageClasses = ParticipationDAO.class)
@ComponentScan(basePackageClasses = AdminController.class)
@MapperScan(basePackageClasses = AdminDAO.class)
@MapperScan(basePackageClasses = CarbonDAO.class)
@ComponentScan(basePackageClasses = CommentContoller.class)
@MapperScan(basePackageClasses = CommentDAO.class)
@MapperScan(basePackageClasses = MyguideDAO.class)
public class HeyearthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeyearthApplication.class, args);
	}

}
