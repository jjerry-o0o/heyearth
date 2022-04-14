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
	public List<MissionDTO> missionlist() {
		return dao.missionlist();
	}
	@Override
    public MissionDTO missiongroup(int m_code) {
        return dao.missiongroup(m_code);    
    }
	
	}
	 


