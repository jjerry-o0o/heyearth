package particapation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("missionservice")
public class ParticipationServiceImpl implements ParticipationService {

	@Autowired
	@Qualifier("missiondao")
	public ParticapationDAO dao;
	
	@Override
	public List<ParticipationDTO> missionlist() {
		return dao.missionlist();
	}
	@Override
    public ParticipationDTO missiongroup(int m_code) {
        return dao.missiongroup(m_code);    
    }
	
	}
	 


