
package zerokit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import participation.ParticipationService;
import participation.ParticipationServiceImpl;

@Controller
public class ZerokitController {

	@Autowired
	@Qualifier("zerokitservice")
	ZerokitService zerokitservice = new ZerokitServiceImpl();

	// 제로키트 페이지
//	@GetMapping("/zerokit")
//	public String zerokitlist() {
//		return "zerokit/zerokit";
//	}
	
//@RequestMapping(value = "/zerokit", method = RequestMethod.GET)
//public String zerokit() {
//	return "zerokit/zerokit";
//}


	// 제로키트 목록
	// 환경지킴이 미션 목록
	@RequestMapping("/zerokit")
	public ModelAndView zerokitlist(ModelAndView mav) {
		mav.setViewName("zerokit/zerokit");
	
		 mav.addObject("zerokitlist", zerokitservice.zerokitlist());//모집 단체 목록
		 System.out.println("---");
		return mav;
	}

}
