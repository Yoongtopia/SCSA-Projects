package com.orakgarak.vo;

public class TrendData {
	private String tradeDate;
	private int volume;
	private int price;
	private float growthRate;
	
	public TrendData() {
		super();
	}
	public TrendData(String tradeDate, int volume, int price, float growthRate) {
		super();
		this.tradeDate = tradeDate;
		this.volume = volume;
		this.price = price;
		this.growthRate = growthRate;
	}
	public String getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public float getGrowthRate() {
		return growthRate;
	}
	public void setGrowthRate(float growthRate) {
		this.growthRate = growthRate;
	}
	@Override
	public String toString() {
		return "TrendData [tradeDate=" + tradeDate + ", volume=" + volume
				+ ", price=" + price + ", growthRate=" + growthRate + "]";
	}

	
	
	

}
