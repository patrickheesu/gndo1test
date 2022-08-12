package com.tech.gndo1.roomtype.dto;

public class RoomTypeimgDto {
	private int rti_num;
	private int rt_num;
	private String rti_img;
	private String rti_afterimg;
	
	public RoomTypeimgDto() {
		// TODO Auto-generated constructor stub
	}

	public int getRti_num() {
		return rti_num;
	}

	public void setRti_num(int rti_num) {
		this.rti_num = rti_num;
	}

	public int getRt_num() {
		return rt_num;
	}

	public void setRt_num(int rt_num) {
		this.rt_num = rt_num;
	}

	public String getRti_img() {
		return rti_img;
	}

	public void setRti_img(String rti_img) {
		this.rti_img = rti_img;
	}

	public String getRti_afterimg() {
		return rti_afterimg;
	}

	public void setRti_afterimg(String rti_afterimg) {
		this.rti_afterimg = rti_afterimg;
	}

	public RoomTypeimgDto(int rti_num, int rt_num, String rti_img, String rti_afterimg) {
		super();
		this.rti_num = rti_num;
		this.rt_num = rt_num;
		this.rti_img = rti_img;
		this.rti_afterimg = rti_afterimg;
	}
	
	
}
