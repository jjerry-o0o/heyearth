package zeroshop;

import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZeroshopController {
	
	@Autowired
	@Qualifier("locationservice")
	LocationService loc_service = new LocationServiceImpl();
	
	@Autowired
	@Qualifier("zeroshopservice")
	ZeroshopService zero_service = new ZeroshopServiceImpl();
	
	@GetMapping("/zeroshop")
	public String zeroshoplist() {
		return "zeroshop/zeroshop";
	}
	
	@RequestMapping("/bigloc")
	@ResponseBody
	public List<String> bigloc() {
		List<String> result = loc_service.biglocation();
		return result;
	}
	
	@RequestMapping("/smallloc")
	@ResponseBody
	public List<String> smallloc(String bigloc) {
		List<String> result = loc_service.smalllocation(bigloc);
		return result;
	}
	
	@RequestMapping("/loczeroshop")
	@ResponseBody
	public List<ZeroshopDTO> loczeroshop(String bigloc,String smallloc){
		System.out.println(bigloc+smallloc);
		int l_code = zero_service.locid(bigloc, smallloc);
		List<ZeroshopDTO> dto = zero_service.loczero(l_code);
		System.out.println(dto);
		if(dto.isEmpty()) {
			ZeroshopDTO tmpdto = new ZeroshopDTO();
			tmpdto.setS_name("none");
			dto.add(tmpdto);
		}
		
		return dto;
	}
	
}
