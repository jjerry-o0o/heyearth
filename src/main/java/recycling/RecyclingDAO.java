package recycling;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("recyclingdao")
public interface RecyclingDAO {
	public RecyclingDTO recycling (String r_class);

}
