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
	public String findid(String phone);
	public int phoneCheck(String phone);
	public String findpw(String id, String phone);
	
	// 마지막 접속일 저장
	public void joindate(String id);
	// 탈퇴 이유 알려주기
	public String delreason(String del_code);
}
