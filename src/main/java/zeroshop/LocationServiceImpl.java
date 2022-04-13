package zeroshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("locationservice")
public class LocationServiceImpl implements LocationService {

	@Autowired
	@Qualifier("locationdao")
	public LocationDAO locdao;
	
	@Override
	public List<String> biglocation() {
		return locdao.biglocation();
	}

	
	@Override 
	public List<String> smalllocation(String big_loc) {
		return locdao.smalllocation(big_loc); 
	}
	 

}
