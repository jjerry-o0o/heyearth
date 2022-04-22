package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import board.BoardDTO;
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
