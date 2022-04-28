package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import board.BoardDTO;
import comment.CommentDTO;
import grade.GradeDTO;
import member.MemberDTO;
import mission.MissionDTO;
import recycling.RecyclingDTO;
import zeroshop.LocationDTO;
import zeroshop.ZeroshopDTO;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {

	@Autowired
	@Qualifier("admindao")
	public AdminDAO admindao;
	
	
	/*제로샵 관리*/
	
	@Override
	public List<ZeroshopDTO> adminzeroshoplist() {
		return admindao.adminzeroshoplist();
	}

	@Override
	public void adminzeroshopdel(int s_code) {
		admindao.adminzeroshopdel(s_code);
		
	}

	@Override
	public ZeroshopDTO adminzeroshopinfo(int s_code) {
		return admindao.adminzeroshopinfo(s_code);
	}

	@Override
	public boolean checkloccode(String big_loc, String small_loc) {
		LocationDTO dto = new LocationDTO();
		dto.setBig_loc(big_loc);
		dto.setSmall_loc(small_loc);
		if(admindao.checkloccode(dto) == 0)
			return false;
		else
			return true;
	}

	@Override
	public int loccode(String big_loc, String small_loc) {
		LocationDTO dto = new LocationDTO();
		dto.setBig_loc(big_loc);
		dto.setSmall_loc(small_loc);
		return admindao.loccode(dto);
	}

	@Override
	public void insertloc(String big_loc, String small_loc) {
		LocationDTO dto = new LocationDTO();
		dto.setBig_loc(big_loc);
		dto.setSmall_loc(small_loc);
		admindao.insertloc(dto);
		
	}

	@Override
	public void updatezeroshop(ZeroshopDTO dto) {
		admindao.updatezeroshop(dto);
	}

	@Override
	public void insertzeroshop(ZeroshopDTO dto) {
		admindao.insertzeroshop(dto);
		
	}

	
	/*미션 관리*/
	
	@Override
	public List<MissionDTO> adminmissionlist(String m_type) {
		return admindao.adminmissionlist(m_type);
	}

	@Override
	public void adminmissiondel(int m_code) {
		admindao.adminmissiondel(m_code);
		
	}

	@Override
	public MissionDTO adminmissioninfo(int m_code) {
		return admindao.adminmissioninfo(m_code);
	}

	@Override
	public void updatemission(MissionDTO dto) {
		admindao.updatemission(dto);
		
	}

	@Override
	public void insertmission(MissionDTO dto) {
		admindao.insertmission(dto);
		
	}

	@Override
	public List<String> missionname(String m_type) {
		return admindao.missionname(m_type);
	}
	
	@Override
	public MissionDTO missioninfo1(String m_type, String m_name) {
		MissionDTO dto = new MissionDTO();
		dto.setM_type(m_type);
		dto.setM_name(m_name);
		List<MissionDTO> missionlist = admindao.missioninfo1(dto);
		return missionlist.get(0);
	}
	
	
	
	
	/*미션 리뷰관리*/
	
	@Override
	public List<MissionDTO> missionreviewlist(int m_code) {
		return admindao.missionreviewlist(m_code);
	}

	@Override
	public void adminmemberpoint(int p_code) {
		admindao.adminmemberpoint(p_code);
		
	}

	@Override
	public void adminmembercarbon(int p_code) {
		// carbon 줄이기
		admindao.adminmembercarbon(p_code);
		// 현재 carbon 값 받아오기
		int carbon = admindao.adminmembercurcarbon(p_code);
		// 등급 목록 받아오기 
		List<GradeDTO> dto = admindao.membergradelist();
		int grade=0;
		for(int i=0;i<dto.size();i++) {
			if(carbon>=dto.get(i).getG_start() && carbon<=dto.get(i).getG_end()){
				grade = dto.get(i).getG_code();
			}
		}
		
		// 등급 재설정
		admindao.adminmembergrade(p_code,grade);
	}

	@Override
	public void adminreviewdel(int p_code) {
		admindao.adminreviewdel(p_code);
	}
	
	@Override
	public MissionDTO adminreviewinfo(int p_code) {
		return admindao.adminreviewinfo(p_code);
	}
	
	@Override
	public void updatereview(MissionDTO dto) {
		admindao.updatereview(dto);
		
	}
	
	@Override
	public int mcodetopcode(int p_code) {
		return admindao.mcodetopcode(p_code);
	}
	
	
	
	
	
	
	/*가이드 관리*/
	
	@Override
	public List<RecyclingDTO> adminguidelist() {
		return admindao.adminguidelist();
	}

	@Override
	public List<String> guideclasslist() {
		return admindao.guideclasslist();
	}

	@Override
	public void adminguidedel(int r_code) {
		admindao.adminguidedel(r_code);
		
	}

	@Override
	public RecyclingDTO adminguideinfo(int r_code) {
		return admindao.adminguideinfo(r_code);
	}

	@Override
	public void updateguide(RecyclingDTO dto) {
		admindao.updateguide(dto);
		
	}

	@Override
	public void insertguide(RecyclingDTO dto) {
		admindao.insertguide(dto);
	}

	
	
	/*게시판 관리*/
	
	@Override
	public List<BoardDTO> adminboardlist(String b_type) {
		return admindao.adminboardlist(b_type);
	}
	
	@Override
	public void adminboarddel(int b_no) {
		admindao.adminboarddel(b_no);
	}

	@Override
	public BoardDTO adminboardinfo(int b_no) {
		return admindao.adminboardinfo(b_no);
	}
	
	@Override
	public void insertboard(BoardDTO dto) {
		admindao.insertboard(dto);
	}
	
	@Override
	public void updateboard(BoardDTO dto) {
		admindao.updateboard(dto);
	}
	
	
	
	
	
	/* 댓글 관리*/
	@Override
	public List<CommentDTO> commentlist(int b_no) {
		return admindao.commentlist(b_no);
	}
	
	@Override
	public void admincommentinsert(CommentDTO dto) {
		admindao.admincommentinsert(dto);
		
	}
	
	@Override
	public void admincommentupdate(int c_index, String c_comment) {
		CommentDTO dto = new CommentDTO();
		dto.setC_index(c_index);
		dto.setC_comment(c_comment);
		admindao.admincommentupdate(dto);
	}
	
	@Override
	public void admincommentdelete(int c_index) {
		admindao.admincommentdelete(c_index);
	}
	
	
	
	
	
	
	

	/* 회원 관리 */
	@Override
	public List<MemberDTO> adminmemberlist() {
		return admindao.adminmemberlist();
	}
	
	@Override
	public int admindeletenum() {
		return admindao.admindeletenum();
	}

	@Override
	public void adminmemberdel(String id, String withdrawId) {
		admindao.adminmemberdel(id, withdrawId);
	}

	@Override
	public List<BoardDTO> adminmemberboard(String id) {
		return admindao.adminmemberboard(id);
	}

	@Override
	public List<MissionDTO> adminmembermission(String id) {
		return admindao.adminmembermission(id);
	}
	
	@Override
	public List<BoardDTO> adminmemberboardlist(String b_type, String id) {
		BoardDTO dto = new BoardDTO();
		dto.setB_type(b_type);
		dto.setId(id);
		return admindao.adminmemberboardlist(dto);
	}
	
	@Override
	public MemberDTO adminmembermod(String id) {
		return admindao.adminmembermod(id);
	}
	
	@Override
	public void updatemember(MemberDTO dto) {
		admindao.updatemember(dto);
	}
	
	@Override
	public String idtopcode(int p_code) {
		return admindao.idtopcode(p_code);
	}
	
	
	
	
	
	
	/*세션 아이디 관리*/
	@Override
	public List<String> adminid() {
		return admindao.adminid();
	}
	
	

	
	
	/*관리자 마이페이지*/
	
	@Override
	public MemberDTO admininfo(String id) {
		return admindao.admininfo(id);
	}

	@Override
	public void updateadmin(MemberDTO dto) {
		admindao.updateadmin(dto);
		
	}

	@Override
	public String searchpw(String id) {
		return admindao.searchpw(id);
	}



}
