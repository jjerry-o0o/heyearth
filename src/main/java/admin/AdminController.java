package admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import member.MemberDTO;
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
		
		if(dto.getM_name().equals("direct")) {
			dto.setM_name(dto.getSelboxDirect());
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
		
		if(dto.getM_name().equals("direct")) {
			dto.setM_name(dto.getSelboxDirect());
		}
		
		adminservice.insertmission(dto);
		
		return "redirect:/adminmission";
	}
	
	@RequestMapping("/missionname")
	@ResponseBody
	public List<String> missionname(String m_type){
		return adminservice.missionname(m_type);
	}
	
	@RequestMapping("/missioninfo1")
	@ResponseBody
	public MissionDTO missioninfo1(String m_type, String m_name) {
		return adminservice.missioninfo1(m_type,m_name);
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
	
	@RequestMapping("/adminguidedel")
	public String guidedel(int code) {
		adminservice.adminguidedel(code);
		return "redirect:/adminguide";
	}
	
	@RequestMapping("/adminguidemod")
	public ModelAndView guidemod(int code) {
		ModelAndView mv = new ModelAndView();
		RecyclingDTO guideinfo = adminservice.adminguideinfo(code);
		mv.addObject("guideinfo",guideinfo);
		mv.setViewName("admin/adminguidemod");
		return mv;
	}
	
	@RequestMapping("/adminguideinsert")
	public String guideinsert() {
		return "admin/adminguideinsert";
	}
	
	@RequestMapping("/guideclasslist")
	@ResponseBody
	public List<String> guideclasslist(){
		return adminservice.guideclasslist();
	}
	
	@RequestMapping("/adminguideinsertinfo")
	public String adminguideinsertinfo(@ModelAttribute("") RecyclingDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setR_photo(mf.getOriginalFilename());
		}
		
		if(dto.getR_class().equals("direct")) {
			dto.setR_class(dto.getSelboxDirect());
		}
		
		adminservice.insertguide(dto);
		
		return "redirect:/adminguide";
	}
	
	@RequestMapping("/adminguidemodinfo")
	public String adminguidemodinfo(@ModelAttribute("") RecyclingDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setR_photo(mf.getOriginalFilename());
		}
		else {
			dto.setR_photo("noimage.jpg");
		}
		
		if(dto.getR_class().equals("direct")) {
			dto.setR_class(dto.getSelboxDirect());
		}
		
		adminservice.updateguide(dto);
		
		return "redirect:/adminguide";
	}
	
	
	
	
	
	/*게시판 관리*/
	@RequestMapping("/adminboard")
	public ModelAndView adminboard() {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> boardlist = adminservice.adminboardlist("not");
		mv.addObject("boardlist",boardlist);
		mv.setViewName("admin/adminboard");
		return mv;
	}
	
	
	
	/*회원 관리*/
	@RequestMapping("/adminmember")
	public String adminmember() {
		return "admin/adminmember";
	}
	
	
	
	/*관리자마이페이지 관리*/
	@RequestMapping("/adminmypage")
	public ModelAndView adminmypage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		MemberDTO admininfo = adminservice.admininfo(id);
		if(admininfo.getPhone()==null) {
			admininfo.setPhone("-");
		}
		if(admininfo.getPhoto()==null) {
			admininfo.setPhoto("member.png");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("admininfo",admininfo);
		mv.setViewName("admin/adminmypage");
		return mv;
	}
	
	@RequestMapping("/admininfoupdate")
	public ModelAndView admininfoupdate(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		MemberDTO admininfo = adminservice.admininfo(id);
		if(admininfo.getPhone()==null) {
			admininfo.setPhone("");
		}
		if(admininfo.getPhoto()==null) {
			admininfo.setPhoto("member.png");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("admininfo",admininfo);
		mv.setViewName("admin/adminmypagemod");
		return mv;
	}
	
	@RequestMapping("/adminmypagemodinfo")
	public String adminmypagemodinfo(@ModelAttribute("") MemberDTO dto,HttpServletRequest request) throws Exception {
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setPhoto(mf.getOriginalFilename());
		}
		
		
		if(dto.getPw().length()==0) {
			String pw = adminservice.searchpw(dto.getId());
			dto.setPw(pw);
		}
		if(dto.getPhone().length()==0) {
			dto.setPhone(null);
		}
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		System.out.println(dto.getPhone());
		System.out.println(dto.getPhoto());
		
		adminservice.updateadmin(dto);
		
		
		return "redirect:/adminmypage";
	}
	
}
