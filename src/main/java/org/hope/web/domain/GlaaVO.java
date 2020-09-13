package org.hope.web.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GlaaVO {
	private int gllyNo;
	private String gllyNm;
	private String gllyCts;
	//private String showMainYn;
	private String imgPstn;
	private String comment;
	private String subComment;
	private String regiDate;
	private String modyDate;
	private List<MultipartFile> files;
	private List<GlaaFileVO> glaaFileVO;
	private String firstFilePath;
	
	public String getImgPstn() {
		return imgPstn;
	}
	public void setImgPstn(String imgPstn) {
		this.imgPstn = imgPstn;
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
	public List<GlaaFileVO> getGlaaFileVO() {
		return glaaFileVO;
	}
	public void setGlaaFileVO(List<GlaaFileVO> glaaFileVO) {
		this.glaaFileVO = glaaFileVO;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
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
	public String getgllyCts() {
		return gllyCts;
	}
	public void setgllyCts(String gllyCts) {
		this.gllyCts = gllyCts;
	}

	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public String getModyDate() {
		return modyDate;
	}
	public void setModyDate(String modyDate) {
		this.modyDate = modyDate;
	}
	
	public String getFirstFilePath() {
		return firstFilePath;
	}
	public void setFirstFilePath(String firstFilePath) {
		this.firstFilePath = firstFilePath;
	}
	@Override
	public String toString() {
		return "GlaaVO [gllyNo=" + gllyNo + ", gllyNm=" + gllyNm + ", gllyCts=" + gllyCts + ", imgPstn=" + imgPstn
				+ ", comment=" + comment + ", subComment=" + subComment + ", regiDate=" + regiDate + ", modyDate="
				+ modyDate + ", files=" + files + ", glaaFileVO=" + glaaFileVO + ", firstFilePath=" + firstFilePath
				+ "]";
	}

	



	
	
}
