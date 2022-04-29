package participation;

import java.util.List;

public interface ParticipationService {
	  public List<ParticipationDTO> participation_list(String id);//나의 미션 목록
	  public void participation_register(ParticipationDTO dto);//미션 등록하기
	  public void participation_register2(ParticipationDTO dto); //미션 등록하기2
	  public void participation_register_complete(ParticipationDTO dto); //미션 신청하기(상시)
	  public void participation_register_complete2(ParticipationDTO dto); //미션 신청하기2(상시)
	  public void delete(int p_code);//미션 취소하기
	  public void participation_delete2(ParticipationDTO dto); //미션 취소하기2
	  public int participation_friends(String id, int m_code);//참가하는 인원
	  public void participation_complete(ParticipationDTO dto); //미션 완료하기 
	  public void participation_complete2(ParticipationDTO dto); //미션 완료하기2
	  public void participation_review(ParticipationDTO dto); //미션 리뷰쓰기
	  public ParticipationDTO mymission_detail(int p_code);//나의 미션 상세페이지
	  public void redcard(ParticipationDTO dto); //레드카드
	  
	 
}//Service Class end
