package member;

public interface MemberService {

	public int joinmember(MemberDTO dto);
	public int nicknameCheck(String id);
	public MemberDTO loginmember(String id, String pw);
	
	//회원정보 상세조회
	public MemberDTO memberView(String id);
	public int updatemember(String userId,String pw,String newpw,String newpwck);
	public int pwck(String pw);
}
