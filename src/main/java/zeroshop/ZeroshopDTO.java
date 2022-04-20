package zeroshop;

import org.springframework.web.multipart.MultipartFile;

public class ZeroshopDTO {
	int s_code;
	int l_code;
	String s_name;
	String s_url;
	String s_inform;
	String s_location;
	String s_call;
	String s_close;
	String s_hour;
	String s_photo;
	double latitude;
	double longitude;
	MultipartFile image;
	


	public ZeroshopDTO() {
		
	}
	
	
	public ZeroshopDTO(int s_code, int l_code, String s_name, String s_url, String s_inform, String s_location,
			String s_call, String s_close, String s_hour, String s_photo, double latitude, double longitude,
			MultipartFile image) {
		super();
		this.s_code = s_code;
		this.l_code = l_code;
		this.s_name = s_name;
		this.s_url = s_url;
		this.s_inform = s_inform;
		this.s_location = s_location;
		this.s_call = s_call;
		this.s_close = s_close;
		this.s_hour = s_hour;
		this.s_photo = s_photo;
		this.latitude = latitude;
		this.longitude = longitude;
		this.image = image;
	}

	public MultipartFile getImage() {
		return image;
	}
	
	
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}

	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public int getL_code() {
		return l_code;
	}
	public void setL_code(int l_code) {
		this.l_code = l_code;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_url() {
		return s_url;
	}
	public void setS_url(String s_url) {
		this.s_url = s_url;
	}
	public String getS_inform() {
		return s_inform;
	}
	public void setS_inform(String s_inform) {
		this.s_inform = s_inform;
	}
	public String getS_call() {
		return s_call;
	}
	public void setS_call(String s_call) {
		this.s_call = s_call;
	}
	public String getS_close() {
		return s_close;
	}
	public void setS_close(String s_close) {
		this.s_close = s_close;
	}
	public String getS_hour() {
		return s_hour;
	}
	public void setS_hour(String s_hour) {
		this.s_hour = s_hour;
	}
	public String getS_photo() {
		return s_photo;
	}
	public void setS_photo(String s_photo) {
		this.s_photo = s_photo;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	
}
