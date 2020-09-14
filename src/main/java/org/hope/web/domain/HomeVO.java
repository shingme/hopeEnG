package org.hope.web.domain;


public class HomeVO {
	private int gllyNo;
	private String gllyNm;
	private String imgPstn;
	private String comment;
	private String subComment;
	private String firstFilePath;
	

	public int getgllyNo() {
		return gllyNo;
	}
	public void setgllyNo(int gllyNo) {
		this.gllyNo = gllyNo;
	}
	public String getgllyNm() {
		return gllyNm;
	}
	public void setgllyNm(String gllyNm) {
		this.gllyNm = gllyNm;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getSubComment() {
		return subComment;
	}
	public void setSubComment(String subComment) {
		this.subComment = subComment;
	}
	public String getImgPstn() {
		return imgPstn;
	}
	public void setImgPstn(String imgPstn) {
		this.imgPstn = imgPstn;
	}
	public String getFirstFilePath() {
		return firstFilePath;
	}
	public void setFirstFilePath(String firstFilePath) {
		this.firstFilePath = firstFilePath;
	}
	
}
