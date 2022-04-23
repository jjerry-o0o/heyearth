package comment;

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

@Controller
public class CommentContoller {
	
	@Autowired
	@Qualifier("commentservice")
	CommentService commentservice;
	
	@RequestMapping("/selectcomment")
	@ResponseBody
	public List<CommentDTO> selectComment(@RequestParam int b_no, Model model){
		
		return commentservice.selectComment(b_no);
	}

	@RequestMapping(value="/insertcomment", method=RequestMethod.POST)
	@ResponseBody
	public void insertComment(@ModelAttribute CommentDTO dto) {
		
		commentservice.insertComment(dto);
		
	}

	@RequestMapping(value = "/updatecomment", method = RequestMethod.POST)
	@ResponseBody
	public void updateComment(@RequestParam int c_index, Model model) {
		commentservice.updateComment(c_index);
	}
	
	@RequestMapping(value = "/deletecomment", method = RequestMethod.POST)
	@ResponseBody
	public void deleteComment(@RequestParam int c_index) {
		commentservice.deleteComment(c_index);
	}

}
