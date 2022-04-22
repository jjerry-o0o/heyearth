package zeroshop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("locationdao")
public interface LocationDAO {
	public List<String> biglocation();
	public List<String> smalllocation(String big_loc); 
	
}
