package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mission.MissionDTO;

@Service("couponservice")
public class CouponServiceImpl implements CouponService {

	@Autowired
	@Qualifier("coupondao")
	public CouponDAO dao;
	
	  @Override
	  public List<CouponDTO> coupon_list(String id){ //나의 쿠폰 목록
		return dao.coupon_list(id);
      }
	
	  @Override 
	  public int coupon_insert(CouponDTO dto) { //쿠폰 등록하기
	  return dao.coupon_insert(dto); 
	  }
	  @Override 
	  public void coupon_point(CouponDTO dto) { //멤버 포인트 변경
		  dao.coupon_point(dto);
	  }
}//ServiceImpl Class end
	 


