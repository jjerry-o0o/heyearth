package admin;

import java.util.List;

import board.BoardDTO;
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
	
	/*가이드 관리*/
	public List<RecyclingDTO> adminguidelist();
	public List<String> guideclasslist();
	public void adminguidedel(int r_code);
	public RecyclingDTO adminguideinfo(int r_code);
	public void updateguide(RecyclingDTO dto);
	public void insertguide(RecyclingDTO dto);
	
	/*게시판 관리*/
	public List<BoardDTO> adminboardlist(String b_type);
	
	/*관리자 마이페이지*/
	public MemberDTO admininfo(String id);
	public void updateadmin(MemberDTO dto);
	public String searchpw(String id);
}
