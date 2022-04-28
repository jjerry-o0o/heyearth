package participation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mission.MissionDTO;

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

	  @Override public void participation_register_complete(ParticipationDTO dto) {//미션 신청하기(상시)
		  dao.participation_register_complete(dto); 
	  }
	  
	  @Override public void participation_register_complete2(ParticipationDTO dto) {//미션 신청하기(상시)
		  dao.participation_register_complete2(dto); 
	  }
	  
	  
	  @Override
	  public void delete(int p_code) {//미션 취소하기
		  dao.delete(p_code);
	  }
	  @Override
	  public void participation_delete2(ParticipationDTO dto) {//미션 취소하기2
		  dao.participation_delete2(dto);
	  }; 

	  @Override
	  public void participation_complete(ParticipationDTO dto) {//미션 완료하기 
		  dao.participation_complete(dto);
	  }; 
	  @Override
	  public void participation_complete2(ParticipationDTO dto) {//미션 완료하기 2
		  dao.participation_complete2(dto);
	  }; 
	  @Override
	  public void participation_review(ParticipationDTO dto) {//미션 리뷰쓰기
		  dao.participation_review(dto);
	  }; 
	  @Override
	  public void participation_register2(ParticipationDTO dto) {//미션 등록하기2
		  dao.participation_register2(dto);
	  }; 
	  @Override public int participation_friends(String id, int m_code) {//미션 참가 인원
	  return 0; 
	  }
		@Override
	    public ParticipationDTO mymission_detail(int p_code) {//나의 미션 상세페이지
	        return dao.mymission_detail(p_code);    
	    }

		@Override
		public void redcard(ParticipationDTO dto) {//레드카드
			dao.redcard(dto);
		}
		

	 
	
}//ServiceImpl Class end
	 


