package mission;

import java.util.List;

import participation.ParticipationDTO;

public interface MissionService {
	public List<MissionDTO> missionlist_group_ing();//모집중인 단체 미션
	public List<MissionDTO> missionlist_solo_ing();//모집중인 상시 미션
	public List<MissionDTO> missionlist_group_end();//마감된 단체 미션
	public List<MissionDTO> missionlist_solo_end();//마감된 상시 미션
	public MissionDTO missiongroup(int m_code);//단체미션 상세페이지
	public List<MissionDTO> missionreview(String m_name);//리뷰 목록
	public List<MissionDTO> missionreview2(String m_name);//리뷰 목록2
	public List<MissionDTO> missioncheck(String m_name);//미션 체크
		
}//Service Class end
