package com.tech.gndo1.review.dto;

public class Review_imgDto {
	private int rvi_num;
	private int rv_num;
	private String rvi_img;
	private String rvi_afterimg;
	
	public Review_imgDto() {
		// TODO Auto-generated constructor stub
	}
	
	public int getRvi_num() {
		return rvi_num;
	}
	public void setRvi_num(int rvi_num) {
		this.rvi_num = rvi_num;
	}
	public int getRv_num() {
		return rv_num;
	}
	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}
	public String getRvi_img() {
		return rvi_img;
	}
	public void setRvi_img(String rvi_img) {
		this.rvi_img = rvi_img;
	}
	public String getRvi_afterimg() {
		return rvi_afterimg;
	}
	public void setRvi_afterimg(String rvi_afterimg) {
		this.rvi_afterimg = rvi_afterimg;
	}
	public Review_imgDto(int rvi_num, int rv_num, String rvi_img, String rvi_afterimg) {
		super();
		this.rvi_num = rvi_num;
		this.rv_num = rv_num;
		this.rvi_img = rvi_img;
		this.rvi_afterimg = rvi_afterimg;
	}
	
	
	
}
