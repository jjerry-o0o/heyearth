package board;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException.Unauthorized;

import member.MemberDAO;
import member.MemberDTO;


@Service("boardservice")
public class BoardServiceImpl implements BoardService{
	
	private final static int boardPage=10;
	
	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;
	
	@Autowired
	@Qualifier("boarddao")
	BoardDAO boarddao;

	@Autowired
	HttpSession session;

	@Override
	public void insertBoard(BoardDTO dto) {
		String id = (String)session.getAttribute("id");
		MemberDTO memberdto = memberdao.memberView(id);
		
		if(id == null || memberdto ==null) {
			System.out.println("권한 없음");
		}
		else {
			dto.setId(memberdto.getId());
			boarddao.insertBoard(dto);
		}
		
	}

	@Override
	public BoardDTO selectBoardDetail(int b_no) {
		return boarddao.selectBoardDetail(b_no);
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		boarddao.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int b_no) {
		boarddao.deleteBoard(b_no);
	}

	@Override
	public List<BoardDTO> selectBoardList(int page) {
		page = (page-1) *10;
		System.out.println(page);
		
		return boarddao.selectBoardList(page);
	}

	@Override
	public String boardId(int b_no) {
		return boarddao.boardId(b_no);
	}

	@Override
	public int boardCount() {
		int total = boarddao.boardCount();
		
		int pagenum = 0;
		
		if(total% boardPage ==0) {
			pagenum = total / boardPage;
		}
		else {
			pagenum = total / boardPage +1;
		}
		
		return pagenum;
	}
	
	
}
