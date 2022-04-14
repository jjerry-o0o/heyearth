package particapation;

import java.util.List;

public interface ParticipationService {
	public List<ParticipationDTO> missionlist();
	 public ParticipationDTO missiongroup(int m_code);
		
}
