package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("commentservice")
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	@Qualifier("commentdao")
	CommentDAO commentdao;

	@Override
	public void insertComment(CommentDTO dto) {
		commentdao.insertComment(dto);
		
	}

	@Override
	public List<CommentDTO> selectComment(int b_no) {
		List<CommentDTO> list = commentdao.selectComment(b_no);
		
		return list;
	}

	@Override
	public void updateComment(CommentDTO dto) {
		commentdao.updateComment(dto);
		
	}

	@Override
	public void deleteComment(int c_index) {
		commentdao.deleteComment(c_index);
	}

	@Override
	public int countComment() {
		int count = commentdao.countComment();
		
		return count;
	}
	
	

	
}
