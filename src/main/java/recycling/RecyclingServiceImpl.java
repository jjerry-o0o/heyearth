package recycling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("recyclingservice")
public class RecyclingServiceImpl implements RecyclingService{
	
	@Autowired
	@Qualifier("recyclingdao")
	public RecyclingDAO recyclingdao;
	
	@Override
	public RecyclingDTO recycling(String r_class) {
		return recyclingdao.recycling(r_class);
	}

}
