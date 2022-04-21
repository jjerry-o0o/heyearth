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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mission.MissionDTO;
import recycling.RecyclingDTO;
import zeroshop.ZeroshopDTO;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("adminservice")
	AdminService adminservice = new AdminServiceImpl();
	
	
	/*관리자 메인*/
	@RequestMapping("/adminmain")
	public String adminmain() {
		return "admin/adminmain";
	}
	
	
	/*제로샵 관리*/
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
		
		if(dto.getS_call().length() == 0) {
			dto.setS_call(null);
		}
		if(dto.getS_close().length() == 0) {
			dto.setS_close(null);
		}
		if(dto.getS_hour().length() == 0) {
			dto.setS_hour(null);
		}
		
		adminservice.updatezeroshop(dto);
		
		return "redirect:/adminzeroshop";
	}
	
	@RequestMapping("/adminzeroshopinsert")
	public String zeroshopinsert() {
		return "admin/adminzeroshopinsert";
	}
	
	@RequestMapping("/adminzeroshopinsertinfo")
	public String adminzeroshopinsertinfo(@ModelAttribute("") ZeroshopDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setS_photo(mf.getOriginalFilename());
		}else {
			dto.setS_photo("zeroshop1.jpg");
		}
		
		String[] address = dto.getS_location().split(" ");
		boolean checkloc = adminservice.checkloccode(address[0], address[1]);
		if(!checkloc) { // location db에 이미 정보가 있음
			adminservice.insertloc(address[0], address[1]);
		}
		
		int l_code = adminservice.loccode(address[0], address[1]);
		dto.setL_code(l_code);
		
		
		if(dto.getS_call().length() == 0) {
			dto.setS_call(null);
		}
		if(dto.getS_close().length() == 0) {
			dto.setS_close(null);
		}
		if(dto.getS_hour().length() == 0) {
			dto.setS_hour(null);
		}
		
		adminservice.insertzeroshop(dto);
		
		
		return "redirect:/adminzeroshop";
	}
	
	
	
	/*미션 관리*/
	@RequestMapping("/adminmission")
	public ModelAndView adminmission() {
		ModelAndView mv = new ModelAndView();
		List<MissionDTO> missionlist = adminservice.adminmissionlist("group");
		mv.addObject("missionlist",missionlist);
		mv.setViewName("admin/adminmission");
		return mv;
	}
	
	@RequestMapping("/adminmissionlist")
	@ResponseBody
	public List<MissionDTO> adminmissionlist(String m_type){
		return adminservice.adminmissionlist(m_type);
	}
	
	@RequestMapping("/adminmissiondel")
	public String missiondel(int code) {
		adminservice.adminmissiondel(code);
		return "redirect:/adminmission";
	}
	
	@RequestMapping("/adminmissionmod")
	public ModelAndView missionmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO missioninfo = adminservice.adminmissioninfo(code);
		mv.addObject("missioninfo",missioninfo);
		mv.setViewName("admin/adminmissionmod");
		return mv;
	}
	
	@RequestMapping("/adminmissioninsert")
	public String missioninsert() {
		return "admin/adminmissioninsert";
	}
	
	@RequestMapping("/adminmissionmodinfo")
	public String adminmissionmodinfo(@ModelAttribute("") MissionDTO dto) throws Exception{
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
			dto.setM_photo(mf.getOriginalFilename());
		}
		
		adminservice.updatemission(dto);
		
		return "redirect:/adminmission";
	}
	
	@RequestMapping("/adminmissioninsertinfo")
	public String adminmissioninsertinfo(@ModelAttribute("") MissionDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setM_photo(mf.getOriginalFilename());
		}else {
			dto.setM_photo("eco.jpg");
		}
		
		
		adminservice.insertmission(dto);
		
		
		return "redirect:/adminmission";
	}
	
	@RequestMapping("/missionname")
	@ResponseBody
	public List<String> missionname(String m_type){
		return adminservice.missionname(m_type);
	}
	
	
	
	/*가이드 관리*/
	@RequestMapping("/adminguide")
	public ModelAndView adminguide() {
		ModelAndView mv = new ModelAndView();
		List<RecyclingDTO> guidelist = adminservice.adminguidelist();
		mv.addObject("guidelist",guidelist);
		mv.setViewName("admin/adminguide");
		return mv;
	}
	
	
	
	/*게시판 관리*/
	@RequestMapping("/adminboard")
	public String adminboard() {
		return "admin/adminboard";
	}
	
	
	
	/*회원 관리*/
	@RequestMapping("/adminmember")
	public String adminmember() {
		return "admin/adminmember";
	}
	
	
	
	/*관리자마이페이지 관리*/
	@RequestMapping("/adminmypage")
	public String adminmypage() {
		return "admin/adminmypage";
	}
	
}
