package com.orakgarak.vo;

public class Risk {
	private String code;
	private double stdev;
	private double confidenceLevel; // 99%는 2.326 98% 1.645 90
	private long asset;
	private int days;
	private double riskAsset;
	private int score;
	public Risk() {
		super();
		//기본값으로 신뢰도 99%, 10일추정, 100만원을 줍니다.
		this.confidenceLevel = 99;
		this.days = 10;
		this.asset = 1000000;
		
	}
	
	
	public Risk(String code, double stdev, double confidenceLevel, long asset,
			int days, double riskAsset, int score) {
		super();
		this.code = code;
		this.stdev = stdev;
		this.confidenceLevel = confidenceLevel;
		this.asset = asset;
		this.days = days;
		this.riskAsset = riskAsset;
		this.score = score;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getStdev() {
		return stdev;
	}
	public void setStdev(double stdev) {
		this.stdev = stdev;
	}
	public double getConfidenceLevel() {
		return confidenceLevel;
	}
	public void setConfidenceLevel(double confidenceLevel) {
		this.confidenceLevel = confidenceLevel;
	}
	public long getAsset() {
		return asset;
	}
	public void setAsset(long asset) {
		this.asset = asset;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public double getRiskAsset() {
		return riskAsset;
	}
	public void setRiskAsset(double riskAsset) {
		this.riskAsset = riskAsset;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Risk [code=" + code + ", stdev=" + stdev + ", confidenceLevel="
				+ confidenceLevel + ", asset=" + asset + ", days=" + days
				+ ", riskAsset=" + riskAsset + ", score=" + score + "]";
	}


	
	
	
}
