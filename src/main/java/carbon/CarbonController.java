package carbon;

import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarbonController {
	
	@Autowired
	@Qualifier("carbonservice")
	CarbonService carbonservice;

	@RequestMapping("/carbon")
	public String carbon(Model model) {
		
		List<Integer> carbonlist = carbonservice.carbonList();
		
		int sum = carbonlist.stream().mapToInt(Integer::intValue).sum();
		
		double e = (double)sum/1000;
		String result = String.format("%.2f", e);

		
		int totalPart = carbonservice.partCount();
		
		int everPart = (int)totalPart/carbonservice.memberCount();
		
		model.addAttribute("sum", result);

		model.addAttribute("totalPart", totalPart);
		model.addAttribute("everPart", everPart);
		
		return "carbon/carbon";
	}
}


