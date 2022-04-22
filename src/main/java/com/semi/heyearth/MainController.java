package com.semi.heyearth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mission.MissionService;
import mission.MissionServiceImpl;
import zeroshop.ZeroshopService;
import zeroshop.ZeroshopServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("missionservice")
	MissionService missionservice = new MissionServiceImpl();
	
	@Autowired
	@Qualifier("zeroshopservice")
	ZeroshopService zero_service = new ZeroshopServiceImpl();
	
//	@RequestMapping("/")
//	public String main() {
//		return "main";
//	}
	
	@RequestMapping("/about")
    public String about() {
       return "about";
    }
	
	@RequestMapping("/") 
	 public ModelAndView mainlist(ModelAndView mav) {
	        mav.setViewName("main");
	        mav.addObject("gilist", missionservice.missionlist_group_ing());     
	        mav.addObject("silist", missionservice.missionlist_solo_ing());     
	        mav.addObject("zeroshoplist", zero_service.zeroshoplist());
	        return mav;  
	    }
	
}