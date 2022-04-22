package recycling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("recyclingservice")
public class RecyclingServiceImpl implements RecyclingService{
	
	@Autowired
	@Qualifier("recyclingdao")
	public RecyclingDAO recyclingdao;
	
	@Override
	public List<RecyclingDTO> recycling(String r_class) {
		return recyclingdao.recycling(r_class);
	}

	@Override
	public RecyclingDTO recyclingway(int r_code) {
		return recyclingdao.recyclingway(r_code);
	}

	@Override
	public RecyclingDTO recyclinghowtoway(int r_code) {
		return recyclingdao.recyclinghowtoway(r_code);
	}

}
