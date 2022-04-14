package mission;

import java.util.List;

public interface MissionService {
	public List<MissionDTO> missionlist();
	 public MissionDTO missiongroup(int m_code);
		
}
