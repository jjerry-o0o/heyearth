package zeroshop;

import java.util.List;

public interface ZeroshopService {
	public int locid(String big_loc, String small_loc);
	public List<ZeroshopDTO> loczero(int l_code);
}
