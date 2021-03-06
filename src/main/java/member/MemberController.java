package member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	//회원가입 뷰 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinform() {
		return "member/join";
	}
	
	//회원가입 - 닉네임 중복체크 컨트롤러
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.POST)
	public @ResponseBody int nicknameCheck(@RequestParam(value="id") String id) {
		return service.nicknameCheck(id);
	}
	
	//회원가입 기능 구현 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinmember(MemberDTO dto) {
		ModelAndView mv = new ModelAndView();
		int result = service.joinmember(dto);
		mv.addObject("userdto", dto);
		mv.addObject("result", result);
		mv.setViewName("member/login");
		return mv;
	}
	
	//회원가입 - 전화번호 중복 체크 컨트롤러
	@RequestMapping(value="/phoneCheck", method=RequestMethod.POST)
	@ResponseBody
	public int phoneCheck(@RequestParam(value="phone") String phone) {
		return service.phoneCheck(phone);
	}
	
	//로그인 뷰 컨트롤러
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginform() {
		return "member/login";
	}
	
	//로그인 기능 구현 컨트롤러
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginmember(String id, String pw, HttpServletRequest request, Model model, HttpServletResponse response) {
		MemberDTO userdto = service.loginmember(id, pw);
		
		if(userdto == null) { //로그인 실패인 경우
			model.addAttribute("msg", "일치하는 정보가 없습니다");
			return "member/login";
		}else if(userdto.admin == 1){ //관리자 로그인인 경우
			HttpSession session = request.getSession();
			session.setAttribute("session_id", userdto.getId());
			Cookie idCookie = new Cookie("id",userdto.getId());
			idCookie.setPath("/");
			idCookie.setMaxAge(60*60*24);  // 하루 동안 유지
			response.addCookie(idCookie);
			
			//return "admin/adminmain";
			return "redirect:http://localhost:3000/adminmain";
		}else if(!userdto.del.equals("Y") && !userdto.del.equals("N")) {
			int delnum = service.deletenum() + 1;
			String withdrawId = "탈퇴한 회원"+delnum;
			service.deletemember(id, withdrawId);
			String delreason = service.delreason(userdto.del);
			model.addAttribute("del",delreason);
			return "member/login";
		}
		else { // 로그인 성공인 경우	
			HttpSession session = request.getSession();
			session.setAttribute("session_id", userdto.getId());
			service.joindate(userdto.getId());
			return "redirect:/";
		}
	}
	
	//로그아웃 기능 구현 컨트롤러
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypagealert(String id, HttpSession session) {
		id = (String) session.getAttribute("session_id");
			MemberDTO userdto = service.memberView(id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("userdto", userdto);
			System.out.println("dd");
			mv.setViewName("mypage/mypage");
			return mv;
	}
	
	//마이페이지 DB연결
	@GetMapping("modifymypage")
	@ResponseBody
	public MemberDTO mypage(String id) {
		MemberDTO userdto = service.memberView(id);
		return userdto;
	}
	
	//마이페이지 회원정보 수정 - 비밀번호 확인
	@RequestMapping(value="/pwck", method=RequestMethod.POST)
	public @ResponseBody int pwck(@RequestParam(value="pw2") String pw) {
		int result = service.pwck(pw);
		return result;
	}
	
	//마이페이지 회원정보 수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView updatemember(@RequestParam(value="userId") String id,
			@RequestParam(value="newpw") String newpw,
			@RequestParam(value="phone") String phone) {

		int result = service.updatemember(id,newpw,phone);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("mypage/mypage");
		return mv;
	}
	
	//마이페이지 회원탈퇴
	@RequestMapping("/deletemember")
	public String deleteresult(@RequestParam(value="id") String id,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		int delnum = service.deletenum() + 1;
		String withdrawId = "탈퇴한 회원"+delnum;
		int result = service.deletemember(id, withdrawId);
		System.out.println(result);
		if(result == 1) {
			session.invalidate();
			return "redirect:/main"; 
		}else {
			return "redirect:/mypage/mypage"; 
		}
	}
	
	//닉네임 찾기 화면 뷰 컨트롤러
	@RequestMapping("findid")
	public String findidform() {
		return "member/findid";
	}

	//닉네임 찾기 기능 구현
	@RequestMapping(value="findid", method=RequestMethod.POST)
	public ModelAndView findid(@RequestParam(value="phone") String phone) {
		ModelAndView mv = new ModelAndView();
		String userid = service.findid(phone);
		System.out.println(userid);
		mv.addObject("userid",userid);
		mv.setViewName("member/findidresult");
		return mv;
	}
	
	//비밀번호 찾기 화면 뷰 컨트롤러
	@RequestMapping("findpw")
	public String findpwform() {
		return "member/findpw";
	}
	
	//비밀번호 찾기 기능 구현
	@RequestMapping(value="findpw", method=RequestMethod.POST)
	public ModelAndView findpw(@RequestParam(value="id") String id, @RequestParam(value="phone") String phone) {
		ModelAndView mv = new ModelAndView();
		String pw = service.findpw(id, phone);
		mv.addObject("userpw", pw);
		mv.setViewName("member/findpwresult");
		return mv;
	}

}
