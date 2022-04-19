package participation;


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


@Controller
public class ParticipationController {
	
	@Autowired
	@Qualifier("participationservice")
	ParticipationService service = new ParticipationServiceImpl();
	
	//나의 미션 목록
	 @RequestMapping("/participation")
     public ModelAndView list(HttpSession session, ModelAndView mv) {

		Map<String, Object> map = new HashMap<>();
     	
     	String id=(String)session.getAttribute("session_id");
    
     	if(id!=null) { 
     		java.util.List<ParticipationDTO> list = service.participation_list(id);
     		 
             map.put("list", list);
             map.put("count", list.size()); 
             
             mv.setViewName("mypage/participation"); 
             mv.addObject("map", map); 
             
             return mv;
     	}else{
     		return new ModelAndView("member/login", "", null);
     		
     	}
	}
	
	 //미션 신청하기
	  @RequestMapping("/register") 
	  public String register(@ModelAttribute ParticipationDTO dto, HttpSession session) { // 사용자 id를 받아옴 
		  String id = (String)session.getAttribute("session_id"); 
	  if (id == null) {
	  return "member/login"; 
	  } 
	  dto.setId(id); 
	  service.participation_register(dto); 
	 return "redirect:/participation"; 
	  }
	  
	//미션 취소하기
		@RequestMapping("delete")
	    public String delete(@RequestParam int p_code) {
			service.delete(p_code);
	        return "redirect:/participation";
	    }
	 


}//Controller end