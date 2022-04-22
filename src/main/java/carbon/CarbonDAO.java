package carbon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("carbondao")
public interface CarbonDAO {

	//회원 수 조회
	public int memberCount();
	
	//총 미션 참가자 수 조회
	public int partCount();
	
	//회원별 탄소배출감소량 조회
	public List<Integer> carbonList();
}
