package participation;

import java.util.List;

public interface ParticipationService {
	public List<ParticipationDTO> participation_list(String id);
	
	  public void participation_register(ParticipationDTO dto);
	  
	  public int participation_friends(String id, int m_code);
	 
}
