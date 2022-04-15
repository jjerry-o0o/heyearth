package recycling;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RecyclingController {

	@RequestMapping(value="/recycling", method=RequestMethod.GET)
	public String recycling() {
		return "recycling/recycling";
	}
	
	@RequestMapping(value="/recycling", method=RequestMethod.POST)
	public ModelAndView recyclingupload(@RequestParam("uploadFile") MultipartFile uploadFile) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		if(!uploadFile.isEmpty()) {
			//파일 이름 가공
			String originalFileName = uploadFile.getOriginalFilename();
			int index = originalFileName.lastIndexOf(".");
			String fileName = originalFileName.substring(0, index);
			String ext = originalFileName.substring(index);
			String savedFileName = fileName + "_" + UUID.randomUUID().toString().substring(0, 8) + ext;
			
			String savePath = "c:/upload/";
			
			//파일 저장
			File saveFile = new File(savePath+savedFileName); 
			uploadFile.transferTo(saveFile);
			System.out.println(saveFile);
			
			mv.addObject("saveFile", saveFile);
			mv.setViewName("recycling/recycling");
		}
		
		return mv;
	}
}
