package com.orakgarak.util;

public class PageUtil {

	private int pageNum;//현재 페이지 번호
	private int startRow;//시작행번호
	private int endRow;//끝행번호
	private int totalPageCount;//전체페이지갯수
	private int startPageNum;//시작페이지 번호
	private int endPageNum;//끝페이지 번호
	private int rowBlockCount;//한페이지 보여줄 글의 갯수
	private int pageBlockCount;//한페이지 보여줄 페이지의 갯수
	private int totalRowCount;//전체 글의 갯수
	
	public PageUtil(){}
	/**
	 * @param pageNum 페이지번호
	 * @param rowBlockCount 보여줄행의 갯수
	 * @param pageBlockCount 보여줄페이지 갯수
	 * @param totalRowCount 전체글의 갯수
	 */

	public PageUtil(int pageNum, int rowBlockCount, int pageBlockCount,
			int totalRowCount) {
		//한페이지의 글의 갯수는 10개
		this.pageNum = pageNum;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;
		this.totalRowCount = totalRowCount;
		//시작행번호
		startRow = (pageNum-1)*rowBlockCount+1;
		//끝행번호 20이되면 안되니까 -1
		endRow = startRow+rowBlockCount-1;
		//전체페이지갯수 totalRowCount이거는 db에서 셀럭해준다.
		totalPageCount = (int)Math.ceil(totalRowCount/(double)rowBlockCount);//둘중하나만 실수로
		//시작페이지갯수
		startPageNum = (pageNum-1)/pageBlockCount*pageBlockCount+1;
		//끝행페이지번호
		endPageNum=startPageNum+pageBlockCount-1;
		if(totalPageCount<endPageNum){
			endPageNum=totalPageCount;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getRowBlockCount() {
		return rowBlockCount;
	}
	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}
	public int getPageBlockCount() {
		return pageBlockCount;
	}
	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	@Override
	public String toString() {
		return "PageUtil [pageNum=" + pageNum + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", totalPageCount=" + totalPageCount
				+ ", startPageNum=" + startPageNum + ", endPageNum="
				+ endPageNum + ", rowBlockCount=" + rowBlockCount
				+ ", pageBlockCount=" + pageBlockCount + ", totalRowCount="
				+ totalRowCount + "]";
	}
	
	
	
}
