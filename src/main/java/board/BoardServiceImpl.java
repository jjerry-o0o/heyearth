package board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import comment.CommentDTO;
import member.MemberDAO;
import paging.Criteria;


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
		boarddao.insertBoard(dto);
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
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		return boardlist;
	}

	@Override
	public String boardId(int b_no) {
		return boarddao.boardId(b_no);
	}

	@Override
	public int execute(Model model, String pagenum, String contentnum){
		Criteria pagemaker = new Criteria();
		
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		
		List<BoardDTO> list = null;
		
		pagemaker.setTotalcount(boarddao.testCount());
		pagemaker.setPagenum(cpagenum-1);
		
		pagemaker.setContentnum(ccontentnum);
		pagemaker.setCurrentblock(cpagenum);
		
		pagemaker.setLastblock(pagemaker.getTotalcount());
		
		pagemaker.prevnext(cpagenum);
		pagemaker.setStartPage(pagemaker.getCurrentblock());
		
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		
		if(ccontentnum ==5) {
			list = boarddao.selectBoardListPage(pagemaker.getPagenum()*5, pagemaker.getContentnum());	
		}
		else if(ccontentnum == 10) {
			list = boarddao.selectBoardListPage(pagemaker.getPagenum()*10, pagemaker.getContentnum());
		}
		else if(ccontentnum ==15) {
			list = boarddao.selectBoardListPage(pagemaker.getPagenum()*15, pagemaker.getContentnum());
		}
		
		model.addAttribute("test", list);
		model.addAttribute("page", pagemaker);
		
		return cpagenum ;
	}

	@Override
	public boolean addComment(CommentDTO dto) {
		return boarddao.addComment(dto);
	}

	@Override
	public List<comment.CommentDTO> getComment(int b_no) {
		return boarddao.getComment(b_no);
	}

	@Override
	public List<BoardDTO> findList(String type, String keyword) {
		
		Map<String, String> data = new HashMap<String, String>();
		data.put("type", type);
		 System.out.println(">>" +data.get(type)); 
			
		data.put("keyword", keyword);
		BoardDTO dto = new BoardDTO();
		dto.setData(data);
		
		return boarddao.findList(data);
	}

	@Override
	public List<BoardDTO> myboardlist(String id) {
		
		return boarddao.myboardlist(id);
	}
	

	
	
}