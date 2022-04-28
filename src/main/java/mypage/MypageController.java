package mypage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestBody;

import board.BoardDTO;
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
	
	 
	  //나의 가이드 스크랩
		 @RequestMapping("/guide_insert")
			public ModelAndView register(@ModelAttribute MyguideDTO dto, HttpSession session, ModelAndView mv) {
				String id = (String) session.getAttribute("session_id");
				if (id == null) {
					return new ModelAndView("member/login", "", null);
				}
				dto.setId(id);
				int result = myguideservice.guide_insert(dto);
				System.out.println(result);
				System.out.println("====");
				mv.addObject("dto", dto);
				mv.addObject("result", result);
				mv.setViewName("recycling/recycling");
				return mv;
				/* "redirect:/recycling"; */
			}
		 
	       	// 스크랩 삭제하기
					@RequestMapping(value="/delete_guide")
					public String delete(@RequestParam int mg_code, MyguideDTO dto) {
						myguideservice.delete(mg_code); 
						return "redirect:/mypage";
					}
					
					
					
					 //나의 가이드 목록
					@RequestMapping(value="/myguide", method = RequestMethod.POST)
					 @ResponseBody
					 public List <MyguideDTO> guide_list(@RequestParam String id) {
						List<MyguideDTO> list = myguideservice.guide_list(id);
				
							return list;
					}
					 
					 


}//Controller
