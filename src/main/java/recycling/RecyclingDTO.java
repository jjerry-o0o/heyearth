package recycling;

import org.springframework.web.multipart.MultipartFile;

public class RecyclingDTO {

	int r_code;
	String r_class;
	String r_name;
	String r_photo;
	String r_way;
	MultipartFile image;
	String selboxDirect;
	
	
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getSelboxDirect() {
		return selboxDirect;
	}
	public void setSelboxDirect(String selboxDirect) {
		this.selboxDirect = selboxDirect;
	}
	public String getR_class() {
		return r_class;
	}
	public void setR_class(String r_class) {
		this.r_class = r_class;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_photo() {
		return r_photo;
	}
	public void setR_photo(String r_photo) {
		this.r_photo = r_photo;
	}
	public String getR_way() {
		return r_way;
	}
	public void setR_way(String r_way) {
		this.r_way = r_way;
	}
}
