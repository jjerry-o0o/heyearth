package board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		model.addAttribute("url", "find");		
		
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
		}else {
	         dto.setB_img(null);
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
		else {
			dto.setB_img(null);
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
			
			System.out.println(list.get(i).getB_type());
			
			if(list.get(i).getB_type().equals("not")) {
				list.get(i).setB_type("공지사항");
			}
			else if(list.get(i).getB_type().equals("que")) {
				list.get(i).setB_type("질문");
			}
			else if(list.get(i).getB_type().equals("req")) {
				list.get(i).setB_type("요청");
			}
		}
		
		return list;
	}

	
}
