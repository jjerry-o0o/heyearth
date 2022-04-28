package mission;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import participation.ParticipationDTO;
import participation.ParticipationService;
import participation.ParticipationServiceImpl;


@Controller
public class MissionController {
	
	@Autowired
	@Qualifier("missionservice")
	MissionService missionservice = new MissionServiceImpl();
	
	
	   //환경지킴이 미션 목록
	   @RequestMapping("/mission") 
	   public ModelAndView missionlist(ModelAndView mav) {
	        mav.setViewName("mission/mission");
	        mav.addObject("gilist", missionservice.missionlist_group_ing());//모집 단체 목록
	        mav.addObject("gelist", missionservice.missionlist_group_end());//마감 단체 목록
	        mav.addObject("silist", missionservice.missionlist_solo_ing());//모집 상시 목록
	        mav.addObject("selist", missionservice.missionlist_solo_end());//마감 상시 목록 
	        return mav;  
	    }
	
	   
	   //미션 상세페이지
	   @RequestMapping("/mission_detail/{m_code}")
	    public ModelAndView mission_group(@PathVariable("m_code") int m_code,  HttpSession session, String m_name, ModelAndView mav) {
		   mav.setViewName("mission/mission_detail");
		   MissionDTO dto = missionservice.missiongroup(m_code);
		   
		   mav.addObject("group",missionservice.missiongroup(m_code));//미션 상세페이지 목록
		   mav.addObject("review",missionservice.missionreview(dto.getM_name()));//리뷰 목록
		   mav.addObject("check",missionservice.missioncheck(dto.getM_name()));//미션 중복 체크(해당 미션 신청한 모든 참가목록)
		  
		   mav.setViewName("mission/mission_detail");
		   Map<String, Object> map = new HashMap<>();
		   java.util.List<MissionDTO> list = missionservice.missionreview(dto.getM_name());//별점을 준 리뷰 목록
		   map.put("count", list.size());

		   String id = (String) session.getAttribute("session_id");// 사용자 id 받아옴
		   if (id == null) {
			   System.out.println("노아이디");
			} else {							   
			   map.put("id", id);		 
			   System.out.println("check");
			}	        
		   mav.addObject("map", map);
				return mav;	
	    }


	    //단체 미션 신청하기 모달창
		@RequestMapping("/groupdetail")
		@ResponseBody
		public MissionDTO missiongroup(int m_code) {
			return missionservice.missiongroup(m_code);
		}
		
		//상시 미션 신청하기 모달창
		@RequestMapping("/solodetail")
		@ResponseBody
		public MissionDTO missionsolo(int m_code) {
			return missionservice.missiongroup(m_code);
		}

			
}//Controller end