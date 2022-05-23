package zerokit;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("zerokitdao")
public interface ZerokitDAO {
	public ZerokitDTO zerokit (int k_code);
	public List<ZerokitDTO> zerokitlist();
	

}
