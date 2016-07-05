package com.orakgarak.admin;

import com.orakgarak.vo.Pentagon;

public class PentagonAdmin extends Pentagon {

	private int pentagonNewsCountEveryDay;
	private double newsScore1;
	private double newsScore2;
	private double newsScore3;
	private int pentagonTodayPrice;
	public PentagonAdmin(int pentagonNewsCountEveryDay, double newsScore1,
			double newsScore2, double newsScore3, int pentagonTodayPrice) {
		super();
		this.pentagonNewsCountEveryDay = pentagonNewsCountEveryDay;
		this.newsScore1 = newsScore1;
		this.newsScore2 = newsScore2;
		this.newsScore3 = newsScore3;
		this.pentagonTodayPrice = pentagonTodayPrice;
	}
	public PentagonAdmin() {
		super();
	}
	public int getPentagonNewsCountEveryDay() {
		return pentagonNewsCountEveryDay;
	}
	public void setPentagonNewsCountEveryDay(int pentagonNewsCountEveryDay) {
		this.pentagonNewsCountEveryDay = pentagonNewsCountEveryDay;
	}
	public double getNewsScore1() {
		return newsScore1;
	}
	public void setNewsScore1(double newsScore1) {
		this.newsScore1 = newsScore1;
	}
	public double getNewsScore2() {
		return newsScore2;
	}
	public void setNewsScore2(double newsScore2) {
		this.newsScore2 = newsScore2;
	}
	public double getNewsScore3() {
		return newsScore3;
	}
	public void setNewsScore3(double newsScore3) {
		this.newsScore3 = newsScore3;
	}
	public int getPentagonTodayPrice() {
		return pentagonTodayPrice;
	}
	public void setPentagonTodayPrice(int pentagonTodayPrice) {
		this.pentagonTodayPrice = pentagonTodayPrice;
	}
	@Override
	public String toString() {
		return "PentagonAdmin [pentagonNewsCountEveryDay="
				+ pentagonNewsCountEveryDay + ", newsScore1=" + newsScore1
				+ ", newsScore2=" + newsScore2 + ", newsScore3=" + newsScore3
				+ ", pentagonTodayPrice=" + pentagonTodayPrice + "]";
	}
	
	
	
	
	
}//end public class
