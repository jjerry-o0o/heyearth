package board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("boarddao")
public interface BoardDAO {
	
	//작성
	public int insertBoard(BoardDTO dto);
	
	//조회
	public BoardDTO selectBoardDetail(int b_no);
	
	//수정
	public int updateBoard(BoardDTO dto);
	
	//삭제
	public int deleteBoard(int b_no);
	
	//리스트
	public List<BoardDTO> selectBoardList();
}
