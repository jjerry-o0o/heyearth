package particapation;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ParticapationController {
	
	@Autowired
	@Qualifier("missionservice")
	ParticipationService missionservice = new ParticipationServiceImpl();
	
	 @RequestMapping("/mission") 
	 public ModelAndView missionlist(ModelAndView mav) {
	        mav.setViewName("mission/mission");
	        mav.addObject("list", missionservice.missionlist());     
	        return mav;  
	    }
	 
	  @RequestMapping("/mission_group/{m_code}")
	    public ModelAndView mission_group(@PathVariable("m_code") int m_code, ModelAndView mav) {
	        mav.setViewName("mission/mission_group");
	        mav.addObject("group",missionservice.missiongroup(m_code));
	        return mav;
	    }
	
}
