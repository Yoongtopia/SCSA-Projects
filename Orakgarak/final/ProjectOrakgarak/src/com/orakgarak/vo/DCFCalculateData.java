package com.orakgarak.vo;

//이 클래스는 DCF를 자동화 하기위한 코드입니다.
public class DCFCalculateData {
	
	private int year;
	private double revenue;
	private double cogs;
	private double sga;
	private double ebit;
	private double tax;
	private double noplat;
	private double capex;
	private double fcf;
	@Override
	public String toString() {
		return "DCFCalculateData [year=" + year + ", revenue=" + revenue
				+ ", cogs=" + cogs + ", sga=" + sga + ", ebit=" + ebit
				+ ", tax=" + tax + ", noplat=" + noplat + ", capex=" + capex
				+ ", fcf=" + fcf + "]";
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
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
	public double getEbit() {
		return ebit;
	}
	public void setEbit(double ebit) {
		this.ebit = ebit;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getNoplat() {
		return noplat;
	}
	public void setNoplat(double noplat) {
		this.noplat = noplat;
	}
	public double getCapex() {
		return capex;
	}
	public void setCapex(double capex) {
		this.capex = capex;
	}
	public double getFcf() {
		return fcf;
	}
	public void setFcf(double fcf) {
		this.fcf = fcf;
	}
	public DCFCalculateData(int year, double revenue, double cogs, double sga,
			double ebit, double tax, double noplat, double capex, double fcf) {
		super();
		this.year = year;
		this.revenue = revenue;
		this.cogs = cogs;
		this.sga = sga;
		this.ebit = ebit;
		this.tax = tax;
		this.noplat = noplat;
		this.capex = capex;
		this.fcf = fcf;
	}
	public DCFCalculateData() {
		super();
	}
	
	
	
}//end public class
