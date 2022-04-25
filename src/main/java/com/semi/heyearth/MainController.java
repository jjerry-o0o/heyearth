package com.semi.heyearth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import carbon.CarbonService;
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
	
	@Autowired
	@Qualifier("carbonservice")
	CarbonService carbonservice;
	
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
		
		List<Integer> carbonlist = carbonservice.carbonList();
		
		int sum = carbonlist.stream().mapToInt(Integer::intValue).sum();
		
		int n = 2;
		double n2 = Math.pow(10.0, n);
		double e = (double)sum/1000;
		double r = Math.round((e*n2)/n2);
     
		
		int totalPart = carbonservice.partCount();
		
		int everPart = (int)totalPart/carbonservice.memberCount();
		
	        mav.setViewName("main");
	        mav.addObject("gilist", missionservice.missionlist_group_ing());     
	        mav.addObject("silist", missionservice.missionlist_solo_ing());     
	        mav.addObject("zeroshoplist", zero_service.zeroshoplist());
	        mav.addObject("sum", r);
	        mav.addObject("totalPart", totalPart);
	        mav.addObject("everPart", everPart);
	        
	        return mav;  
	    }
	
}