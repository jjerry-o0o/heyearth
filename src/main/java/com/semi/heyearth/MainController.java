package com.semi.heyearth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
		
		@RequestMapping("/")
		public String main() {
			return "main";
		}
		@RequestMapping("/about")
		public String about() {
			return "about";
		}
		
		
	}