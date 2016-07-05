package com.orakgarak.vo;

public class SimulatedStock { // 주식하나의 객체를 표시하기 위해 만들었음..모의투자용 VO임
	
	private long tradeSeq;
	private String userId;
	private String code;
	private String name;
	private long oldPrice;
	private long oldVolume;
	private String date;
	private long currentPrice;
	public SimulatedStock() {
		super();
	}
	public SimulatedStock(long tradeSeq, String userId, String code,
			String name, long oldPrice, long oldVolume, String date,
			long currentPrice) {
		super();
		this.tradeSeq = tradeSeq;
		this.userId = userId;
		this.code = code;
		this.name = name;
		this.oldPrice = oldPrice;
		this.oldVolume = oldVolume;
		this.date = date;
		this.currentPrice = currentPrice;
	}
	
	
	
	public SimulatedStock(String userId, String code, String name,
			long oldPrice, long oldVolume) {
		super();
		this.userId = userId;
		this.code = code;
		this.name = name;
		this.oldPrice = oldPrice;
		this.oldVolume = oldVolume;
	}
	public long getTradeSeq() {
		return tradeSeq;
	}
	public void setTradeSeq(long tradeSeq) {
		this.tradeSeq = tradeSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public long getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(long oldPrice) {
		this.oldPrice = oldPrice;
	}
	public long getOldVolume() {
		return oldVolume;
	}
	public void setOldVolume(long oldVolume) {
		this.oldVolume = oldVolume;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public long getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(long currentPrice) {
		this.currentPrice = currentPrice;
	}
	@Override
	public String toString() {
		return "SimulatedStock [tradeSeq=" + tradeSeq + ", userId=" + userId
				+ ", code=" + code + ", name=" + name + ", oldPrice="
				+ oldPrice + ", oldVolume=" + oldVolume + ", date=" + date
				+ ", currentPrice=" + currentPrice + "]";
	}
	
	

}
