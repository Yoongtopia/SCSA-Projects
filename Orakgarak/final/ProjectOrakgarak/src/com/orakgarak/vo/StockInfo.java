package com.orakgarak.vo;

public class StockInfo {
	private String code;
	private long price;
	private long priceVar;
	private int updown;
	private double percentage;
	public StockInfo() {
		super();
	}
	public StockInfo(String code, long price, long priceVar, int updown,
			double percentage) {
		super();
		this.code = code;
		this.price = price;
		this.priceVar = priceVar;
		this.updown = updown;
		this.percentage = percentage;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getPriceVar() {
		return priceVar;
	}
	public void setPriceVar(long priceVar) {
		this.priceVar = priceVar;
	}
	public int getUpdown() {
		return updown;
	}
	public void setUpdown(int updown) {
		this.updown = updown;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	@Override
	public String toString() {
		return "StockInfo [code=" + code + ", price=" + price + ", priceVar="
				+ priceVar + ", updown=" + updown + ", percentage="
				+ percentage + "]";
	}
	
	
	
}
