package borad.dto;

import java.util.Date;

public class BoardDTO {
	private Integer board_id; //pk
	private String board_title;
	private String board_content;
	private String board_password;
	private String board_writer;
	private Integer view_count;
	private Date write_date;
	
	
	
	public BoardDTO() {
	
	}
	
	
	public BoardDTO(Integer board_id, String board_title, String board_content, String board_password, String writer,
			Integer view_count, Date write_date) {
		super();
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_password = board_password;
		this.board_writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
	}
	
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_password() {
		return board_password;
	}
	public void setBoard_password(String board_password) {
		this.board_password = board_password;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String writer) {
		this.board_writer = writer;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	
}
