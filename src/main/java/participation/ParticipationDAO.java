package participation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("participationdao")
public interface ParticipationDAO {

	    public List<ParticipationDTO> participation_list(String id); //나의 미션 목록
		public void participation_register(ParticipationDTO dto); //미션 등록하기 
		public void delete(int p_code);//미션 취소하기
		public int participation_friends(String id, int m_code); //미션 등록 인원

}//DAO end