package mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("coupondao")
public interface CouponDAO {

	    public List<CouponDTO> coupon_list(String id); //나의 쿠폰 목록
	    public int coupon_insert(CouponDTO dto); //쿠폰 등록하기
				
		
}//DAO end