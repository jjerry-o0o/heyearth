package comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	
	@Autowired
	@Qualifier("commentservice")
	CommentService commentservice;
	
	@Autowired
	@Qualifier("commentdao")
	CommentDAO	commentdao;

	@RequestMapping(value="/comment", method = RequestMethod.POST)
	public String commentinput(@ModelAttribute CommentDTO dto){
		
		
		/* commentservice.insertComment(dto); */
		
		return "redirect:/boardview?b_no=" + dto.b_no;
	}
}
