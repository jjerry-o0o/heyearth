package recycling;

import java.util.List;

public interface RecyclingService {
	
	public List<RecyclingDTO> recycling (String r_class);
	public RecyclingDTO recyclingway (int r_code);
	public RecyclingDTO recyclinghowtoway(int r_code);
}
