package zerokit;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("zerokitservice")
public class ZerokitServiceImpl implements ZerokitService{
	
	@Autowired
	@Qualifier("recyclingdao")
	public ZerokitDAO zerokitdao;
	
	
}
