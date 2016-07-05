package com.orakgarak.vo;

public class BigData {
	private String code;
	private String keyword;
	private int newsInterestDay;
	private int newsInterestWeek;
	private int newsInterestMonth;
	private int newsInterest6Month;
	private int dayScore;
	private int weekScore;
	private int monthScore;
	private int score;
	public BigData() {
		super();
	}
	public BigData(String code, String keyword, int newsInterestDay,
			int newsInterestWeek, int newsInterestMonth,
			int newsInterest6Month, int dayScore, int weekScore,
			int monthScore, int score) {
		super();
		this.code = code;
		this.keyword = keyword;
		this.newsInterestDay = newsInterestDay;
		this.newsInterestWeek = newsInterestWeek;
		this.newsInterestMonth = newsInterestMonth;
		this.newsInterest6Month = newsInterest6Month;
		this.dayScore = dayScore;
		this.weekScore = weekScore;
		this.monthScore = monthScore;
		this.score = score;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getNewsInterestDay() {
		return newsInterestDay;
	}
	public void setNewsInterestDay(int newsInterestDay) {
		this.newsInterestDay = newsInterestDay;
	}
	public int getNewsInterestWeek() {
		return newsInterestWeek;
	}
	public void setNewsInterestWeek(int newsInterestWeek) {
		this.newsInterestWeek = newsInterestWeek;
	}
	public int getNewsInterestMonth() {
		return newsInterestMonth;
	}
	public void setNewsInterestMonth(int newsInterestMonth) {
		this.newsInterestMonth = newsInterestMonth;
	}
	public int getNewsInterest6Month() {
		return newsInterest6Month;
	}
	public void setNewsInterest6Month(int newsInterest6Month) {
		this.newsInterest6Month = newsInterest6Month;
	}
	public int getDayScore() {
		return dayScore;
	}
	public void setDayScore(int dayScore) {
		this.dayScore = dayScore;
	}
	public int getWeekScore() {
		return weekScore;
	}
	public void setWeekScore(int weekScore) {
		this.weekScore = weekScore;
	}
	public int getMonthScore() {
		return monthScore;
	}
	public void setMonthScore(int monthScore) {
		this.monthScore = monthScore;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "BigData [code=" + code + ", keyword=" + keyword
				+ ", newsInterestDay=" + newsInterestDay
				+ ", newsInterestWeek=" + newsInterestWeek
				+ ", newsInterestMonth=" + newsInterestMonth
				+ ", newsInterest6Month=" + newsInterest6Month + ", dayScore="
				+ dayScore + ", weekScore=" + weekScore + ", monthScore="
				+ monthScore + ", score=" + score + "]";
	}

	
	

}
