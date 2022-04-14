package zeroshop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("zeroshopdao")
public interface ZeroshopDAO {
	public int locid(LocationDTO dto);
	public List<ZeroshopDTO> loczero(int l_code);
}
