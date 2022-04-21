package board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import paging.Criteria;

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
	public List<BoardDTO> selectBoardList(int page, int contentnum);
	 
	
	//글 총갯수
	public void boardCount(BoardDTO dto);
	
	//게시물 id 조회
	public String boardId(@Param("b_no") int b_no);
	
	//게시물 페이징
	public int selectBoardTotalCount(BoardDTO dto);
}
