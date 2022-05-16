package zerokit;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("zerokitservice")
public class ZerokitServiceImpl implements ZerokitService{
	
	@Autowired
	@Qualifier("zerokitdao")
	public ZerokitDAO zerokitdao;

	@Override
	public ZerokitDTO zerokit(int k_code) {
		return zerokitdao.zerokit(k_code);
	}

	@Override
	public List<ZerokitDTO> zerokitlist() {
		return zerokitdao.zerokitlist();
	}
	
	
	
	
}
