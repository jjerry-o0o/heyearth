package zeroshop;

import java.util.List;

public interface ZeroshopService {
	public int locid(String big_loc, String small_loc);
	public List<Integer> locidall(String big_loc);
	public List<ZeroshopDTO> loczero(int l_code);
	public ZeroshopDTO zeroshop(int s_code);
	public List<ZeroshopDTO> noll();
	public void setlatlong(ZeroshopDTO dto);
	public List<ZeroshopDTO> allzeroshop();
	public List<ZeroshopDTO> zeroshoplist();
}
