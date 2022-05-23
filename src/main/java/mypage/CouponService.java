package mypage;

import java.util.List;

public interface CouponService {
	 public List<CouponDTO> coupon_list(String id); //나의 쿠폰 목록
	    public int coupon_insert(CouponDTO dto); //쿠폰 등록하기
	    public void coupon_point(CouponDTO dto); //멤버 포인트 변경
	 
}//Service Class end
