package com.tech.gndo1.roomtype.dto;

public class AccimgDto {

	private int acci_num;
	private int acc_num;
	private String acci_img;
	private String acci_afterimg;
	
	
	
	public AccimgDto() {
		// TODO Auto-generated constructor stub
	}
	public int getAcci_num() {
		return acci_num;
	}
	public void setAcci_num(int acci_num) {
		this.acci_num = acci_num;
	}
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
	public String getAcci_img() {
		return acci_img;
	}
	public void setAcci_img(String acci_img) {
		this.acci_img = acci_img;
	}
	public String getAcci_afterimg() {
		return acci_afterimg;
	}
	public void setAcci_afterimg(String acci_afterimg) {
		this.acci_afterimg = acci_afterimg;
	}
	
	public AccimgDto(int acci_num, int acc_num, String acci_img, String acci_afterimg) {
		super();
		this.acci_num = acci_num;
		this.acc_num = acc_num;
		this.acci_img = acci_img;
		this.acci_afterimg = acci_afterimg;
	}
	
}
