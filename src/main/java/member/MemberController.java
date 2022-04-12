package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
	
	//회원가입 - 닉네임 체크 컨트롤러
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.POST)
	public @ResponseBody int nicknameCheck(@RequestParam(value="id") String id) {
		System.out.println(id);
		return service.nicknameCheck(id);
	}
	
	//회원가입 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinmember(MemberDTO dto) {
		ModelAndView mv = new ModelAndView();
		System.out.println(dto.getId());
		
		int result = service.joinmember(dto);
		System.out.println(dto.getId());
		
		mv.addObject("userdto", dto);
		mv.addObject("result", result);
		mv.setViewName("/member/joinresult");
		return mv;
	}
	
	//로그인 뷰 컨트롤러
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginform() {
		return "member/login";
	}
	
}
