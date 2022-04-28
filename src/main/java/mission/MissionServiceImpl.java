package mission;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("missionservice")
public class MissionServiceImpl implements MissionService {

	@Autowired
	@Qualifier("missiondao")
	public MissionDAO dao;
	
	@Override
	public List<MissionDTO> missionlist_group_ing() {//모집중인 단체미션	목록
			return dao.missionlist_group_ing();
	    
		}
	@Override
	public List<MissionDTO> missionlist_group_end() {//마감된 단체미션	목록
		return dao.missionlist_group_end();
		
	}
	@Override
	public List<MissionDTO> missionlist_solo_ing() {//모집중인 싱시미션	목록	
		return dao.missionlist_solo_ing();
		
	}
	@Override
	public List<MissionDTO> missionlist_solo_end() {//마감된 상시미션 목록	
		return dao.missionlist_solo_end();
		
	}
	@Override
    public MissionDTO missiongroup(int m_code) {//미션 상세페이지
        return dao.missiongroup(m_code);    
    }
	@Override
	public List<MissionDTO> missionreview(String m_name) {//리뷰 목록
		return dao.missionreview(m_name);    
	}
	@Override
	public List<MissionDTO> missionreview2(String m_name) {//리뷰 목록2
		return dao.missionreview2(m_name);    
	}
	@Override
	public List<MissionDTO> missioncheck(String m_name) {//미션 체크
		return dao.missioncheck(m_name);    
	}
	
}//ServiceImpl Class end
	 


