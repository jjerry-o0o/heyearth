package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import comment.CommentDTO;
import paging.Criteria;
import paging.PaginationInfo;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardservice")
	BoardService boardservice;
	
	@Autowired
	@Qualifier("boarddao")
	BoardDAO boarddao;

	@RequestMapping("/boardlist")
	public String boardlist(int page, Model model) {
		BoardDTO dto = new BoardDTO();
		
		List<BoardDTO> list = boardservice.selectBoardList(page);
		
		PaginationInfo paging = new PaginationInfo();
		/* paging.setCri(dto); */
		
		int boardCount = boarddao.selectBoardTotalCount(dto);
		/* paging.setTotalCount(boardCount); */
		
		model.addAttribute("boardlist", list);
		model.addAttribute("paging", paging);
		
		return "/board/boardlist";
	}
	
	@RequestMapping("/boardview")
	public String boardview(@RequestParam int b_no, Model model) throws IOException {
		
		BoardDTO dto = boardservice.selectBoardDetail(b_no);
		
		model.addAttribute("dto", dto);
		boarddao.boardCount(dto);
		
		return "board/boardview";
	}
	
	@RequestMapping("/boardinput")
	public String boardinput() {
		return "board/boardinput";
	}
	
	@RequestMapping(value="/boardinput", method = RequestMethod.POST)
	public String boardinput(@ModelAttribute BoardDTO dto) throws IOException{
		
		MultipartFile img = dto.getFile();
		
		Path currentPath = Paths.get(""); 
		String path = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/"; 
		path = path.replace("\\", "/");


		if(!img.isEmpty()) {
			String originname = img.getOriginalFilename();
			/*
			 * String beforeext = originname.substring(0, originname.indexOf("."));
			 * String ext = originname.substring(originname.indexOf("."));
			 * String randomname = UUID.randomUUID().toString();
			 * File serverfile = new File(path + beforeext + "(" +randomname+")"+ext);
			 */
			
			File serverfile = new File(path + originname);
					
			img.transferTo(serverfile);
			dto.setB_img(originname);
		}
		
		boardservice.insertBoard(dto);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boardalter")
	public String boardalter(@RequestParam int b_no, Model model) {
		BoardDTO dto = boardservice.selectBoardDetail(b_no);
		model.addAttribute("dto", dto);
		
		return "board/boardalter";
	}
	
	@RequestMapping(value="/boardalter", method = RequestMethod.POST)
	public String boardalter(BoardDTO dto) {
		
		boardservice.updateBoard(dto);
		
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boarddelete")
	public String boarddelete(@RequestParam int b_no) {
		boardservice.deleteBoard(b_no);
		
		return "redirect:/boardlist";
	}
	
}
