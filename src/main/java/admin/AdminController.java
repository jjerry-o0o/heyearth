package admin;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import comment.CommentDTO;
import member.MemberDTO;
import mission.MissionDTO;
import participation.ParticipationDTO;
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

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setS_photo(mf.getOriginalFilename());
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
	
	/*미션 리뷰관리*/
	@RequestMapping("/adminmissionreview")
	public ModelAndView adminmissionreview(int code){
		ModelAndView mv = new ModelAndView();
		List<MissionDTO> reviewlist = adminservice.missionreviewlist(code);
		if(reviewlist.isEmpty()) {
			MissionDTO dto = new MissionDTO();
			dto.setM_name("none");
			reviewlist.add(dto);
		}
		mv.addObject("reviewlist",reviewlist);
		mv.setViewName("admin/adminreviewlist");
		return mv;
	}
	
	@RequestMapping("/adminreviewdel")
	public String reviewdel(int code) {
		int m_code = adminservice.mcodetopcode(code);
		// 리뷰를 삭제하면 
		// (1) 멤버의 point 줄어들고
		adminservice.adminmemberpoint(code);
		// (2) carbon 줄어들고
		adminservice.adminmembercarbon(code);
		// (3) grade 줄어들수도..?
		
		
		// 리뷰 삭제하기
		adminservice.adminreviewdel(code);
		
		
		return "redirect:/adminmissionreview?code="+m_code;
	}
	
	@RequestMapping("/adminreviewmod")
	public ModelAndView reviewmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO reviewinfo = adminservice.adminreviewinfo(code);
		
		mv.addObject("reviewinfo",reviewinfo);
		mv.setViewName("admin/adminreviewmod");
		return mv;
	}
	
	@RequestMapping("/adminreviewmodinfo")
	public String adminreviewmodinfo(@ModelAttribute("") MissionDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setP_photo(mf.getOriginalFilename());
		}
		
		if(dto.getStar().length()==0) {
			dto.setStar(null);
		}
		
		if(dto.getP_review().length()==0) {
			dto.setP_review(null);
		}
		
		adminservice.updatereview(dto);
		
		return "redirect:/adminmissionreview?code="+dto.getM_code();
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
		}else {
			dto.setR_photo("loading.png");
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
		
		if(dto.getR_class().equals("direct")) {
			dto.setR_class(dto.getSelboxDirect());
		}
		
		adminservice.updateguide(dto);
		
		return "redirect:/adminguide";
	}
	
	
	
	
	
	/*게시판 관리*/
	@RequestMapping("/adminboard")
	public ModelAndView adminboard() throws ParseException {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> boardlist = adminservice.adminboardlist("not");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(int i=0;i<boardlist.size();i++) {			
			String currentDate = dateFormat.format(boardlist.get(i).getB_regdate());
			boardlist.get(i).setRegdate(currentDate);
		}
		mv.addObject("boardlist",boardlist);
		mv.setViewName("admin/adminboard");
		return mv;
	}
	
	@RequestMapping("/adminboardlist")
	@ResponseBody
	public List<BoardDTO> adminboardlist(String b_type){
		List<BoardDTO> boardlist = adminservice.adminboardlist(b_type);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(int i=0;i<boardlist.size();i++) {			
			String currentDate = dateFormat.format(boardlist.get(i).getB_regdate());
			boardlist.get(i).setRegdate(currentDate);
		}
		return boardlist;
	}
	
	@RequestMapping("/adminboarddel")
	public String boarddel(int code) {
		adminservice.adminboarddel(code);
		return "redirect:/adminboard";
	}
	
	@RequestMapping("/adminboardmod")
	public ModelAndView boardmod(int code) {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardinfo = adminservice.adminboardinfo(code);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");		
		String currentDate = dateFormat.format(boardinfo.getB_regdate());
		boardinfo.setRegdate(currentDate);
		
		if(boardinfo.getB_img()==null) { 
			boardinfo.setB_img("none"); 
		}
		
		mv.addObject("boardinfo",boardinfo);
		mv.setViewName("admin/adminboardmod");
		return mv;
	}
	
	@RequestMapping("/adminboardinsert")
	public String boardinsert() {
		return "admin/adminboardinsert";
	}
	
	@RequestMapping("/adminboardinsertinfo")
	public String adminboardinsertinfo(@ModelAttribute("") BoardDTO dto, HttpServletRequest request) throws Exception{
		MultipartFile mf = dto.getFile();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setB_img(mf.getOriginalFilename());
		}else {
			dto.setB_img(null);
		}
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		dto.setId(id);
		
		
		adminservice.insertboard(dto);
		
		return "redirect:/adminboard";
	}
	
	@RequestMapping("/adminboardmodinfo")
	public String adminboardmodinfo(@ModelAttribute("") BoardDTO dto) throws Exception{
		MultipartFile mf = dto.getFile();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setB_img(mf.getOriginalFilename());
		}
		else if(dto.getB_img().equals("none")) {
			dto.setB_img(null);
		}
		
		adminservice.updateboard(dto);
		
		return "redirect:/adminboard";
	}
	
	
	
	
	
	
	/*댓글관리*/
	@RequestMapping("/admincomment")
	public ModelAndView admincomment(int code) {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardinfo = adminservice.adminboardinfo(code);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");		
		String currentDate = dateFormat.format(boardinfo.getB_regdate());
		boardinfo.setRegdate(currentDate);
		/*if(boardinfo.getB_img()==null) {
			boardinfo.setB_img("none");
		}*/
		
		mv.addObject("boardinfo",boardinfo);
		mv.setViewName("admin/admincomment");
		return mv;
	}
	
	@RequestMapping("/admincommentinsert")
	@ResponseBody
	public void admincommentinsert(String c_comment, String id, int b_no ) {
		CommentDTO dto = new CommentDTO();
		dto.setB_no(b_no);
		dto.setC_comment(c_comment);
		dto.setId(id);
		adminservice.admincommentinsert(dto);
	}

	@RequestMapping("/admincommentlist")
	@ResponseBody
	public List<CommentDTO> admincommentlist(int b_no){
		
		List<CommentDTO> dto = adminservice.commentlist(b_no);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");		
		for(int i=0;i<dto.size();i++) {
			String currentDate = dateFormat.format(dto.get(i).getC_regdate());
			dto.get(i).setRegdate(currentDate);			
		}
		
		return dto;
		
	}
	
	@RequestMapping("/admincommentupdate")
	@ResponseBody
	public void admincommentupdate(int c_index, String c_comment) {
		System.out.println("변경");
		adminservice.admincommentupdate(c_index,c_comment);
	}
	
	@RequestMapping("/admincommentdelete")
	@ResponseBody
	public void admincommentdelete(int c_index) {
		adminservice.admincommentdelete(c_index);
	}
	
	
	
	
	
	
	/*회원 관리*/
	@RequestMapping("/adminmember")
	public ModelAndView adminmember() {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> memberlist = adminservice.adminmemberlist();
		mv.addObject("memberlist",memberlist);
		mv.setViewName("admin/adminmember");
		return mv;
	}
	
	@RequestMapping("/adminmemberdel")
	public String memberdel(String id) {
		int delnum = adminservice.admindeletenum() + 1;
		String withdrawId = "탈퇴한 회원"+delnum;
		adminservice.adminmemberdel(id, withdrawId);
		return "redirect:/adminmember";
	}
	
	@RequestMapping("/adminmembermod")
	public ModelAndView membermod(String id) {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberinfo = adminservice.adminmembermod(id);
		/*if(memberinfo.getPhoto() == null) {
			memberinfo.setPhoto("none");
		}*/
		
		mv.addObject("memberinfo", memberinfo);
		mv.setViewName("admin/adminmembermod");
		return mv;
	}
	
	@RequestMapping("/adminmemberboard")
	public ModelAndView memberboard(String id) {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> boardlist = adminservice.adminmemberboard(id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(int i=0;i<boardlist.size();i++) {			
			String currentDate = dateFormat.format(boardlist.get(i).getB_regdate());
			boardlist.get(i).setRegdate(currentDate);
		}
		if(boardlist.isEmpty()) {
			BoardDTO dto = new BoardDTO();
			dto.setId(id);
			dto.setB_title(null);
			boardlist.add(dto);
		}
		mv.addObject("boardlist",boardlist);
		mv.setViewName("admin/adminmemberboard");
		return mv;
	}
	
	/*
	@RequestMapping("/adminmembercomment")
	public ModelAndView membercomment(String id) {
		ModelAndView mv = new ModelAndView();
		List<CommentDTO> commentlist = adminservice.adminmembercomment(id);
		mv.addObject("commentlist",commentlist);
		mv.setViewName("admin/adminmembercomment");
		return mv;
	}*/
	
	@RequestMapping("/adminmembermission")
	public ModelAndView membermission(String id) {
		ModelAndView mv = new ModelAndView();
		List<MissionDTO> missionlist = adminservice.adminmembermission(id);
		int solo=0;
		int group=0;
		for(int i=0;i<missionlist.size();i++) {
			if(missionlist.get(i).getM_type().equals("solo")) {
				solo += 1;
			}else {
				group += 1;
			}
		}
		if(solo ==0) {
			MissionDTO dto = new MissionDTO();
			dto.setM_name("none");
			dto.setM_type("solo");
			dto.setId(id);
			missionlist.add(dto);
		}
		if(group == 0) {
			MissionDTO dto = new MissionDTO();
			dto.setM_name("none");
			dto.setM_type("group");
			dto.setId(id);
			missionlist.add(dto);
		}
		mv.addObject("missionlist",missionlist);
		mv.setViewName("admin/adminmembermission");
		return mv;
	}
	
	@RequestMapping("/adminmemberboardlist")
	@ResponseBody
	public List<BoardDTO> adminmemberboardlist(String b_type, String id){
		List<BoardDTO> boardlist = adminservice.adminmemberboardlist(b_type,id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(int i=0;i<boardlist.size();i++) {			
			String currentDate = dateFormat.format(boardlist.get(i).getB_regdate());
			boardlist.get(i).setRegdate(currentDate);
		}

		return boardlist;
	}
	
	@RequestMapping("/adminmembermodinfo")
	public String adminmembermodinfo(@ModelAttribute("") MemberDTO dto) throws Exception{
		/*MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setPhoto(mf.getOriginalFilename());
		}
		else if(dto.getPhoto().equals("none")) {
			dto.setPhoto(null);
		}*/
		
		adminservice.updatemember(dto);
		
		return "redirect:/adminmember";
	}
	
	@RequestMapping("/adminmemberboarddel")
	public String memberboarddel(int code) throws UnsupportedEncodingException {
		BoardDTO dto = adminservice.adminboardinfo(code);
		adminservice.adminboarddel(code);
		String id = dto.getId();
		id = URLEncoder.encode(id,"UTF-8");
		return "redirect:/adminmemberboard?id="+id;
	}
	
	@RequestMapping("/adminmemberboardmod")
	public ModelAndView memberboardmod(int code) {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardinfo = adminservice.adminboardinfo(code);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");		
		String currentDate = dateFormat.format(boardinfo.getB_regdate());
		boardinfo.setRegdate(currentDate);
		
		if(boardinfo.getB_img()==null) { 
			boardinfo.setB_img("none"); 
		}
		
		mv.addObject("boardinfo",boardinfo);
		mv.setViewName("admin/adminmemberboardmod");
		return mv;
	}
	
	@RequestMapping("/adminmemberboardmodinfo")
	public String adminmemberboardmodinfo(@ModelAttribute("") BoardDTO dto) throws Exception{
		MultipartFile mf = dto.getFile();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setB_img(mf.getOriginalFilename());
		}
		else if(dto.getB_img().equals("none")) {
			dto.setB_img(null);
		}
		
		adminservice.updateboard(dto);
		
		String id= dto.getId();
		id = URLEncoder.encode(id,"UTF-8");
		
		return "redirect:/adminmemberboard?id="+id;
	}
	
	@RequestMapping("/adminmembermissiondel")
	public String membermissiondel(int code) throws UnsupportedEncodingException {
		String id = adminservice.idtopcode(code);
		// 리뷰를 삭제하면 
		// (1) 멤버의 point 줄어들고
		adminservice.adminmemberpoint(code);
		// (2) carbon 줄어들고
		adminservice.adminmembercarbon(code);
		// (3) grade 줄어들수도..?
		
		// 리뷰 삭제하기
		adminservice.adminreviewdel(code);
		
		id = URLEncoder.encode(id,"UTF-8");
		
		return "redirect:/adminmembermission?id="+id;
	}
	
	@RequestMapping("/adminmembermissionmod")
	public ModelAndView membermissionmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO reviewinfo = adminservice.adminreviewinfo(code);
		
		mv.addObject("reviewinfo",reviewinfo);
		mv.setViewName("admin/adminmembermissionmod");
		return mv;
	}
	
	@RequestMapping("/adminmembermissionmodinfo")
	public String adminmembermissionmodinfo(@ModelAttribute("") MissionDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setP_photo(mf.getOriginalFilename());
		}
		
		if(dto.getStar().length()==0) {
			dto.setStar(null);
		}
		
		if(dto.getP_review().length()==0) {
			dto.setP_review(null);
		}
		
		adminservice.updatereview(dto);
		
		String id = dto.getId();
		id = URLEncoder.encode(id,"utf-8");
		
		return "redirect:/adminmembermission?id="+id;
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
		/*
		 * if(admininfo.getPhoto()==null) { admininfo.setPhoto("member.png"); }
		 */
		
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
		/*
		 * if(admininfo.getPhoto()==null) { admininfo.setPhoto("member.png"); }
		 */
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("admininfo",admininfo);
		mv.setViewName("admin/adminmypagemod");
		return mv;
	}
	
	@RequestMapping("/adminmypagemodinfo")
	public String adminmypagemodinfo(@ModelAttribute("") MemberDTO dto,HttpServletRequest request) throws Exception {
		/*
		 * MultipartFile mf = dto.getImage();
		 * 
		 * if(!mf.isEmpty()) { Path currentPath = Paths.get(""); String path =
		 * currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/";
		 * path = path.replace("\\", "/");
		 * 
		 * File serverfile = new File(path + mf.getOriginalFilename());
		 * mf.transferTo(serverfile); dto.setPhoto(mf.getOriginalFilename()); }
		 */
		
		
		if(dto.getPw().length()==0) {
			String pw = adminservice.searchpw(dto.getId());
			dto.setPw(pw);
		}
		if(dto.getPhone().length()==0) {
			dto.setPhone(null);
		}
		
		adminservice.updateadmin(dto);
		
		
		return "redirect:/adminmypage";
	}
	
}
