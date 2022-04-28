package grade;

public class GradeDTO {
	int g_code; //등급 
	int g_start; //탄소배출감소량 시작
	int g_end; //탄소배출감소량 끝
	
	
	public GradeDTO() {
		
	}
	
	public GradeDTO(int g_code, int g_start, int g_end) {
		super();
		this.g_code = g_code;
		this.g_start = g_start;
		this.g_end = g_end;
	}

	public int getG_code() {
		return g_code;
	}
	
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	
	public int getG_start() {
		return g_start;
	}
	
	public void setG_start(int g_start) {
		this.g_start = g_start;
	}
	
	public int getG_end() {
		return g_end;
	}
	
	public void setG_end(int g_end) {
		this.g_end = g_end;
	}
	
}
