package com.orakgarak.vo;

public class DCF {

	private double revenue;
	private double cogs;
	private double sga;
	private double tax;
	private double capex;
	private int year;
	private String code;
	private String name;
	private double outstanding;
	private double rf;
	private double beta;
	private double kd;
	private double growth;
	private double debt;
	private double asset;
	private double equity;
	private double score;
	private int indCode;
	private String indName;
	private int date;
	private double price;
	
	private float score_dcf;
	private float score_multiple;
	private float score_trend;
	private float score_var;
	private float score_bigdata;
	
	
	
	public DCF() {
		super();
	}


	public DCF(double revenue, double cogs, double sga, double tax,
			double capex, int year, String code, String name,
			double outstanding, double rf, double beta, double kd,
			double growth, double debt, double asset, double equity,
			double score, int indCode, String indName, int date) {
		super();
		this.revenue = revenue;
		this.cogs = cogs;
		this.sga = sga;
		this.tax = tax;
		this.capex = capex;
		this.year = year;
		this.code = code;
		this.name = name;
		this.outstanding = outstanding;
		this.rf = rf;
		this.beta = beta;
		this.kd = kd;
		this.growth = growth;
		this.debt = debt;
		this.asset = asset;
		this.equity = equity;
		this.score = score;
		this.indCode = indCode;
		this.indName = indName;
		this.date = date;
	}


	public DCF(double revenue, double cogs, double sga, double tax,
			double capex, int year, String code, String name,
			double outstanding, double rf, double beta, double kd,
			double growth, double debt, double asset, double equity,
			double score, int indCode, String indName) {
		super();
		this.revenue = revenue;
		this.cogs = cogs;
		this.sga = sga;
		this.tax = tax;
		this.capex = capex;
		this.year = year;
		this.code = code;
		this.name = name;
		this.outstanding = outstanding;
		this.rf = rf;
		this.beta = beta;
		this.kd = kd;
		this.growth = growth;
		this.debt = debt;
		this.asset = asset;
		this.equity = equity;
		this.score = score;
		this.indCode = indCode;
		this.indName = indName;
	}


	public DCF(double revenue, double cogs, double sga, double tax,
			double capex, int year, String code, String name,
			double outstanding, double rf, double beta, double kd,
			double growth, double debt, double asset, double equity,
			double score, int indCode, String indName, int date, double price) {
		super();
		this.revenue = revenue;
		this.cogs = cogs;
		this.sga = sga;
		this.tax = tax;
		this.capex = capex;
		this.year = year;
		this.code = code;
		this.name = name;
		this.outstanding = outstanding;
		this.rf = rf;
		this.beta = beta;
		this.kd = kd;
		this.growth = growth;
		this.debt = debt;
		this.asset = asset;
		this.equity = equity;
		this.score = score;
		this.indCode = indCode;
		this.indName = indName;
		this.date = date;
		this.price = price;
	}

	

	public DCF(float score_dcf, float score_multiple, float score_trend,
			float score_var, float score_bigdata) {
		super();
		this.score_dcf = score_dcf;
		this.score_multiple = score_multiple;
		this.score_trend = score_trend;
		this.score_var = score_var;
		this.score_bigdata = score_bigdata;
	}
	
	

	public DCF(double revenue, double cogs, double sga, double tax,
			double capex, int year, String code, String name,
			double outstanding, double rf, double beta, double kd,
			double growth, double debt, double asset, double equity,
			double score, int indCode, String indName, int date, double price,
			float score_dcf, float score_multiple, float score_trend,
			float score_var, float score_bigdata) {
		super();
		this.revenue = revenue;
		this.cogs = cogs;
		this.sga = sga;
		this.tax = tax;
		this.capex = capex;
		this.year = year;
		this.code = code;
		this.name = name;
		this.outstanding = outstanding;
		this.rf = rf;
		this.beta = beta;
		this.kd = kd;
		this.growth = growth;
		this.debt = debt;
		this.asset = asset;
		this.equity = equity;
		this.score = score;
		this.indCode = indCode;
		this.indName = indName;
		this.date = date;
		this.price = price;
		this.score_dcf = score_dcf;
		this.score_multiple = score_multiple;
		this.score_trend = score_trend;
		this.score_var = score_var;
		this.score_bigdata = score_bigdata;
	}


	public DCF(String code, float score_dcf, float score_multiple,
			float score_trend, float score_var, float score_bigdata) {
		super();
		this.code = code;
		this.score_dcf = score_dcf;
		this.score_multiple = score_multiple;
		this.score_trend = score_trend;
		this.score_var = score_var;
		this.score_bigdata = score_bigdata;
	}


	public double getRevenue() {
		return revenue;
	}


	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}


	public double getCogs() {
		return cogs;
	}


	public void setCogs(double cogs) {
		this.cogs = cogs;
	}


	public double getSga() {
		return sga;
	}


	public void setSga(double sga) {
		this.sga = sga;
	}


	public double getTax() {
		return tax;
	}


	public void setTax(double tax) {
		this.tax = tax;
	}


	public double getCapex() {
		return capex;
	}


	public void setCapex(double capex) {
		this.capex = capex;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public double getOutstanding() {
		return outstanding;
	}


	public void setOutstanding(double outstanding) {
		this.outstanding = outstanding;
	}


	public double getRf() {
		return rf;
	}


	public void setRf(double rf) {
		this.rf = rf;
	}


	public double getBeta() {
		return beta;
	}


	public void setBeta(double beta) {
		this.beta = beta;
	}


	public double getKd() {
		return kd;
	}


	public void setKd(double kd) {
		this.kd = kd;
	}


	public double getGrowth() {
		return growth;
	}


	public void setGrowth(double growth) {
		this.growth = growth;
	}


	public double getDebt() {
		return debt;
	}


	public void setDebt(double debt) {
		this.debt = debt;
	}


	public double getAsset() {
		return asset;
	}


	public void setAsset(double asset) {
		this.asset = asset;
	}


	public double getEquity() {
		return equity;
	}


	public void setEquity(double equity) {
		this.equity = equity;
	}


	public double getScore() {
		return score;
	}


	public void setScore(double score) {
		this.score = score;
	}


	public int getIndCode() {
		return indCode;
	}


	public void setIndCode(int indCode) {
		this.indCode = indCode;
	}


	public String getIndName() {
		return indName;
	}


	public void setIndName(String indName) {
		this.indName = indName;
	}


	public int getDate() {
		return date;
	}


	public void setDate(int date) {
		this.date = date;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public float getScore_dcf() {
		return score_dcf;
	}


	public void setScore_dcf(float score_dcf) {
		this.score_dcf = score_dcf;
	}


	public float getScore_multiple() {
		return score_multiple;
	}


	public void setScore_multiple(float score_multiple) {
		this.score_multiple = score_multiple;
	}


	public float getScore_trend() {
		return score_trend;
	}


	public void setScore_trend(float score_trend) {
		this.score_trend = score_trend;
	}


	public float getScore_var() {
		return score_var;
	}


	public void setScore_var(float score_var) {
		this.score_var = score_var;
	}


	public float getScore_bigdata() {
		return score_bigdata;
	}


	public void setScore_bigdata(float score_bigdata) {
		this.score_bigdata = score_bigdata;
	}


	
	
	
	
	
	
}
