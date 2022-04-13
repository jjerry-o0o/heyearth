package zeroshop;

import java.util.List;

public interface LocationService {
	public List<String> biglocation();
	public List<String> smalllocation(String big_loc);
}
