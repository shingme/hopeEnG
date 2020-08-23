package org.hope.web.domain;

public class PagingVO {
	private int nowPage;
	private int startPage;
	private int endPage;
	private int total;
	private int cntPerPage; //페이지당 글 갯수
	private int lastPage; //마지막 페이지
	private int start;
	private int end;
	private int cntPage = 10;
	
	public PagingVO() {
	}
	
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	public void calcStartEndPage(int nowPage, int cntPage){ //시작, 끝 페이징 계산
		setEndPage((int)(Math.ceil((double)nowPage/cntPage)*cntPage));
		if(getLastPage() < getEndPage()){
			setEndPage(getLastPage());
		}
		
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1){
			setStartPage(1);
		}
	}
	
	public void calcLastPage(int total, int cntPerPage) { // 제일 마지막 페이지 계산
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

}
