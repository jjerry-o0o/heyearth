package zeroshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("zeroshopservice")
public class ZeroshopServiceImpl implements ZeroshopService{
	@Autowired
	@Qualifier("zeroshopdao")
	public ZeroshopDAO zerodao;

	@Override
	public int locid(String big_loc, String small_loc) {
		LocationDTO dto = new LocationDTO();
		dto.setBig_loc(big_loc);
		dto.setSmall_loc(small_loc);
		int l_code = zerodao.locid(dto);
		return l_code;
	}

	@Override
	public List<ZeroshopDTO> loczero(int l_code) {
		return zerodao.loczero(l_code);
	}

	@Override
	public ZeroshopDTO zeroshop(int s_code) {
		return zerodao.zeroshop(s_code);
	}

	@Override
	public List<ZeroshopDTO> noll() {
		return zerodao.noll();
	}

	@Override
	public void setlatlong(ZeroshopDTO dto) {
		zerodao.setlatlong(dto);
		
	}

	@Override
	public List<ZeroshopDTO> allzeroshop() {
		return zerodao.allzeroshop();
	}

	@Override
	public List<Integer> locidall(String big_loc) {
		return zerodao.locidall(big_loc);
	}

	@Override
	public List<ZeroshopDTO> zeroshoplist() {
		return zerodao.zeroshoplist();
	}
	
	
}
