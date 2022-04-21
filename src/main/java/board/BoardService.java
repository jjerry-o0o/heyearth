package board;

import java.util.List;

import org.springframework.stereotype.Repository;

import paging.Criteria;


public interface BoardService {

	public void insertBoard(BoardDTO dto);
	
	public BoardDTO selectBoardDetail(int b_no);
	
	public void updateBoard(BoardDTO dto);
	
	public void deleteBoard(int b_no);
	
	public List<BoardDTO> selectBoardList(int page); 
	
	public String boardId(int b_no);
	
	public void boardCount(BoardDTO dto);
	
	
}
