package mission;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MissionDTO {
	int m_code; //미션 코드
	String m_type; //미션 타입(그룹/상시)
	String m_name; //미션 이름
	String m_location; //미션 장소
	Date m_date; //미션 날짜
	String m_inform; //미션 정보
	int m_carbon; //미션 탄소배출감소량
	int m_point; //미션 포인트
	int m_personnel; //미션 인원
	int p_star; //참가미션 별점
	String p_review; //참가미션 리뷰
	int p_code; //참가미션코드
	String id; //닉네임
	String p_photo; //미션 인증 사진
	int p_complete; //미션 완료 여부
	int grade; //회원 등급
	int p_redcard;//참가미션 레드카드
	String star;

	public int getP_redcard() {
		return p_redcard;
	}
	public void setP_redcard(int p_redcard) {
		this.p_redcard = p_redcard;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}

	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getP_complete() {
		return p_complete;
	}
	public void setP_complete(int p_complete) {
		this.p_complete = p_complete;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
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
	MultipartFile image;
	String selboxDirect;
	
	public String getSelboxDirect() {
		return selboxDirect;
	}
	public void setSelboxDirect(String selboxDirect) {
		this.selboxDirect = selboxDirect;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_location() {
		return m_location;
	}
	public void setM_location(String m_location) {
		this.m_location = m_location;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_inform() {
		return m_inform;
	}
	public void setM_inform(String m_inform) {
		this.m_inform = m_inform;
	}
	public int getM_carbon() {
		return m_carbon;
	}
	public void setM_carbon(int m_carbon) {
		this.m_carbon = m_carbon;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public int getM_personnel() {
		return m_personnel;
	}
	public void setM_personnel(int m_personnel) {
		this.m_personnel = m_personnel;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	String m_photo;
	
	

	
	
}
