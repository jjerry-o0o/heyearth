package comment;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentDTO {

	int b_no;
	int c_index;
	int c_order;
	String c_comment;
	String id;
	Date c_regdate;
	
	public CommentDTO() {
		
	}
	
	public CommentDTO(int b_no, int c_index, int c_order, String c_comment) {
		super();
		this.b_no = b_no;
		this.c_index = c_index;
		this.c_order = c_order;
		this.c_comment = c_comment;
	}


	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	public int getC_order() {
		return c_order;
	}
	public void setC_order(int c_order) {
		this.c_order = c_order;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	
	
}
