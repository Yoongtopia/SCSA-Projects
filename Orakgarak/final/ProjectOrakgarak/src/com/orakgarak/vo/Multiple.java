	package com.orakgarak.vo;

public class Multiple {

	private String stockCode;
	private String industryCode;
	private String stockName;
	private String industryName;
	private long debt;
	private long cash;
	private long netDebt;
	private long marketValue;
	private long ev;
	private long ebitda;
	private float multipleResult;
	private String multipleDesc;
	private int score;
	
	public Multiple() {
		super();
	}
	
	public Multiple(String stockName, float multipleResult) {
		super();
		this.stockName = stockName;
		this.multipleResult = multipleResult;
	}

	public Multiple(String stockCode, String industryCode, String stockName,
			String industryName, long debt, long cash, long netDebt,
			long ev, long ebitda, float multipleResult) {
		super();
		this.stockCode = stockCode;
		this.industryCode = industryCode;
		this.stockName = stockName;
		this.industryName = industryName;
		this.debt = debt;
		this.cash = cash;
		this.netDebt = netDebt;
		this.ev = ev;
		this.ebitda = ebitda;
		this.multipleResult = multipleResult;
	}
	
	
	
	

	public Multiple(String stockCode, String industryCode, String stockName,
			String industryName, long debt, long cash, long netDebt,
			long marketValue, long ev, long ebitda, float multipleResult,
			String multipleDesc) {
		super();
		this.stockCode = stockCode;
		this.industryCode = industryCode;
		this.stockName = stockName;
		this.industryName = industryName;
		this.debt = debt;
		this.cash = cash;
		this.netDebt = netDebt;
		this.marketValue = marketValue;
		this.ev = ev;
		this.ebitda = ebitda;
		this.multipleResult = multipleResult;
		this.multipleDesc = multipleDesc;
	}

	public Multiple(String stockCode, String industryCode, String stockName,
			String industryName, long debt, long cash, long netDebt,
			long marketValue, long ev, long ebitda, float multipleResult,
			int score) {
		super();
		this.stockCode = stockCode;
		this.industryCode = industryCode;
		this.stockName = stockName;
		this.industryName = industryName;
		this.debt = debt;
		this.cash = cash;
		this.netDebt = netDebt;
		this.marketValue = marketValue;
		this.ev = ev;
		this.ebitda = ebitda;
		this.multipleResult = multipleResult;
		this.score = score;
	}

	public Multiple(String stockCode, String industryCode, String stockName,
			String industryName, long debt, long cash, long netDebt,
			long marketValue, long ev, long ebitda,
			float multipleResult, String multipleDesc, int score) {
		super();
		this.stockCode = stockCode;
		this.industryCode = industryCode;
		this.stockName = stockName;
		this.industryName = industryName;
		this.debt = debt;
		this.cash = cash;
		this.netDebt = netDebt;
		this.marketValue = marketValue;
		this.ev = ev;
		this.ebitda = ebitda;
		this.multipleResult = multipleResult;
		this.multipleDesc = multipleDesc;
		this.score = score;
	}

	public String getStockName() {
		return stockName;
	}



	public void setStockName(String stockName) {
		this.stockName = stockName;
	}



	public String getIndustryName() {
		return industryName;
	}


	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}


	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}


	public String getIndustryCode() {
		return industryCode;
	}


	public void setIndustryCode(String industryCode) {
		this.industryCode = industryCode;
	}


	public long getDebt() {
		return debt;
	}

	public void setDebt(long debt) {
		this.debt = debt;
	}

	public long getCash() {
		return cash;
	}

	public void setCash(long cash) {
		this.cash = cash;
	}

	public long getNetDebt() {
		return netDebt;
	}

	public void setNetDebt(long netDebt) {
		this.netDebt = netDebt;
	}

	public long getMarketValue() {
		return marketValue;
	}

	public void setMarketValue(long marketValue) {
		this.marketValue = marketValue;
	}

	public long getEv() {
		return ev;
	}

	public void setEv(long ev) {
		this.ev = ev;
	}

	public long getEbitda() {
		return ebitda;
	}

	public void setEbitda(long ebitda) {
		this.ebitda = ebitda;
	}

	public Float getMultipleResult() {
		return multipleResult;
	}

	public void setMultipleResult(float multipleResult) {
		this.multipleResult = multipleResult;
	}

	public String getMultipleDesc() {
		return multipleDesc;
	}

	public void setMultipleDesc(String multipleDesc) {
		this.multipleDesc = multipleDesc;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
		
}
