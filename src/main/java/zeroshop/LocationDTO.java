package zeroshop;

public class LocationDTO {
	int l_code;
	String big_loc;
	String small_loc;
	
	public LocationDTO() {
		
	}
	
	public LocationDTO(int l_code, String big_loc, String small_loc) {
		this.l_code = l_code;
		this.big_loc = big_loc;
		this.small_loc = small_loc;
	}
	
	public int getL_code() {
		return l_code;
	}
	public void setL_code(int l_code) {
		this.l_code = l_code;
	}
	public String getBig_loc() {
		return big_loc;
	}
	public void setBig_loc(String big_loc) {
		this.big_loc = big_loc;
	}
	public String getSmall_loc() {
		return small_loc;
	}
	public void setSmall_loc(String small_loc) {
		this.small_loc = small_loc;
	}
	
	
}
