package carbon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("carbonservice")
public class CarbonServiceImpl implements CarbonService{
	
	@Autowired
	@Qualifier("carbondao")
	CarbonDAO carbondao;

	@Override
	public int memberCount() {
		return carbondao.memberCount();
	}

	@Override
	public int partCount() {
		return carbondao.partCount();
	}

	@Override
	public List<Integer> carbonList() {
		
		List<Integer> list = carbondao.carbonList();
		
		return list;
	}

	
}
