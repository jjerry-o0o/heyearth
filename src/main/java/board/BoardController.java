package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardservice")
	BoardService boardservice;

	@RequestMapping("/boardlist")
	public String boardlist(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		List<BoardDTO> list = boardservice.selectBoardList(page);
		int pagenum = boardservice.boardCount();
		
		model.addAttribute("boardlist", list);
		model.addAttribute("pagenum", pagenum);
		
		return "/board/boardlist";
	}
	
	@RequestMapping("/boardview")
	public String boardview(@RequestParam int b_no, Model model) {
		BoardDTO dto = boardservice.selectBoardDetail(b_no);
		model.addAttribute("dto", dto);
		
		return "board/boardview";
	}
	
	@RequestMapping("/boardinput")
	public String boardinput() {
		return "board/boardinput";
	}
	
	@RequestMapping(value="/boardinput", method = RequestMethod.POST)
	public String boardinput(BoardDTO dto) {
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
	public String boardalter(BoardDTO dto) {
		boardservice.updateBoard(dto);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boarddelete")
	public String boarddelete(@RequestParam int b_no) {
		boardservice.deleteBoard(b_no);
		
		return "redirect:/boardlist";
	}
	
}
