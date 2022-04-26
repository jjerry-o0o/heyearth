package mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import member.MemberDTO;
import mission.MissionDTO;

@Mapper
@Repository("myguidedao")
public interface MyguideDAO {

	    public List<MyguideDTO> guide_list(String id); //나의 가이드 목록
	    public int guide_insert(MyguideDTO dto); //가이드 스크랩하기
		public void delete(int p_code);//스크랩 삭제하기
				
		
}//DAO end