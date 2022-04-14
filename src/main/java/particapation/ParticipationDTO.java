package particapation;

import java.sql.Date;//맞나..?

public class ParticipationDTO {
	int m_code; //미션 코드
	String m_type; //미션 타입(그룹/상시)
	String m_name; //미션 이름
	String m_location; //미션 장소
	Date m_date; //미션 날짜
	String m_inform; //미션 정보
	int m_carbon; //미션 탄소배출감소량
	int m_point; //미션 포인트
	int m_personnel; //미션 인원
	
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
