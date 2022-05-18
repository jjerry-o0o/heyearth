package participation;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

import mission.MissionService;
import mission.MissionServiceImpl;
import recycling.RecyclingDTO;
import zeroshop.ZeroshopDTO;
import zeroshop.ZeroshopService;
import zeroshop.ZeroshopServiceImpl;

@Controller
public class ParticipationController {

	@Autowired
	@Qualifier("participationservice")
	ParticipationService service = new ParticipationServiceImpl();

	@Autowired
	@Qualifier("missionservice")
	MissionService missionservice = new MissionServiceImpl();
	
	@Autowired
	@Qualifier("zeroshopservice")
	ZeroshopService zeroservice = new ZeroshopServiceImpl();
	
	@RequestMapping("/missioncomplete")
	public String missioncomplete() {
		return "/mypage/missioncomplete";
	}
	

	// 참가미션 - 나의 미션 목록
	@RequestMapping(value = "/participation")
	public ModelAndView list(HttpSession session, ModelAndView mv) {

		Map<String, Object> map = new HashMap<>();
		String id = (String) session.getAttribute("session_id");// 사용자 id 받아옴
		if (id != null) {
			List<ParticipationDTO> list = service.participation_list(id);

			map.put("list", list);
			map.put("count", list.size());
			mv.setViewName("mypage/participation");
			mv.addObject("map", map);
			return mv;
		} else {
			return new ModelAndView("member/login", "", null);
		}
	}

	// 마이페이지 - 나의 미션 목록
	@RequestMapping(value = "/participation2")
	@ResponseBody
	public List<ParticipationDTO> mymissionlist(@RequestParam(value = "id") String id) {

		List<ParticipationDTO> list = service.participation_list(id);
		return list;
	}

	// 상시 미션 등록&인증하기
	@RequestMapping("/register_complete")
	public String register_complete(@ModelAttribute ParticipationDTO dto, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("session_id");
		if (id == null) {
			return "member/login";
		}
		dto.setId(id);
		MultipartFile mf = dto.getImage();
		// 파일 업로드
		if (!mf.isEmpty()) {
			Path currentPath = Paths.get("");
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/";
			path = path.replace("\\", "/");
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setP_photo(mf.getOriginalFilename());
		}
		service.participation_register_complete(dto); // 나의 미션 테이블 등록(인증사진 포함)
		service.participation_complete2(dto); // 멤버 테이블 수정(포인트, 탄소배출량)
		service.participation_register_complete2(dto); // 등급 변경
		return "redirect:/participation";
	}
	
	// 제로웨이스트샵 인증 미션 등록&인증하기(수정중)
	@RequestMapping("/register_complete2")
	public String register_complete2(@ModelAttribute ParticipationDTO dto, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("session_id");
		if (id == null) {
			return "member/login";
		}
		dto.setId(id);
	
		service.participation_register_complete(dto); // 나의 미션 테이블 등록(인증사진 포함)
		service.participation_complete2(dto); // 멤버 테이블 수정(포인트, 탄소배출량)
		service.participation_register_complete2(dto); // 등급 변경
		return "redirect:/participation";
	}
	
	

	// 단체 미션 등록하기
	@RequestMapping("/register")
	public String register(@ModelAttribute ParticipationDTO dto, HttpSession session) {
		String id = (String) session.getAttribute("session_id");
		if (id == null) {
			return "member/login";
		}
		dto.setId(id);
		service.participation_register(dto); // 참가 미션 테이블 insert
		service.participation_register2(dto); // 미션 테이블 수정(참가인원)
		return "redirect:/participation";
	}

	// 단체 미션 취소하기
	@RequestMapping("delete")
	public String delete(@RequestParam int p_code, ParticipationDTO dto) {
		service.delete(p_code); // 참가 미션 테이블 삭제
		service.participation_delete2(dto);// 미션 테이블 수정(참가인원)
		return "redirect:/participation";
	}

	// 단체 미션 인증하기 모달창
	@RequestMapping("/mymissiondetail")
	@ResponseBody
	public ParticipationDTO mymission_modal(int p_code) {
		return service.mymission_detail(p_code);
	}

	// 단체 미션 인증하기
	@RequestMapping("/complete")
	public String comlete(ParticipationDTO dto) throws Exception {
		MultipartFile mf = dto.getImage();
		// 파일 업로드
		if (!mf.isEmpty()) {
			Path currentPath = Paths.get("");
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/";
			path = path.replace("\\", "/");
			File serverfile = new File(path + mf.getOriginalFilename());
			mf.transferTo(serverfile);
			dto.setP_photo(mf.getOriginalFilename());
		}
		service.participation_complete(dto); // 나의미션 테이블 수정(미션완료, 인증사진 업로드)
		service.participation_complete2(dto); // 멤버 테이블 수정(포인트, 탄소배출량)
		service.participation_register_complete2(dto); // 등급 변경
		return "redirect:/participation";
	}

	// 미션 리뷰쓰기
	@RequestMapping("/review")
	public String review(ParticipationDTO dto) {
		service.participation_review(dto); // 리뷰제출
		return "redirect:/participation";
	}

	// 레드카드
	@RequestMapping("/redcard")
	public String redcard(ParticipationDTO dto, int m_code) {
		service.redcard(dto); // 신고 횟수 누적
		return "redirect:/mission_detail/"+m_code;
	}
	
	// 제로웨이스트샵 인증 미션 상세 페이지
	@RequestMapping(value = "/ocrresult2", method = RequestMethod.GET)
	public String ocrresult2() {
		return "mission/ocrresult2";
	}

	// 영수증 사진 업로드
	@RequestMapping(value = "/ocrresult2", method = RequestMethod.POST)
		@ResponseBody
		public String receiptupload(@RequestParam("uploadFile") MultipartFile uploadFile) throws IOException {
			
		String savedFileName = null;
		if (!uploadFile.isEmpty()) {
			Path currentPath = Paths.get("");
			String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/";
			path = path.replace("\\", "/");
			File serverfile = new File(path + uploadFile.getOriginalFilename());
			uploadFile.transferTo(serverfile);
			uploadFile.getOriginalFilename();
			savedFileName = uploadFile.getOriginalFilename();
		}
		return savedFileName;
		}
	
		
		// 영수증 인증하기 		
		@PostMapping("/ocrreceipt")
		@ResponseBody
		public Map<String, Object> returnMap(@RequestParam("savedFileName") String savedFileName) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			String json = ((MissionServiceImpl)missionservice).test(savedFileName); //OCR 영수증 인식
			List<ZeroshopDTO> list = zeroservice.allzeroshop(); //제로웨이스트샵 전체 목록
			
			map.put("json", json);
			map.put("list", list);
			
			return map;	
		}
		 
		
}// Controller end