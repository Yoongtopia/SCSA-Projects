package com.orakgarak.vo;

public class Pentagon {
	
	private String stockCode;
	private int scoreDcf;
	private int scoreMultiple;
	private int scoreTrend;
	private int scoreRisk;
	private int scoreBigData;
	private int scoreSum;
	private String stockName;
	private String saveDate;
	public Pentagon() {
		super();
	}
	
	
	public Pentagon(String stockCode, int scoreMultiple, int scoreTrend,
			int scoreRisk, int scoreBigData, String stockName) {
		super();
		this.stockCode = stockCode;
		this.scoreMultiple = scoreMultiple;
		this.scoreTrend = scoreTrend;
		this.scoreRisk = scoreRisk;
		this.scoreBigData = scoreBigData;
		this.stockName = stockName;
	}


	public Pentagon(String stockCode, int scoreMultiple, int scoreTrend,
			int scoreRisk, int scoreBigData, int scoreSum, String stockName) {
		super();
		this.stockCode = stockCode;
		this.scoreMultiple = scoreMultiple;
		this.scoreTrend = scoreTrend;
		this.scoreRisk = scoreRisk;
		this.scoreBigData = scoreBigData;
		this.scoreSum = scoreSum;
		this.stockName = stockName;
	}


	public Pentagon(String stockCode, int scoreDcf, int scoreMultiple,
			int scoreTrend, int scoreRisk, int scoreBigData, int scoreSum,
			String stockName, String saveDate) {
		super();
		this.stockCode = stockCode;
		this.scoreDcf = scoreDcf;
		this.scoreMultiple = scoreMultiple;
		this.scoreTrend = scoreTrend;
		this.scoreRisk = scoreRisk;
		this.scoreBigData = scoreBigData;
		this.scoreSum = scoreSum;
		this.stockName = stockName;
		this.saveDate = saveDate;
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	public int getScoreDcf() {
		return scoreDcf;
	}
	public void setScoreDcf(int scoreDcf) {
		this.scoreDcf = scoreDcf;
	}
	public int getScoreMultiple() {
		return scoreMultiple;
	}
	public void setScoreMultiple(int scoreMultiple) {
		this.scoreMultiple = scoreMultiple;
	}
	public int getScoreTrend() {
		return scoreTrend;
	}
	public void setScoreTrend(int scoreTrend) {
		this.scoreTrend = scoreTrend;
	}
	public int getScoreRisk() {
		return scoreRisk;
	}
	public void setScoreRisk(int scoreRisk) {
		this.scoreRisk = scoreRisk;
	}
	public int getScoreBigData() {
		return scoreBigData;
	}
	public void setScoreBigData(int scoreBigData) {
		this.scoreBigData = scoreBigData;
	}
	public int getScoreSum() {
		return scoreSum;
	}
	public void setScoreSum(int scoreSum) {
		this.scoreSum = scoreSum;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
	@Override
	public String toString() {
		return "Pentagon [stockCode=" + stockCode + ", scoreDcf=" + scoreDcf
				+ ", scoreMultiple=" + scoreMultiple + ", scoreTrend="
				+ scoreTrend + ", scoreRisk=" + scoreRisk + ", scoreBigData="
				+ scoreBigData + ", scoreSum=" + scoreSum + ", stockName="
				+ stockName + ", saveDate=" + saveDate + "]";
	}
	
	
	
	
	
	

}
