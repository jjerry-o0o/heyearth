
package zerokit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ZerokitController {

	@Autowired
	@Qualifier("zerokitservice")
	ZerokitService zerokitservice = new ZerokitServiceImpl();


@RequestMapping(value = "/zerokit", method = RequestMethod.GET)
public ModelAndView zerokit(ModelAndView mav) {
	 mav.setViewName("zerokit/zerokit");
     mav.addObject("zerokitlist", zerokitservice.zerokitlist()); 
     return mav;  
}

@RequestMapping(value = "/zerokitdetail", method = RequestMethod.GET)
@ResponseBody
public ZerokitDTO zerokitdetail(int k_code){
	return zerokitservice.zerokit(k_code);
	
}


}
