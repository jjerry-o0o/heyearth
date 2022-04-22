package board;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import paging.Criteria;


public interface BoardService {

	public void insertBoard(BoardDTO dto);
	
	public BoardDTO selectBoardDetail(int b_no);
	
	public void updateBoard(BoardDTO dto);
	
	public void deleteBoard(int b_no);
	
	public List<BoardDTO> selectBoardList(int page); 
	
	public String boardId(int b_no);
	
	//페이징
	public int execute(Model model, String pagenum, String contentnum);
	
	
	//댓글
	public boolean addComment(CommentDTO dto);
	
	public List<CommentDTO> getComment(int b_no);
	
	
}
