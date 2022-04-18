package recycling;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gcp.vision.CloudVisionTemplate;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature.Type;


@Controller
public class RecyclingController {
	
	@Autowired private ResourceLoader resourceLoader;

	@Autowired private CloudVisionTemplate cloudVisionTemplate;

	@RequestMapping(value="/recycling", method=RequestMethod.GET)
	public String recycling() {
		return "recycling/recycling";
	}
	
	@RequestMapping(value="/recycling", method=RequestMethod.POST)
	@ResponseBody
	public String recyclingupload(@RequestParam("uploadFile") MultipartFile uploadFile) throws IOException {
		String savedFileName = null;
		if(!uploadFile.isEmpty()) {
			//파일 이름 가공
			String originalFileName = uploadFile.getOriginalFilename();
			int index = originalFileName.lastIndexOf(".");
			String fileName = originalFileName.substring(0, index);
			String ext = originalFileName.substring(index);
			savedFileName = fileName + "_" + UUID.randomUUID().toString().substring(0, 8) + ext;
			
			String savePath = "c:/upload/";
			
			//파일 저장
			File saveFile = new File(savePath+savedFileName); 
			uploadFile.transferTo(saveFile);
		}
		return savedFileName;
	}
	
	@PostMapping("/extractLabels")
	public ModelAndView extractLabels(String imageUrl, ModelMap map) {
		imageUrl = "http://localhost:8080/img/main-polarbear.jpg";
		AnnotateImageResponse response =
				this.cloudVisionTemplate.analyzeImage(
						this.resourceLoader.getResource(imageUrl), Type.LABEL_DETECTION);
		
		Map<String, Float> imageLabels =
				response.getLabelAnnotationsList().stream()
				.collect(
						Collectors.toMap(
								EntityAnnotation::getDescription,
	    						EntityAnnotation::getScore,
	    						(u, v) -> {
	    							throw new IllegalStateException(String.format("Duplicate key %s", u));
	    							},
	    						LinkedHashMap::new));
	    
	    map.addAttribute("annotations", imageLabels);
	    map.addAttribute("imageUrl", imageUrl);

	    return new ModelAndView("result", map);
	  }
}
