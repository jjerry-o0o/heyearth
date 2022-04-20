package board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("boarddao")
public interface BoardDAO {
	
	//작성
	public void insertBoard(BoardDTO dto);
	
	//조회
	public BoardDTO selectBoardDetail(int b_no);
	
	//수정
	public void updateBoard(BoardDTO dto);
	
	//삭제
	public void deleteBoard(int b_no);
	
	//리스트
	public List<BoardDTO> selectBoardList(@Param("page") int page);
	 
	
	//글 총갯수
	public int boardCount();
	
	//게시물 id 조회
	public String boardId(@Param("b_no") int b_no);
}
