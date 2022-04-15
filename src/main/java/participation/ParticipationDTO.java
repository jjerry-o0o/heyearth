package participation;


public class ParticipationDTO {
	int p_code; //참가 미션 코드
	String id; //닉네임
    int m_code; //미션 코드
	int p_complete; //미션 완료 여부
	int p_star; //별점
	String p_review; //리뷰
	int p_photo; //리뷰 사진
	int p_friends; //참가 인원
	
	public int getP_friends() {
		return p_friends;
	}
	public void setP_friends(int p_friends) {
		this.p_friends = p_friends;
	}
	String m_name;
	String m_photo;
	
	
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_complete() {
		return p_complete;
	}
	public void setP_complete(int p_complete) {
		this.p_complete = p_complete;
	}
	public int getP_star() {
		return p_star;
	}
	public void setP_star(int p_star) {
		this.p_star = p_star;
	}
	public String getP_review() {
		return p_review;
	}
	public void setP_review(String p_review) {
		this.p_review = p_review;
	}
	public int getP_photo() {
		return p_photo;
	}
	public void setP_photo(int p_photo) {
		this.p_photo = p_photo;
	}
	
	
	

	
	
}
