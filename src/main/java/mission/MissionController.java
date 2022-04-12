package mission;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MissionController {
	
	@RequestMapping("/mission")
	public String mission() {
		return "mission/mission";
	}
	
}
