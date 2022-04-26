package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.http.HttpHeaders;

import comment.CommentDAO;
import comment.CommentDTO;
import comment.CommentService;
import member.MemberDTO;
import paging.Criteria;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardservice")
	BoardService boardservice;
	
	@Autowired
	@Qualifier("boarddao")
	BoardDAO boarddao;

	
	@RequestMapping("/boardlist")
	public String boardlist(@RequestParam(defaultValue="1") String pagenum,
			@RequestParam(defaultValue="10")String contentnum, BoardDTO dto, Model model) throws Exception {

		boardservice.execute(model, pagenum, contentnum);
		
		return "/board/boardlist";
	}
	
	@RequestMapping("/boardfind")
	public String boardfind(@RequestParam String type, @RequestParam String keyword, Model model,
			 BoardDTO dto) {
		
		
		List<BoardDTO> findlist = boardservice.findList(type, keyword);
					model.addAttribute("boardlist", findlist);
					
		System.out.println("컨트롤러 : " + type + " / " + keyword);
		
		return "/board/boardlist";
	}
	
	@RequestMapping("/boardview")
	public String boardview(@RequestParam int b_no, Model model) throws IOException {
		
		BoardDTO dto = boardservice.selectBoardDetail(b_no);
		
		model.addAttribute("dto", dto);
		boarddao.boardCount(dto);
		
		return "board/boardview";
	}
	
	@RequestMapping("/boardinput")
	public String boardinput() {
		return "board/boardinput";
	}
	
	@RequestMapping(value="/boardinput", method = RequestMethod.POST)
	public String boardinput(@ModelAttribute BoardDTO dto) throws IOException{
		
		MultipartFile img = dto.getFile();
		
		Path currentPath = Paths.get(""); 
		String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
		path = path.replace("\\", "/");


		if(!img.isEmpty()) {
			String originname = img.getOriginalFilename();
			
			File serverfile = new File(path + originname);
					
			img.transferTo(serverfile);
			dto.setB_img(originname);
		}
		
		boardservice.insertBoard(dto);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boardalter")
	public String boardalter(@RequestParam int b_no, Model model) {
		BoardDTO dto = boardservice.selectBoardDetail(b_no);
		model.addAttribute("dto", dto);
		
		return "board/boardalter";
	}
	
	@RequestMapping(value="/boardalter", method = RequestMethod.POST)
	public String boardalter(@ModelAttribute BoardDTO dto) throws IOException {
		MultipartFile img = dto.getFile();

		Path currentPath = Paths.get(""); 
		String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
		path = path.replace("\\", "/");
		
		if(!img.isEmpty()) {
			String originname = img.getOriginalFilename();
			
			File serverfile = new File(path + originname);
					
			img.transferTo(serverfile);
			dto.setB_img(originname);
		}
		
		boardservice.updateBoard(dto);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boarddelete")
	public String boarddelete(@RequestParam int b_no) {
		boardservice.deleteBoard(b_no);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping(value="/myboardlist", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardDTO> myboardlist(@RequestParam String id) {
		List<BoardDTO> list = boardservice.myboardlist(id);
		
		for(int i=0; i <list.size(); i++) {
			Date date = list.get(i).getB_regdate();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");		
			String currentDate = dateFormat.format(date);
			list.get(i).setRegdate(currentDate);
		}
		
		return list;
	}

	
}
