package com.orakgarak.util;

public class PageUtil {

	private int pageNum;//���� ������ ��ȣ
	private int startRow;//�������ȣ
	private int endRow;//�����ȣ
	private int totalPageCount;//��ü����������
	private int startPageNum;//���������� ��ȣ
	private int endPageNum;//�������� ��ȣ
	private int rowBlockCount;//�������� ������ ���� ����
	private int pageBlockCount;//�������� ������ �������� ����
	private int totalRowCount;//��ü ���� ����
	
	public PageUtil(){}
	/**
	 * @param pageNum ��������ȣ
	 * @param rowBlockCount ���������� ����
	 * @param pageBlockCount ������������ ����
	 * @param totalRowCount ��ü���� ����
	 */

	public PageUtil(int pageNum, int rowBlockCount, int pageBlockCount,
			int totalRowCount) {
		//���������� ���� ������ 10��
		this.pageNum = pageNum;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;
		this.totalRowCount = totalRowCount;
		//�������ȣ
		startRow = (pageNum-1)*rowBlockCount+1;
		//�����ȣ 20�̵Ǹ� �ȵǴϱ� -1
		endRow = startRow+rowBlockCount-1;
		//��ü���������� totalRowCount�̰Ŵ� db���� �������ش�.
		totalPageCount = (int)Math.ceil(totalRowCount/(double)rowBlockCount);//�����ϳ��� �Ǽ���
		//��������������
		startPageNum = (pageNum-1)/pageBlockCount*pageBlockCount+1;
		//������������ȣ
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
