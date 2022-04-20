package admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zeroshop.ZeroshopDTO;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("adminservice")
	AdminService adminservice = new AdminServiceImpl();
	
	@RequestMapping("/adminmain")
	public String adminmain() {
		return "admin/adminmain";
	}
	
	@RequestMapping("/adminzeroshop")
	public ModelAndView adminzeroshop() {
		ModelAndView mv = new ModelAndView();
		List<ZeroshopDTO> zeroshoplist = adminservice.adminzeroshoplist();
		mv.addObject("zeroshoplist",zeroshoplist);
		mv.setViewName("admin/adminzeroshop");
		return mv;
	}
	
	@RequestMapping("/adminzeroshopdel")
	public String zeroshopdel(int code) {
		adminservice.adminzeroshopdel(code);
		return "redirect:/adminzeroshop";
	}
	
	@RequestMapping("/adminzeroshopmod")
	public ModelAndView zeroshopmod(int code) {
		ModelAndView mv = new ModelAndView();
		ZeroshopDTO zeroshopinfo = adminservice.adminzeroshopinfo(code);
		mv.addObject("zeroshopinfo",zeroshopinfo);
		mv.setViewName("admin/adminzeroshopmod");
		return mv;
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "admin/jusoPopup";
	}
	
	@RequestMapping("/adminzeroshopmodinfo")
	public String adminzeroshopmodinfo(@ModelAttribute("") ZeroshopDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			/*
			 * System.out.println("현재 작업 경로: " + path);
			 * System.out.println(mf.getOriginalFilename());
			 */
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setS_photo(mf.getOriginalFilename());
		}
		/*
		 * System.out.println(dto.getS_name()); System.out.println(dto.getS_location());
		 * System.out.println(dto.getS_url()); System.out.println(dto.getS_inform());
		 * System.out.println(dto.getS_hour()); System.out.println(dto.getS_close());
		 * System.out.println(dto.getS_call()); System.out.println(dto.getS_code());
		 * System.out.println(dto.getS_photo());
		 */
		
		String[] address = dto.getS_location().split(" ");
		boolean checkloc = adminservice.checkloccode(address[0], address[1]);
		if(!checkloc) { // location db에 이미 정보가 있음
			adminservice.insertloc(address[0], address[1]);
		}
		
		int l_code = adminservice.loccode(address[0], address[1]);
		dto.setL_code(l_code);
		
		adminservice.updatezeroshop(dto);
		
		return "redirect:/adminzeroshop";
	}
	
	@RequestMapping("/adminzeroshopinsert")
	public String zeroshopinsert() {
		return "admin/adminzeroshopinsert";
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
