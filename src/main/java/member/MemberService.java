package member;

public interface MemberService {

	public int joinmember(MemberDTO dto);
	public int nicknameCheck(String id);
	public MemberDTO loginmember(String id, String pw);
	
	//회원정보 상세조회
	public MemberDTO memberView(String id);
	public int updatemember(String id,String newpw,String phone);
	public int pwck(String pw);
	public int deletenum();
	public int deletemember(String id, String withdrawId);
}
