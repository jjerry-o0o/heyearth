
package recycling;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cloud.gcp.vision.CloudVisionTemplate;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature.Type;

@Controller
public class RecyclingController {

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private CloudVisionTemplate cloudVisionTemplate;

	@Autowired

	@Qualifier("recyclingservice")
	RecyclingService recyclingservice;

	// 이건 어떻게 버릴까? 페이지

	@RequestMapping(value = "/recycling", method = RequestMethod.GET)
	public String recycling() {
		return "recycling/recycling";
	}

	// 사진 업로드

	@RequestMapping(value = "/recycling", method = RequestMethod.POST)

	@ResponseBody
	public String recyclingupload(@RequestParam("uploadFile") MultipartFile uploadFile) throws IOException {
		
		String savedFileName = null;
		
		if (!uploadFile.isEmpty()) { // 파일 이름 가공

			String originalFileName = uploadFile.getOriginalFilename();
			int index = originalFileName.lastIndexOf(".");
			String fileName = originalFileName.substring(0, index);
			String ext = originalFileName.substring(index);
			savedFileName = fileName + "_" + UUID.randomUUID().toString().substring(0, 8) + ext;

			String savePath = "c:/upload/";

			// 파일 저장 
			File saveFile = new File(savePath+savedFileName);
			uploadFile.transferTo(saveFile);

		}
		return savedFileName;
	}

	// 분리수거 이미지의 분류 확인하기

	@PostMapping("/extractLabels")

	@ResponseBody
	public Map<String, Float> extractLabels(@RequestParam("savedFileName") String savedFileName) {
		// imageUrl = "http://localhost:8080/img/main-polarbear.jpg";

		String imageUrl = "http://localhost:8080/upload/" + savedFileName;
		AnnotateImageResponse response = this.cloudVisionTemplate
				.analyzeImage(this.resourceLoader.getResource(imageUrl), Type.LABEL_DETECTION);

		Map<String, Float> imageLabels = response.getLabelAnnotationsList().stream()
				.collect(Collectors.toMap(EntityAnnotation::getDescription, EntityAnnotation::getScore, (u, v) -> {
					throw new IllegalStateException(String.format("Duplicate key %s", u));
				}, LinkedHashMap::new));

		// map.addAttribute("annotations", imageLabels);
		// map.addAttribute("imageUrl", imageUrl);

		// Map<String, Float> resultmap = (Map<String, Float>) map.get("annotations");
		Set<String> keys = imageLabels.keySet();
		for (String k : keys) {
			System.out.println(k + ":" + imageLabels.get(k));
		}
		System.out.println("체크");
		// System.out.println("이미지 라벨"+imageLabels);

		return imageLabels;
	}

	// 사진으로 검색 - 분리수거 이미지의 배출 방법 확인하기

	@GetMapping("howtoway")

	@ResponseBody
	public RecyclingDTO howtoway(String value) {
		int r_code;
		RecyclingDTO dto = null;
		if (value.equals("Carton")) {
			r_code = 1;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Bottle")) {
			r_code = 7;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Tin") || value.equals("Tin can")) {
			r_code = 8;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Plastic bottle")) {
			r_code = 10;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Outerwear") || value.equals("T-shirt") || value.equals("Sleeve")) {
			r_code = 14;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Fluorescent lamp") || value.equals("Light bulb")) {
			r_code = 17;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Home appliance")) {
			r_code = 23;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Tire") || value.equals("Wheel") || value.equals("Automotive tire")) {
			r_code = 24;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Oil")) {
			r_code = 26;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else if (value.equals("Shelf") || value.equals("Furniture") || value.equals("Bookcase")) {
			r_code = 28;
			dto = recyclingservice.recyclinghowtoway(r_code);
		} else {
			r_code = 29;
			dto = recyclingservice.recyclinghowtoway(r_code);
		}
		return dto;
	}

	// 키워드 검색

	@RequestMapping("/keywordrecycling")

	@ResponseBody
	public List<RecyclingDTO> keywordrecycling(String r_class) {
		List<RecyclingDTO> recyclingdto = recyclingservice.recycling(r_class);
		return recyclingdto;
	}

	// 키워드 검색 모달창

	@RequestMapping("/recyclingway")

	@ResponseBody
	public RecyclingDTO recyclingway(int r_code) {
		System.out.println(r_code);

		return recyclingservice.recyclingway(r_code);
	}

}
