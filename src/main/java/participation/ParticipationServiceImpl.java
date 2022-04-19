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
	  public List<ParticipationDTO> participation_list(String id) {//나의 미션 목록
		return dao.participation_list(id);
      }
	
	  @Override public void participation_register(ParticipationDTO dto) {//미션 신청하기
	  dao.participation_register(dto); 
	  }
	  
	  
	  @Override
	  public void delete(int p_code) {//미션 취소하기
		  dao.delete(p_code);
	  }

	  @Override public int participation_friends(String id, int m_code) {//미션 참가 인원
	  return 0; 
	  }
	  
	 
	
}//ServiceImpl Class end
	 


