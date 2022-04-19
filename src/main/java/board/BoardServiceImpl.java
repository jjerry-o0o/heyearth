package board;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	@Qualifier("boarddao")
	BoardDAO boarddao;

	@Override
	public boolean registerBoard(BoardDTO dto) {
		int result = 0;
		
		if(dto.getB_no() == 0) { //null로 하면 오류발생
			result = boarddao.insertBoard(dto);
		}
		else {
			result = boarddao.updateBoard(dto);
		}
		
		return (result ==1) ? true : false;
	}

	@Override
	public BoardDTO getBoardDetail(int b_no) {
		return boarddao.selectBoardDetail(b_no);
	}

	@Override
	public boolean deleteBoard(int b_no) {
		int result = 0;
		
		BoardDTO dto = boarddao.selectBoardDetail(b_no);
		
		if(dto != null) {
			result = boarddao.deleteBoard(b_no);
		}
		
		return (result == 1) ? true : false;
	}

	@Override
	public List<BoardDTO> getBoardList() {
		List<BoardDTO> boardList = boarddao.selectBoardList();
		
		return boardList;
	}
	
	
}
