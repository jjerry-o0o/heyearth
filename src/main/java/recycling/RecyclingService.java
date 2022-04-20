package recycling;

import java.util.List;

public interface RecyclingService {
	
	public List<RecyclingDTO> recycling (String r_class);
	public RecyclingDTO recyclingway (String r_code);
}
