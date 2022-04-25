package board;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import paging.Criteria;

public class BoardDTO{
	
	int b_no;
	String id;
	String b_title;
	String b_content;
	Date b_regdate;
	int b_view;
	String b_type;
	String b_img;
	MultipartFile file;
	String regdate;
	Map<String, String> data;


	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	


	public BoardDTO() {
		super();
	}

	
	public BoardDTO(int b_no, String id, String b_title, String b_content, 
			Date b_regdate, int b_view, String b_type, String b_img) {
		super();
		this.b_no = b_no;
		this.id = id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_view = b_view;
		this.b_type = b_type;
		this.b_img = b_img;
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

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_view() {
		return b_view;
	}

	public void setB_view(int b_view) {
		this.b_view = b_view;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public String toString() {
		return "BoardDTO [b_no=" + b_no + ", id=" + id + ", b_title=" + b_title + ", b_content=" + b_content
				+ ", b_regdate=" + b_regdate + ", b_view=" + b_view + ", b_type=" + b_type + ", b_img=" + b_img + "]";
	}


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}


	public Map<String, String> getData() {
		return data;
	}


	public void setData(Map<String, String> data) {
		this.data = data;
	}
	
	
	
}