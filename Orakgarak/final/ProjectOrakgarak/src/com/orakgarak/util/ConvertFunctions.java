package com.orakgarak.util;

import java.util.Calendar;

public class ConvertFunctions {
	public static String getDateNowSixDigit() {

		Calendar c = Calendar.getInstance();

		int syear = c.get(Calendar.YEAR);

		int smonth = c.get(Calendar.MONTH);
		smonth = smonth + 1;

		int sday = c.get(Calendar.DAY_OF_MONTH);

		String year;
		String month;
		String day;

		year = String.valueOf(syear);
		if (smonth < 10) {
			month = "0" + smonth;
		} else {
			month = String.valueOf(smonth);
		}
		day = String.valueOf(sday);

		String whole = year + month + day;
		return whole;
	}
	
	

	public static String getDateWeekBeforeSixDigit() {

		Calendar c = Calendar.getInstance();

		int syear = c.get(Calendar.YEAR);

		int smonth = c.get(Calendar.MONTH);
		smonth = smonth + 1;

		c.add(Calendar.DATE, -7);

		int sday = c.get(Calendar.DAY_OF_MONTH);

		String year;
		String month;
		String day;

		year = String.valueOf(syear);
		if (smonth < 10) {
			month = "0" + smonth;
		} else {
			month = String.valueOf(smonth);
		}
		day = String.valueOf(sday);

		String whole = year + month + day;
		return whole;
	}
	
	public static String getDateMonthBeforeSixDigit() {

		Calendar c = Calendar.getInstance();

		int syear = c.get(Calendar.YEAR);

		int smonth = c.get(Calendar.MONTH);
		smonth = smonth + 1;

		c.add(Calendar.DATE, -30);

		int sday = c.get(Calendar.DAY_OF_MONTH);

		String year;
		String month;
		String day;

		year = String.valueOf(syear);
		if (smonth < 10) {
			month = "0" + smonth;
		} else {
			month = String.valueOf(smonth);
		}
		day = String.valueOf(sday);

		String whole = year + month + day;
		return whole;
	}
	
}//end public class
