package participation;

import java.util.List;

public interface ParticipationService {
	  public List<ParticipationDTO> participation_list(String id);//나의 미션 목록
	  public void participation_register(ParticipationDTO dto);//미션 신청하기
	  public void delete(int p_code);//미션 취소하기
	  public int participation_friends(String id, int m_code);//참가하는 인원
	  
	 
}//Service Class end
