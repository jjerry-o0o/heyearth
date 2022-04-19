package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardservice")
	BoardService boardservice;

	@RequestMapping("/boardlist")
	public String boardlist() {
		return "board/boardlist";
	}
	
	@RequestMapping("/boardview")
	public String boardview() {
		return "board/boardview";
	}
	
	@RequestMapping("/boardinput")
	public String boardinput(@RequestParam(value="b_no", required = false) int b_no, Model model) {
		
		if(b_no == 0){
			model.addAttribute("dto", new BoardDTO());
		}
		else {
			BoardDTO dto = boardservice.getBoardDetail(b_no);
			if(dto == null) {
				return "redirect:/boardlist";
			}
			model.addAttribute("dto", dto);
		}
		
		return "board/boardinput";
	}
	
	@RequestMapping("/boardalter")
	public String boardalter() {
		return "board/boardalter";
	}
	
}
