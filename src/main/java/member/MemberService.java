package member;

public interface MemberService {

	public int joinmember(MemberDTO dto);
	public int nicknameCheck(String id);
	public MemberDTO loginmember(String id, String pw);
}
