package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberservice")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberdao;
	
	@Override
	public int joinmember(MemberDTO dto) {
		return memberdao.joinmember(dto);
	}

	@Override
	public int nicknameCheck(String id) {
		return memberdao.nicknameCheck(id);
	}

	@Override
	public MemberDTO loginmember(String id, String pw) {
		return memberdao.loginmember(id, pw);
	}
}
