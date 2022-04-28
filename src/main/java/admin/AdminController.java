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
	
	
	/* 1.관리자 메인 */
	@RequestMapping("/adminmain")
	public String adminmain() {
		return "admin/adminmain";
	}
	
	
	/* 2.제로샵 관리 */
	/*제로샵 관리 메인*/
	@RequestMapping("/adminzeroshop")
	public ModelAndView adminzeroshop() {
		ModelAndView mv = new ModelAndView();
		List<ZeroshopDTO> zeroshoplist = adminservice.adminzeroshoplist();
		mv.addObject("zeroshoplist",zeroshoplist);
		mv.setViewName("admin/adminzeroshop");
		return mv;
	}
	
	/*제로샵 삭제*/
	@RequestMapping("/adminzeroshopdel")
	public String zeroshopdel(int code) {
		adminservice.adminzeroshopdel(code);
		return "redirect:/adminzeroshop";
	}
	
	/*제로샵 수정 페이지 띄우기*/
	@RequestMapping("/adminzeroshopmod")
	public ModelAndView zeroshopmod(int code) {
		ModelAndView mv = new ModelAndView();
		ZeroshopDTO zeroshopinfo = adminservice.adminzeroshopinfo(code);
		mv.addObject("zeroshopinfo",zeroshopinfo);
		mv.setViewName("admin/adminzeroshopmod");
		return mv;
	}
	
	/*도로명주소 팝업 띄우기*/
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "admin/jusoPopup";
	}
	
	/*제로샵 수정*/
	@RequestMapping("/adminzeroshopmodinfo")
	public String adminzeroshopmodinfo(@ModelAttribute("") ZeroshopDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		// 이미지 파일이 있을때
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);						// 서버에 이미지 저장
			dto.setS_photo(mf.getOriginalFilename());		// s_photo도 해당 이미지명으로 값 변경
		}
		
		String[] address = dto.getS_location().split(" ");
		boolean checkloc = adminservice.checkloccode(address[0], address[1]);
		if(!checkloc) { 									// location db에 해당 지역정보가 없다면
			adminservice.insertloc(address[0], address[1]);			// location 테이블에 지역정보 저장
		}
		
		int l_code = adminservice.loccode(address[0], address[1]);	// 지역정보에 맞는 지역번호 가져오기
		dto.setL_code(l_code);
		
		if(dto.getS_call().length() == 0) {					// 전화번호를 입력받지 않았다면
			dto.setS_call(null);
		}
		if(dto.getS_close().length() == 0) {				// 휴무일을 입력받지 않았다면
			dto.setS_close(null);
		}
		if(dto.getS_hour().length() == 0) {					// 영업시간을 입력받지 않았다면
			dto.setS_hour(null);
		}
		
		adminservice.updatezeroshop(dto);
		
		return "redirect:/adminzeroshop";
	}
	
	/* 제로샵 등록 페이지 띄우기*/
	@RequestMapping("/adminzeroshopinsert")
	public String zeroshopinsert() {
		return "admin/adminzeroshopinsert";
	}
	
	/*제로샵 등록*/
	@RequestMapping("/adminzeroshopinsertinfo")
	public String adminzeroshopinsertinfo(@ModelAttribute("") ZeroshopDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		// 이미지 파일이 있을때
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");
			
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);						// 서버에 이미지 저장
			dto.setS_photo(mf.getOriginalFilename());		// s_photo도 해당 이미지명으로 설정
		}else {
			dto.setS_photo("zeroshop1.jpg");				// 이미지 파일을 받아오지 않았을때 기본 이미지 설정
		}
		
		String[] address = dto.getS_location().split(" ");
		boolean checkloc = adminservice.checkloccode(address[0], address[1]);
		if(!checkloc) { 									// location db에 해당 지역정보가 없다면
			adminservice.insertloc(address[0], address[1]);			// location 테이블에 지역정보 저장
		}
		
		int l_code = adminservice.loccode(address[0], address[1]);	// 지역정보에 맞는 지역번호 가져오기
		dto.setL_code(l_code);
		
		
		if(dto.getS_call().length() == 0) {					// 전화번호를 입력받지 않았다면
			dto.setS_call(null);
		}
		if(dto.getS_close().length() == 0) {				// 휴무일을 입력받지 않았다면
			dto.setS_close(null);
		}
		if(dto.getS_hour().length() == 0) {					// 영업시간을 입력받지 않았다면
			dto.setS_hour(null);
		}
		
		adminservice.insertzeroshop(dto);
		
		
		return "redirect:/adminzeroshop";
	}
	
	
	
	/* 3.미션 관리 */
	/*미션 관리 메인*/
	@RequestMapping("/adminmission")
	public ModelAndView adminmission() {
		ModelAndView mv = new ModelAndView();
		List<MissionDTO> missionlist = adminservice.adminmissionlist("group");
		mv.addObject("missionlist",missionlist);
		mv.setViewName("admin/adminmission");
		return mv;
	}
	
	/*미션 관리 메인(ajax로 상시미션/단체미션 리스트 뿌려주기)*/
	@RequestMapping("/adminmissionlist")
	@ResponseBody
	public List<MissionDTO> adminmissionlist(String m_type){
		return adminservice.adminmissionlist(m_type);
	}
	
	/*미션 삭제*/
	@RequestMapping("/adminmissiondel")
	public String missiondel(int code) {
		adminservice.adminmissiondel(code);
		return "redirect:/adminmission";
	}
	
	/*미션 수정 페이지 띄우기*/
	@RequestMapping("/adminmissionmod")
	public ModelAndView missionmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO missioninfo = adminservice.adminmissioninfo(code);
		mv.addObject("missioninfo",missioninfo);
		mv.setViewName("admin/adminmissionmod");
		return mv;
	}
	
	/*미션 등록 페이지 띄우기*/
	@RequestMapping("/adminmissioninsert")
	public String missioninsert() {
		return "admin/adminmissioninsert";
	}
	
	/*미션 수정*/
	@RequestMapping("/adminmissionmodinfo")
	public String adminmissionmodinfo(@ModelAttribute("") MissionDTO dto) throws Exception{
		MultipartFile mf = dto.getImage();
		
		// 이미지 파일이 있을때
		if(!mf.isEmpty()) {			
			Path currentPath = Paths.get(""); 
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
			path = path.replace("\\", "/");

			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setM_photo(mf.getOriginalFilename());
		}
		
		if(dto.getM_name().equals("direct")) {				// 미션명을 직접입력한 경우
			dto.setM_name(dto.getSelboxDirect());			// selbox에 입력된 값으로 미션명 저장
		}
		
		adminservice.updatemission(dto);
		
		return "redirect:/adminmission";
	}
	
	/*미션 등록*/
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
		
		if(dto.getM_name().equals("direct")) {				// 미션명을 직접입력한 경우		
			dto.setM_name(dto.getSelboxDirect());			// selbox에 입력된 값으로 미션명 저장
		}
		
		adminservice.insertmission(dto);
		
		return "redirect:/adminmission";
	}
	
	/*DB에 저장된 단체미션 이름 리스트 가져오기*/
	@RequestMapping("/missionname")
	@ResponseBody
	public List<String> missionname(String m_type){
		return adminservice.missionname(m_type);
	}
	
	/*미션명에 맞는 미션정보 가져오기*/
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
	
	/*리뷰 삭제*/
	@RequestMapping("/adminreviewdel")
	public String reviewdel(int code) {
		int m_code = adminservice.mcodetopcode(code);
		// 멤버의 point 줄어들기
		adminservice.adminmemberpoint(code);
		// 멤버의 carbon 줄어들기
		adminservice.adminmembercarbon(code);
		
		// 리뷰 삭제하기
		adminservice.adminreviewdel(code);
		
		
		return "redirect:/adminmissionreview?code="+m_code;
	}
	
	/*리뷰 수정 페이지 띄우기*/
	@RequestMapping("/adminreviewmod")
	public ModelAndView reviewmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO reviewinfo = adminservice.adminreviewinfo(code);
		
		mv.addObject("reviewinfo",reviewinfo);
		mv.setViewName("admin/adminreviewmod");
		return mv;
	}
	
	/*리뷰 수정*/
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
	

	
	
	
	
	/* 4.가이드 관리 */
	/*가이드 관리 메인*/
	@RequestMapping("/adminguide")
	public ModelAndView adminguide() {
		ModelAndView mv = new ModelAndView();
		List<RecyclingDTO> guidelist = adminservice.adminguidelist();
		mv.addObject("guidelist",guidelist);
		mv.setViewName("admin/adminguide");
		return mv;
	}
	
	/*가이드 삭제*/
	@RequestMapping("/adminguidedel")
	public String guidedel(int code) {
		adminservice.adminguidedel(code);
		return "redirect:/adminguide";
	}
	
	/*가이드 수정 페이지 띄우기*/
	@RequestMapping("/adminguidemod")
	public ModelAndView guidemod(int code) {
		ModelAndView mv = new ModelAndView();
		RecyclingDTO guideinfo = adminservice.adminguideinfo(code);
		mv.addObject("guideinfo",guideinfo);
		mv.setViewName("admin/adminguidemod");
		return mv;
	}
	
	/*가이드 등록 페이지 띄우기*/
	@RequestMapping("/adminguideinsert")
	public String guideinsert() {
		return "admin/adminguideinsert";
	}
	
	/*가이드 분류명 리스트 보여주기*/
	@RequestMapping("/guideclasslist")
	@ResponseBody
	public List<String> guideclasslist(){
		return adminservice.guideclasslist();
	}
	
	/*가이드 등록*/
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
	
	/*가이드 수정*/
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
	
	
	
	
	
	/* 5.게시판 관리 */
	/*게시판 관리 메인*/
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
	
	/*게시판 관리 메인(ajax:게시판 분류별 리스트 보여주기)*/
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
	
	/*게시물 삭제*/
	@RequestMapping("/adminboarddel")
	public String boarddel(int code) {
		adminservice.adminboarddel(code);
		return "redirect:/adminboard";
	}
	
	/*게시물 수정 페이지 띄우기*/
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
	
	/*게시물 등록 페이지 띄우기*/
	@RequestMapping("/adminboardinsert")
	public String boardinsert() {
		return "admin/adminboardinsert";
	}
	
	/*게시물 등록*/
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
	
	/*게시물 수정*/
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
	
	
	
	
	
	
	/* 6.댓글관리 */
	/*댓글 관리 메인*/
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
	
	/*댓글 등록*/
	@RequestMapping("/admincommentinsert")
	@ResponseBody
	public void admincommentinsert(String c_comment, String id, int b_no ) {
		CommentDTO dto = new CommentDTO();
		dto.setB_no(b_no);
		dto.setC_comment(c_comment);
		dto.setId(id);
		adminservice.admincommentinsert(dto);
	}

	/*게시물별 댓글 보여주기*/
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
	
	/*댓글 수정*/
	@RequestMapping("/admincommentupdate")
	@ResponseBody
	public void admincommentupdate(int c_index, String c_comment) {
		adminservice.admincommentupdate(c_index,c_comment);
	}
	
	/*댓글 삭제*/
	@RequestMapping("/admincommentdelete")
	@ResponseBody
	public void admincommentdelete(int c_index) {
		adminservice.admincommentdelete(c_index);
	}
	
	
	
	
	
	
	/* 7.회원 관리 */
	/*회원 관리 메인*/
	@RequestMapping("/adminmember")
	public ModelAndView adminmember() {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> memberlist = adminservice.adminmemberlist();
		mv.addObject("memberlist",memberlist);
		mv.setViewName("admin/adminmember");
		return mv;
	}
	
	/*회원 탈퇴*/
	@RequestMapping("/adminmemberdel")
	public String memberdel(String id) {
		int delnum = adminservice.admindeletenum() + 1;
		String withdrawId = "탈퇴한 회원"+delnum;
		adminservice.adminmemberdel(id, withdrawId);
		return "redirect:/adminmember";
	}
	
	/*회원 정보 수정 페이지 띄우기*/
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
	
	/*회원이 쓴 게시물 페이지 띄우기*/
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
	
	/*회원이 참여한 미션&리뷰 페이지 띄우기*/
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
	
	/*회원이 쓴 게시물 페이지 띄우기*/
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
	
	/*회원 정보 수정*/
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
	
	/*회원이 쓴 게시물 삭제*/
	@RequestMapping("/adminmemberboarddel")
	public String memberboarddel(int code) throws UnsupportedEncodingException {
		BoardDTO dto = adminservice.adminboardinfo(code);
		adminservice.adminboarddel(code);
		String id = dto.getId();
		id = URLEncoder.encode(id,"UTF-8");
		return "redirect:/adminmemberboard?id="+id;
	}
	
	/*회원이 쓴 게시물 수정 페이지 띄우기*/
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
	
	/*회원이 쓴 게시물 수정*/
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
	
	/*회원이 쓴 리뷰 삭제*/
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
	
	/*회원이 참여한 미션&리뷰 수정 페이지 띄우기*/
	@RequestMapping("/adminmembermissionmod")
	public ModelAndView membermissionmod(int code) {
		ModelAndView mv = new ModelAndView();
		MissionDTO reviewinfo = adminservice.adminreviewinfo(code);
		
		mv.addObject("reviewinfo",reviewinfo);
		mv.setViewName("admin/adminmembermissionmod");
		return mv;
	}
	
	/*회원이 참여한 미션&리뷰 수정*/
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
	
	
	
	
	
	
	
	
	/* 8.관리자마이페이지 관리 */
	/*관리자 마이페이지 메인*/
	@RequestMapping("/adminmypage")
	public ModelAndView adminmypage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		MemberDTO admininfo = adminservice.admininfo(id);
		if(admininfo.getPhone()==null) {
			admininfo.setPhone("-");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("admininfo",admininfo);
		mv.setViewName("admin/adminmypage");
		return mv;
	}
	
	/*관리자 마이페이지 수정 페이지 띄우기*/
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
	
	/*관리자 정보 수정*/
	@RequestMapping("/adminmypagemodinfo")
	public String adminmypagemodinfo(@ModelAttribute("") MemberDTO dto,HttpServletRequest request) throws Exception {
		
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
