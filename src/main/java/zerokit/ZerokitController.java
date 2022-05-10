
package zerokit;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZerokitController {


	@Qualifier("zerokitservice")
	ZerokitService recyclingservice;

	// 이건 어떻게 버릴까? 페이지

//	@RequestMapping(value = "/zerokit", method = RequestMethod.GET)
//	public String zerokit() {
//		return "zerokit/zerokit";
//	}


	

}
