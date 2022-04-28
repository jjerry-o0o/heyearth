package member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	String id;
	String phone;
	String pw;
	String photo;
	int grade;
	int point;
	int admin;
	int carbon;
	MultipartFile image;
	String newpw;
	String newpwck;
	String del;
	
	
	

	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getNewpw() {
		return newpw;
	}
	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}
	public String getNewpwck() {
		return newpwck;
	}
	public void setNewpwck(String newpwck) {
		this.newpwck = newpwck;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public int getCarbon() {
		return carbon;
	}
	public void setCarbon(int carbon) {
		this.carbon = carbon;
	}
	
}
