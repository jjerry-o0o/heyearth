package carbon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarbonController {

	@RequestMapping("/carbon")
	public String carbon() {
		return "carbon/carbon";
	}
}
