package participation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("participationservice")
public class ParticipationServiceImpl implements ParticipationService {

	@Autowired
	@Qualifier("participationdao")
	public ParticipationDAO dao;
	
	@Override
	public List<ParticipationDTO> participation_list(String id) {
		return dao.participation_list(id);
	}
	
	  @Override public void participation_register(ParticipationDTO dto) {
	  dao.participation_register(dto); 
	  }
	  
	  
	  @Override public int participation_friends(String id, int m_code) {
	  return 0; 
	  }
	 
	
	}
	 


