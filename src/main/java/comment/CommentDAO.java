package comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("commentdao")
public interface CommentDAO {

	public void insertComment(CommentDTO dto);
	
	public List<CommentDTO> selectComment(int b_no);
	
	public void updateComment(CommentDTO dto);
	
	public void deleteComment(int c_index);
	
	public int countComment();
}
