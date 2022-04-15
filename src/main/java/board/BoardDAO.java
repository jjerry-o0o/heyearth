package board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
public interface BoardDAO {

	
	//전체조회
	public List<BoardDTO> boardList();
	
	//작성
	public void boardInsert(BoardDTO dto);
	
	//상세조회
	public BoardDTO boardDetail(int b_no);
	
	//작성게시물 조회
	public BoardDTO myBoardDetail(String id);
	
	//수정
	public void boardUpdate(int b_no);
	
	//삭제
	public void boardDelete(int b_no);
	
}
