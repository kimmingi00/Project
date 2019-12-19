package model.board;

public class NoticeBoardVO {
//	idx      number         NOT NULL,
//	id       VARCHAR2(20)   NOT NULL, 
//	title    VARCHAR2(100)  NOT NULL, 
//	contents VARCHAR2(2000) NOT NULL, 
//	filename VARCHAR2(1000) NULL,    
//	regdate  DATE          DEFAULT sysdate NOT NULL
	private int idx;
	private String id;
	private String title;
	private String contents;
	private String filename;
	private String regdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
