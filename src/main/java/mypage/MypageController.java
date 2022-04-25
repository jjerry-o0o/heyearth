package mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import participation.ParticipationDTO;
import participation.ParticipationService;
import participation.ParticipationServiceImpl;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("myguideservice")
	MyguideService myguideservice = new MyguideServiceImpl();
	

	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	  //나의 가이드 목록
		 @RequestMapping("/myguide")
	     public ModelAndView list(HttpSession session, ModelAndView mv) {

			Map<String, Object> map = new HashMap<>();
			String id = (String) session.getAttribute("session_id");
			if (id != null) {
				java.util.List<MyguideDTO> list = myguideservice.guide_list(id);
				map.put("list", list);
				mv.setViewName("mypage/myguide");
				mv.addObject("map", map);
				return mv;
			} else {
				return new ModelAndView("member/login", "", null);
			}
		 }
		 
	  //나의 가이드 스크랩
		 @RequestMapping("/guide_insert")
			public String register(@ModelAttribute MyguideDTO dto, HttpSession session) {
				String id = (String) session.getAttribute("session_id");
				if (id == null) {
					return "member/login";
				}
				dto.setId(id);
				myguideservice.guide_insert(dto); 
				return "redirect:/recycling";
			}
		 
		// 스크랩 삭제하기
					@RequestMapping("delete_guide")
					public String delete(@RequestParam int mg_code, MyguideDTO dto) {
						myguideservice.delete(mg_code); 
						return "redirect:/myguide";
					}


}//Controller
