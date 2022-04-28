package admin;

import java.util.List;

import board.BoardDTO;
import comment.CommentDTO;
import member.MemberDTO;
import mission.MissionDTO;
import recycling.RecyclingDTO;
import zeroshop.ZeroshopDTO;

public interface AdminService {
	/*제로샵 관리*/
	public List<ZeroshopDTO> adminzeroshoplist();
	public void adminzeroshopdel(int s_code);
	public ZeroshopDTO adminzeroshopinfo(int s_code);
	public boolean checkloccode(String big_loc,String small_loc);
	public int loccode(String big_loc, String small_loc);
	public void insertloc(String big_loc, String small_loc);
	public void updatezeroshop(ZeroshopDTO dto);
	public void insertzeroshop(ZeroshopDTO dto);
	
	/*미션 관리*/
	public List<MissionDTO> adminmissionlist(String m_type);
	public void adminmissiondel(int m_code);
	public MissionDTO adminmissioninfo(int m_code);
	public void updatemission(MissionDTO dto);
	public void insertmission(MissionDTO dto);
	public List<String> missionname(String m_type);
	public MissionDTO missioninfo1(String m_type, String m_name);
	
	/*미션 리뷰관리*/
	public List<MissionDTO> missionreviewlist(int m_code);
	public void adminmemberpoint(int p_code);
	public void adminmembercarbon(int p_code);
	public void adminreviewdel(int p_code);
	public MissionDTO adminreviewinfo(int p_code);
	public void updatereview(MissionDTO dto);
	public int mcodetopcode(int p_code);
	
	/*가이드 관리*/
	public List<RecyclingDTO> adminguidelist();
	public List<String> guideclasslist();
	public void adminguidedel(int r_code);
	public RecyclingDTO adminguideinfo(int r_code);
	public void updateguide(RecyclingDTO dto);
	public void insertguide(RecyclingDTO dto);
	
	/*게시판 관리*/
	public List<BoardDTO> adminboardlist(String b_type);
	public void adminboarddel(int b_no);
	public BoardDTO adminboardinfo(int b_no);
	public void insertboard(BoardDTO dto);
	public void updateboard(BoardDTO dto);
	
	/*댓글 관리*/
	public List<CommentDTO> commentlist(int b_no);
	public void admincommentinsert(CommentDTO dto);
	public void admincommentupdate(int c_index, String c_comment);
	public void admincommentdelete(int c_index);
	
	/*회원 관리*/
	public List<MemberDTO> adminmemberlist();
	public int admindeletenum();
	public void adminmemberdel(String id, String withdrawId);
	public List<BoardDTO> adminmemberboard(String id);
	public List<MissionDTO> adminmembermission(String id);
	public List<BoardDTO> adminmemberboardlist(String b_type, String id);
	public MemberDTO adminmembermod(String id);
	public void updatemember(MemberDTO dto);
	public String idtopcode(int p_code);
	
	/*세션아이디 관리*/
	public List<String> adminid();
	
	/*관리자 마이페이지*/
	public MemberDTO admininfo(String id);
	public void updateadmin(MemberDTO dto);
	public String searchpw(String id);
}
