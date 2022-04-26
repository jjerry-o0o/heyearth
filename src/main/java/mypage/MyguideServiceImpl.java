package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mission.MissionDTO;

@Service("myguideservice")
public class MyguideServiceImpl implements MyguideService {

	@Autowired
	@Qualifier("myguidedao")
	public MyguideDAO dao;
	
	  @Override
	  public List<MyguideDTO> guide_list(String id) {//나의 가이드 목록
		return dao.guide_list(id);
      }
	
	  @Override public int guide_insert(MyguideDTO dto) {//가이드 스크랩하기
	  return dao.guide_insert(dto); 
	  }
	  
	
	  @Override
	  public void delete(int mg_code) {//스크랩 삭제하기
		  dao.delete(mg_code);
	  }

	
}//ServiceImpl Class end
	 


