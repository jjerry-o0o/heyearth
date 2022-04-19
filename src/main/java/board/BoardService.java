package board;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("boardservice")
public interface BoardService {

	public boolean registerBoard(BoardDTO dto);
	
	public BoardDTO getBoardDetail(int b_no);
	
	public boolean deleteBoard(int b_no);
	
	public List<BoardDTO> getBoardList();
	
	
}
