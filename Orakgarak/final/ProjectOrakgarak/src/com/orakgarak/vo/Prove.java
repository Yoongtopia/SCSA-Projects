package com.orakgarak.vo;

public class Prove {
	private String code;
	private float dcf2011;
	private float dcf2012;
	private float dcf2013;
	private float price2012;
	private float price2013;
	private float price2014;
	private float regression;
	public Prove(String code, float dcf2011, float dcf2012, float dcf2013,
			float price2012, float price2013, float price2014, float regression) {
		super();
		this.code = code;
		this.dcf2011 = dcf2011;
		this.dcf2012 = dcf2012;
		this.dcf2013 = dcf2013;
		this.price2012 = price2012;
		this.price2013 = price2013;
		this.price2014 = price2014;
		this.regression = regression;
	}
	
	
	public Prove() {
		super();
	}


	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public float getDcf2011() {
		return dcf2011;
	}
	public void setDcf2011(float dcf2011) {
		this.dcf2011 = dcf2011;
	}
	public float getDcf2012() {
		return dcf2012;
	}
	public void setDcf2012(float dcf2012) {
		this.dcf2012 = dcf2012;
	}
	public float getDcf2013() {
		return dcf2013;
	}
	public void setDcf2013(float dcf2013) {
		this.dcf2013 = dcf2013;
	}
	public float getPrice2012() {
		return price2012;
	}
	public void setPrice2012(float price2012) {
		this.price2012 = price2012;
	}
	public float getPrice2013() {
		return price2013;
	}
	public void setPrice2013(float price2013) {
		this.price2013 = price2013;
	}
	public float getPrice2014() {
		return price2014;
	}
	public void setPrice2014(float price2014) {
		this.price2014 = price2014;
	}
	public float getRegression() {
		return regression;
	}
	public void setRegression(float regression) {
		this.regression = regression;
	}
	
	
	
	
}
