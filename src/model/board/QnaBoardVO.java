package model.board;

public class QnaBoardVO {
//	q_idx      number         NOT NULL, 
//	id         VARCHAR2(20)   NOT NULL,
//	q_contents varchar2(2000) NOT NULL, 
//	q_title    varchar2(200)  NOT NULL,
//	filename   varchar2(255)  NULL,    
//	q_reply    number         NOT NULL, 
//	q_regdate  DATE           DEFAULT sysdate NOT NULL, 
//	q_readcnt  number         NOT NULL 
	
	private int q_idx;
	private String id;
	private String q_contents;
	private String q_title;
	private String filename;
	private int q_reply;
	private String q_regdate;
	private int q_readcnt;
	private int q_re_ref;
	private int q_re_lev;
	private int q_re_seq;
	private int q_parent;
	
	
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(int q_reply) {
		this.q_reply = q_reply;
	}
	public String getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	public int getQ_readcnt() {
		return q_readcnt;
	}
	public void setQ_readcnt(int q_readcnt) {
		this.q_readcnt = q_readcnt;
	}
	public int getQ_re_ref() {
		return q_re_ref;
	}
	public void setQ_re_ref(int q_re_ref) {
		this.q_re_ref = q_re_ref;
	}
	public int getQ_re_lev() {
		return q_re_lev;
	}
	public void setQ_re_lev(int q_re_lev) {
		this.q_re_lev = q_re_lev;
	}
	public int getQ_re_seq() {
		return q_re_seq;
	}
	public void setQ_re_seq(int q_re_seq) {
		this.q_re_seq = q_re_seq;
	}
	public int getQ_parent() {
		return q_parent;
	}
	public void setQ_parent(int q_parent) {
		this.q_parent = q_parent;
	}
	
	
}
