package com.orakgarak.vo;

import java.util.List;

public class Trend {
	private String code;
	private List<TrendData> trendDatalist;
	private double trendTenDay;
	private double trendThirtyDay;
	private double trendFiftyDay;
	private int score;
	
	public Trend() {
		super();
	}
	public Trend(String code, List<TrendData> trendDatalist,
			double trendTenDay, double trendThirtyDay, double trendFiftyDay,
			int score) {
		super();
		this.code = code;
		this.trendDatalist = trendDatalist;
		this.trendTenDay = trendTenDay;
		this.trendThirtyDay = trendThirtyDay;
		this.trendFiftyDay = trendFiftyDay;
		this.score = score;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<TrendData> getTrendDatalist() {
		return trendDatalist;
	}
	public void setTrendDatalist(List<TrendData> trendDatalist) {
		this.trendDatalist = trendDatalist;
	}
	public double getTrendTenDay() {
		return trendTenDay;
	}
	public void setTrendTenDay(double trendTenDay) {
		this.trendTenDay = trendTenDay;
	}
	public double getTrendThirtyDay() {
		return trendThirtyDay;
	}
	public void setTrendThirtyDay(double trendThirtyDay) {
		this.trendThirtyDay = trendThirtyDay;
	}
	public double getTrendFiftyDay() {
		return trendFiftyDay;
	}
	public void setTrendFiftyDay(double trendFiftyDay) {
		this.trendFiftyDay = trendFiftyDay;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Trend [code=" + code + ", trendDatalist=" + trendDatalist
				+ ", trendTenDay=" + trendTenDay + ", trendThirtyDay="
				+ trendThirtyDay + ", trendFiftyDay=" + trendFiftyDay
				+ ", score=" + score + "]";
	}

}
