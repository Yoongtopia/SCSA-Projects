package com.scsa.vo;

public class Img {
	private int img_num;
	private int product_num;
	private String img;
	private int img_main;
	

	public Img() {
		super();
	}
	public Img(int img_num, int product_num, String img, int img_main) {
		super();
		this.img_num = img_num;
		this.product_num = product_num;
		this.img = img;
		this.img_main = img_main;
	}
	public int getImg_num() {
		return img_num;
	}
	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getImg_main() {
		return img_main;
	}
	public void setImg_main(int img_main) {
		this.img_main = img_main;
	}
	@Override
	public String toString() {
		return "Img [img_num=" + img_num + ", product_num=" + product_num
				+ ", img=" + img + ", img_main=" + img_main + "]";
	}
	
	
}
