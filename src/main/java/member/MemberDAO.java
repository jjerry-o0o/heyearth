package member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	public int joinmember(MemberDTO dto);
	public int nicknameCheck(String id);
	public MemberDTO loginmember(String id, String pw);
	
}
