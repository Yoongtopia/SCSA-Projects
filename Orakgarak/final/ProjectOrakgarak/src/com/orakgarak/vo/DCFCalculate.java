package com.orakgarak.vo;

import java.util.List;

public class DCFCalculate {

	private String code;
	private String name;

	private List<DCFCalculateData> list;

	private int indCode;
	private String indName;
	private int date;
	
	private double rf;
	private double rm;
	private double rp; // 시장위험프리미엄
	
	private double debt;
	private double equity;
	private double asset;
	
	
	private double growth;

	private double capm;
	private double beta;
	
	private double rfAfterTax;
	private double wacc;
	

	private double avgRevenueGrowth;
	private double avgCogsGrowth;
	private double avgSgaGrowth;
	private double avgTaxGrowth;
	private double avgCapexGrowth;

	private long expectedFlow1;
	private long expectedFlow2;
	private long expectedFlow3;
	private long expectedFlow4;
	private long expectedFlow5; // 5년 이후 수익

	private long operatingValue;
	private long equityValue;
	private long outstanding;

	private double price;
	
	private int score;
	

	public DCFCalculate() {
		super();
	}

	public DCFCalculate(String code, String name, List<DCFCalculateData> list,
			int indCode, String indName, int date, double price, double wacc,
			double rf, double rm, double rp, double rfAfterTax, double growth,
			double debt, double equity, double asset, double capm, double beta,
			double avgRevenueGrowth, double avgCogsGrowth, double avgSgaGrowth,
			double avgTaxGrowth, double avgCapexGrowth, long expectedFlow1,
			long expectedFlow2, long expectedFlow3, long expectedFlow4,
			long expectedFlow5, long operatingValue, long equityValue,
			long outstanding, int score) {
		super();
		this.code = code;
		this.name = name;
		this.list = list;
		this.indCode = indCode;
		this.indName = indName;
		this.date = date;
		this.price = price;
		this.wacc = wacc;
		this.rf = rf;
		this.rm = rm;
		this.rp = rp;
		this.rfAfterTax = rfAfterTax;
		this.growth = growth;
		this.debt = debt;
		this.equity = equity;
		this.asset = asset;
		this.capm = capm;
		this.beta = beta;
		this.avgRevenueGrowth = avgRevenueGrowth;
		this.avgCogsGrowth = avgCogsGrowth;
		this.avgSgaGrowth = avgSgaGrowth;
		this.avgTaxGrowth = avgTaxGrowth;
		this.avgCapexGrowth = avgCapexGrowth;
		this.expectedFlow1 = expectedFlow1;
		this.expectedFlow2 = expectedFlow2;
		this.expectedFlow3 = expectedFlow3;
		this.expectedFlow4 = expectedFlow4;
		this.expectedFlow5 = expectedFlow5;
		this.operatingValue = operatingValue;
		this.equityValue = equityValue;
		this.outstanding = outstanding;
		this.score = score;
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

	public List<DCFCalculateData> getList() {
		return list;
	}

	public void setList(List<DCFCalculateData> list) {
		this.list = list;
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

	public double getWacc() {
		return wacc;
	}

	public void setWacc(double wacc) {
		this.wacc = wacc;
	}

	public double getRf() {
		return rf;
	}

	public void setRf(double rf) {
		this.rf = rf;
	}

	public double getRm() {
		return rm;
	}

	public void setRm(double rm) {
		this.rm = rm;
	}

	public double getRp() {
		return rp;
	}

	public void setRp(double rp) {
		this.rp = rp;
	}

	public double getRfAfterTax() {
		return rfAfterTax;
	}

	public void setRfAfterTax(double rfAfterTax) {
		this.rfAfterTax = rfAfterTax;
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

	public double getEquity() {
		return equity;
	}

	public void setEquity(double equity) {
		this.equity = equity;
	}

	public double getAsset() {
		return asset;
	}

	public void setAsset(double asset) {
		this.asset = asset;
	}

	public double getCapm() {
		return capm;
	}

	public void setCapm(double capm) {
		this.capm = capm;
	}

	public double getBeta() {
		return beta;
	}

	public void setBeta(double beta) {
		this.beta = beta;
	}

	public double getAvgRevenueGrowth() {
		return avgRevenueGrowth;
	}

	public void setAvgRevenueGrowth(double avgRevenueGrowth) {
		this.avgRevenueGrowth = avgRevenueGrowth;
	}

	public double getAvgCogsGrowth() {
		return avgCogsGrowth;
	}

	public void setAvgCogsGrowth(double avgCogsGrowth) {
		this.avgCogsGrowth = avgCogsGrowth;
	}

	public double getAvgSgaGrowth() {
		return avgSgaGrowth;
	}

	public void setAvgSgaGrowth(double avgSgaGrowth) {
		this.avgSgaGrowth = avgSgaGrowth;
	}

	public double getAvgTaxGrowth() {
		return avgTaxGrowth;
	}

	public void setAvgTaxGrowth(double avgTaxGrowth) {
		this.avgTaxGrowth = avgTaxGrowth;
	}

	public double getAvgCapexGrowth() {
		return avgCapexGrowth;
	}

	public void setAvgCapexGrowth(double avgCapexGrowth) {
		this.avgCapexGrowth = avgCapexGrowth;
	}

	public long getExpectedFlow1() {
		return expectedFlow1;
	}

	public void setExpectedFlow1(long expectedFlow1) {
		this.expectedFlow1 = expectedFlow1;
	}

	public long getExpectedFlow2() {
		return expectedFlow2;
	}

	public void setExpectedFlow2(long expectedFlow2) {
		this.expectedFlow2 = expectedFlow2;
	}

	public long getExpectedFlow3() {
		return expectedFlow3;
	}

	public void setExpectedFlow3(long expectedFlow3) {
		this.expectedFlow3 = expectedFlow3;
	}

	public long getExpectedFlow4() {
		return expectedFlow4;
	}

	public void setExpectedFlow4(long expectedFlow4) {
		this.expectedFlow4 = expectedFlow4;
	}

	public long getExpectedFlow5() {
		return expectedFlow5;
	}

	public void setExpectedFlow5(long expectedFlow5) {
		this.expectedFlow5 = expectedFlow5;
	}

	public long getOperatingValue() {
		return operatingValue;
	}

	public void setOperatingValue(long operatingValue) {
		this.operatingValue = operatingValue;
	}

	public long getEquityValue() {
		return equityValue;
	}

	public void setEquityValue(long equityValue) {
		this.equityValue = equityValue;
	}

	public long getOutstanding() {
		return outstanding;
	}

	public void setOutstanding(long outstanding) {
		this.outstanding = outstanding;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "DCFCalculate [code=" + code + ", name=" + name + ", list="
				+ list + ", indCode=" + indCode + ", indName=" + indName
				+ ", date=" + date + ", price=" + price + ", wacc=" + wacc
				+ ", rf=" + rf + ", rm=" + rm + ", rp=" + rp + ", rfAfterTax="
				+ rfAfterTax + ", growth=" + growth + ", debt=" + debt
				+ ", equity=" + equity + ", asset=" + asset + ", capm=" + capm
				+ ", beta=" + beta + ", avgRevenueGrowth=" + avgRevenueGrowth
				+ ", avgCogsGrowth=" + avgCogsGrowth + ", avgSgaGrowth="
				+ avgSgaGrowth + ", avgTaxGrowth=" + avgTaxGrowth
				+ ", avgCapexGrowth=" + avgCapexGrowth + ", expectedFlow1="
				+ expectedFlow1 + ", expectedFlow2=" + expectedFlow2
				+ ", expectedFlow3=" + expectedFlow3 + ", expectedFlow4="
				+ expectedFlow4 + ", expectedFlow5=" + expectedFlow5
				+ ", operatingValue=" + operatingValue + ", equityValue="
				+ equityValue + ", outstanding=" + outstanding + ", score="
				+ score + "]";
	}

	
	
	
	
}
