package member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	public int joinmember(MemberDTO dto);
	public int nicknameCheck(String id);
	public MemberDTO loginmember(String id, String pw);
	
	//회원정보조회
	public MemberDTO memberView(String id);
	public int updatemember(String id,String newpw,String phone);
	public int pwck(String pw);
	public int deletenum();
	public int deletemember(String id, String withdrawId);
}
