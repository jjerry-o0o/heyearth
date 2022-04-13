package board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/boardlist")
	public String boardlist() {
		return "board/boardlist";
	}
	
	@RequestMapping("/boardview")
	public String boardview() {
		return "board/boardview";
	}
	
}
