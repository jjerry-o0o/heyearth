package mission;

import java.util.List;

public interface MissionService {
	public List<MissionDTO> missionlist_group_ing();
	public List<MissionDTO> missionlist_group_end();
	public List<MissionDTO> missionlist_solo_ing();
	public List<MissionDTO> missionlist_solo_end();
	 public MissionDTO missiongroup(int m_code);
		
}//Service Class end
