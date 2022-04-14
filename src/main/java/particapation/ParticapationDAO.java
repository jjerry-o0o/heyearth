package particapation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("missiondao")
public interface ParticapationDAO {

	public List<ParticipationDTO> missionlist();
	 public ParticipationDTO missiongroup(int m_code);
}

