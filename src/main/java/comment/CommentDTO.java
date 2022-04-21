package comment;

public class CommentDTO {

	int c_index;
	int b_no;
	String id;
	String c_comment;
	int c_class;
	int c_order;
	int c_groupNum;
	
	
	public CommentDTO() {
		super();
	}

	public CommentDTO(int c_index, int b_no, String id, String c_comment, int c_class, int c_order, int c_groupNum) {
		super();
		this.c_index = c_index;
		this.b_no = b_no;
		this.id = id;
		this.c_comment = c_comment;
		this.c_class = c_class;
		this.c_order = c_order;
		this.c_groupNum = c_groupNum;
	}
	
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public int getC_class() {
		return c_class;
	}
	public void setC_class(int c_class) {
		this.c_class = c_class;
	}
	public int getC_order() {
		return c_order;
	}
	public void setC_order(int c_order) {
		this.c_order = c_order;
	}
	public int getC_groupNum() {
		return c_groupNum;
	}
	public void setC_groupNum(int c_groupNum) {
		this.c_groupNum = c_groupNum;
	}
	
	@Override
	public String toString() {
		return "CommentDTO [c_index=" + c_index + ", b_no=" + b_no + ", id=" + id + ", c_comment=" + c_comment
				+ ", c_class=" + c_class + ", c_order=" + c_order + ", c_groupNum=" + c_groupNum + "]";
	}
	
	
}
