package admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/adminmain")
	public String adminmain() {
		return "admin/adminmain";
	}
	
	@RequestMapping("/adminzeroshop")
	public String adminzeroshop() {
		return "admin/adminzeroshop";
	}
	
	@RequestMapping("/adminmission")
	public String adminmission() {
		return "admin/adminmission";
	}
	
	@RequestMapping("/adminguide")
	public String adminguide() {
		return "admin/adminguide";
	}
	
	@RequestMapping("/adminboard")
	public String adminboard() {
		return "admin/adminboard";
	}
	
	@RequestMapping("/adminmember")
	public String adminmember() {
		return "admin/adminmember";
	}
	
	@RequestMapping("/adminmypage")
	public String adminmypage() {
		return "admin/adminmypage";
	}
}
