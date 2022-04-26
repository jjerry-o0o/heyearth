package mypage;

import java.util.List;

public interface MyguideService {
	   public List<MyguideDTO> guide_list(String id); //나의 가이드 목록
	    public int guide_insert(MyguideDTO dto); //가이드 스크랩하기 
		public void delete(int mg_code);//스크랩 삭제하기
				
	 
}//Service Class end
