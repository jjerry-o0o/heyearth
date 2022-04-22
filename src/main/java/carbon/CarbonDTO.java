package carbon;

public class CarbonDTO {

	int carbon;
	int p_code;
	int p_complete;
	
	
	public int getCarbon() {
		return carbon;
	}
	public void setCarbon(int carbon) {
		this.carbon = carbon;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public int getP_complete() {
		return p_complete;
	}
	public void setP_complete(int p_complete) {
		this.p_complete = p_complete;
	}
	@Override
	public String toString() {
		return "CarbonDTO [carbon=" + carbon + ", p_code=" + p_code + ", p_complete=" + p_complete + "]";
	}
	public CarbonDTO(int carbon, int p_code, int p_complete) {
		super();
		this.carbon = carbon;
		this.p_code = p_code;
		this.p_complete = p_complete;
	}
	public CarbonDTO() {
		super();
	}
	
	
}
