package zerokit;

import org.springframework.web.multipart.MultipartFile;

public class ZerokitDTO {

	
	int k_code;
	String k_name;
	String k_text;
	String k_url;
	String k_photo;
	MultipartFile image;
	
	
	
	public int getK_code() {
		return k_code;
	}
	public void setK_code(int k_code) {
		this.k_code = k_code;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_text() {
		return k_text;
	}
	public void setK_text(String k_text) {
		this.k_text = k_text;
	}
	public String getK_url() {
		return k_url;
	}
	public void setK_url(String k_url) {
		this.k_url = k_url;
	}
	public String getK_photo() {
		return k_photo;
	}
	public void setK_photo(String k_photo) {
		this.k_photo = k_photo;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
	

}
