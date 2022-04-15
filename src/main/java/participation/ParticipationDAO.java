package participation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("participationdao")
public interface ParticipationDAO {

	 public List<ParticipationDTO> participation_list(String id); //내 미션 리스트
		public void participation_register(ParticipationDTO dto); //미션 등록하기 
		public int participation_friends(String id, int m_code); //미션 등록 인원
		 }

