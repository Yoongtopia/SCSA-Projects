package com.orakgarak.vo;

public class Industry {
	private int wicscode;
	private String wicsname;
	private int krxcode;
	private String krxname;
	private double beta;
	private double multiple;
	private double cagr;
	public Industry() {
		super();
	}
	public Industry(int wicscode, String wicsname, int krxcode, String krxname,
			double beta, double multiple, double cagr) {
		super();
		this.wicscode = wicscode;
		this.wicsname = wicsname;
		this.krxcode = krxcode;
		this.krxname = krxname;
		this.beta = beta;
		this.multiple = multiple;
		this.cagr = cagr;
	}
	public int getWicscode() {
		return wicscode;
	}
	public void setWicscode(int wicscode) {
		this.wicscode = wicscode;
	}
	public String getWicsname() {
		return wicsname;
	}
	public void setWicsname(String wicsname) {
		this.wicsname = wicsname;
	}
	public int getKrxcode() {
		return krxcode;
	}
	public void setKrxcode(int krxcode) {
		this.krxcode = krxcode;
	}
	public String getKrxname() {
		return krxname;
	}
	public void setKrxname(String krxname) {
		this.krxname = krxname;
	}
	public double getBeta() {
		return beta;
	}
	public void setBeta(double beta) {
		this.beta = beta;
	}
	public double getMultiple() {
		return multiple;
	}
	public void setMultiple(double multiple) {
		this.multiple = multiple;
	}
	public double getCagr() {
		return cagr;
	}
	public void setCagr(double cagr) {
		this.cagr = cagr;
	}
	@Override
	public String toString() {
		return "Industry [wicscode=" + wicscode + ", wicsname=" + wicsname
				+ ", krxcode=" + krxcode + ", krxname=" + krxname + ", beta="
				+ beta + ", multiple=" + multiple + ", cagr=" + cagr + "]";
	}
	
	
}
