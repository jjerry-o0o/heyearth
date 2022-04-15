package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping("/boardinput")
	public String boardinput() {
		return "board/boardinput";
	}
	
	@RequestMapping("/boardalter")
	public String boardalter() {
		return "board/boardalter";
	}
	
}
