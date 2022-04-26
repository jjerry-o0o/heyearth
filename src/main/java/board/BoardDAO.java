package board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comment.CommentDTO;
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
	public List<BoardDTO> selectBoardList(BoardDTO dto);
	public List<BoardDTO> selectBoardListPage(int page, int contentnum);
	 
	
	//글 총갯수
	public void boardCount(BoardDTO dto);
	
	//게시물 id 조회
	public String boardId(@Param("b_no") int b_no);
	
	//게시물 페이징
	public int testCount();
	
	//댓글
	public boolean addComment(CommentDTO dto);
	
	public List<CommentDTO> getComment(int b_no);
	
	//게시물검색
	public List<BoardDTO> findList(Map<String, String> data);
	
	//id로 작성한 게시물 조회
	public List<BoardDTO> myboardlist(String id);
}
