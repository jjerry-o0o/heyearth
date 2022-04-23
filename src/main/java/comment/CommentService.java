package comment;

import java.util.List;

public interface CommentService {

	public void insertComment(CommentDTO dto);
	
	public List<CommentDTO> selectComment(int b_no);
	
	public void updateComment(int c_index);
	
	public void deleteComment(int c_index);
	
	public int countComment();
}
