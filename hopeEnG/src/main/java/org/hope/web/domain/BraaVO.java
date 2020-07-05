package org.hope.web.domain;

public class BraaVO {
	private String name;
	private String passwd;
	private String email;
	private String tellNm;
	private String title;
	private String content;
	//첨부파일 우선 제거 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTellNm() {
		return tellNm;
	}
	public void setTellNm(String tellNm) {
		this.tellNm = tellNm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
