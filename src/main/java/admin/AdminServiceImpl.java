package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import zeroshop.LocationDTO;
import zeroshop.ZeroshopDTO;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {

	@Autowired
	@Qualifier("admindao")
	public AdminDAO admindao;
	
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

}
