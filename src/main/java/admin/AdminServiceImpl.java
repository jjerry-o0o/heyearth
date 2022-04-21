package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
		admindao.updatemission(dto);
		
	}

	@Override
	public List<String> missionname(String m_type) {
		return admindao.missionname(m_type);
	}

	
	
	/*가이드 관리*/
	
	@Override
	public List<RecyclingDTO> adminguidelist() {
		return admindao.adminguidelist();
	}

}
