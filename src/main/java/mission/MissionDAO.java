package mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("missiondao")
public interface MissionDAO {

	public List<MissionDTO> missionlist();
	 public MissionDTO missiongroup(int m_code);
}

