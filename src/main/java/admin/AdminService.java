package admin;

import java.util.List;

import zeroshop.LocationDTO;
import zeroshop.ZeroshopDTO;

public interface AdminService {
	public List<ZeroshopDTO> adminzeroshoplist();
	public void adminzeroshopdel(int s_code);
	public ZeroshopDTO adminzeroshopinfo(int s_code);
	public boolean checkloccode(String big_loc,String small_loc);
	public int loccode(String big_loc, String small_loc);
	public void insertloc(String big_loc, String small_loc);
	public void updatezeroshop(ZeroshopDTO dto);
}
