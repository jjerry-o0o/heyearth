package zeroshop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("zeroshopdao")
public interface ZeroshopDAO {
	public int locid(LocationDTO dto);
	public List<Integer> locidall(String big_loc);
	public List<ZeroshopDTO> loczero(int l_code);
	public ZeroshopDTO zeroshop(int s_code);
	public List<ZeroshopDTO> noll();
	public void setlatlong(ZeroshopDTO dto);
	public List<ZeroshopDTO> allzeroshop();
	public List<ZeroshopDTO> zeroshoplist();
}
