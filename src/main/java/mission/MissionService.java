package mission;

import java.util.List;

import participation.ParticipationDTO;

public interface MissionService {
	public List<MissionDTO> missionlist_group_ing();
	public List<MissionDTO> missionlist_group_end();
	public List<MissionDTO> missionlist_solo_ing();
	public List<MissionDTO> missionlist_solo_end();
	public MissionDTO missiongroup(int m_code);
	public List<MissionDTO> missionreview(String m_name);
	public List<MissionDTO> missionreview2(String m_name);
		
}//Service Class end
