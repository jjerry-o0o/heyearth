package recycling;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("recyclingdao")
public interface RecyclingDAO {
	public List<RecyclingDTO> recycling (String r_class);
	public RecyclingDTO recyclingway (int r_code);
	public RecyclingDTO recyclinghowtoway(int r_code);
}
