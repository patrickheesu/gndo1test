package com.tech.gndo1.roomtype.dto;

public class RoomTypeDto {

	private int rt_num;
	private int acc_num;
	private String rt_rmname;
	private int rt_rmcount;
	private int rt_rpeople;
	private int rt_price;
	private String rt_info;
	private String rt_in;
	private String rt_out;
	
	private RoomTypeimgDto rti;
	
	private RoomTypeimgDto room_img;
	
	public RoomTypeDto() {
		// TODO Auto-generated constructor stub
	}

	public int getRt_num() {
		return rt_num;
	}

	public void setRt_num(int rt_num) {
		this.rt_num = rt_num;
	}

	public int getAcc_num() {
		return acc_num;
	}

	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}

	public String getRt_rmname() {
		return rt_rmname;
	}

	public void setRt_rmname(String rt_rmname) {
		this.rt_rmname = rt_rmname;
	}

	public int getRt_rmcount() {
		return rt_rmcount;
	}

	public void setRt_rmcount(int rt_rmcount) {
		this.rt_rmcount = rt_rmcount;
	}

	public int getRt_rpeople() {
		return rt_rpeople;
	}

	public void setRt_rpeople(int rt_rpeople) {
		this.rt_rpeople = rt_rpeople;
	}

	public int getRt_price() {
		return rt_price;
	}

	public void setRt_price(int rt_price) {
		this.rt_price = rt_price;
	}

	public String getRt_info() {
		return rt_info;
	}

	public void setRt_info(String rt_info) {
		this.rt_info = rt_info;
	}

	public String getRt_in() {
		return rt_in;
	}

	public void setRt_in(String rt_in) {
		this.rt_in = rt_in;
	}

	public String getRt_out() {
		return rt_out;
	}

	public void setRt_out(String rt_out) {
		this.rt_out = rt_out;
	}

	public RoomTypeimgDto getRti() {
		return rti;
	}

	public void setRti(RoomTypeimgDto rti) {
		this.rti = rti;
	}

	public RoomTypeimgDto getRoom_img() {
		return room_img;
	}

	public void setRoom_img(RoomTypeimgDto room_img) {
		this.room_img = room_img;
	}

	public RoomTypeDto(int rt_num, int acc_num, String rt_rmname, int rt_rmcount, int rt_rpeople, int rt_price,
			String rt_info, String rt_in, String rt_out, RoomTypeimgDto rti, RoomTypeimgDto room_img) {
		super();
		this.rt_num = rt_num;
		this.acc_num = acc_num;
		this.rt_rmname = rt_rmname;
		this.rt_rmcount = rt_rmcount;
		this.rt_rpeople = rt_rpeople;
		this.rt_price = rt_price;
		this.rt_info = rt_info;
		this.rt_in = rt_in;
		this.rt_out = rt_out;
		this.rti = rti;
		this.room_img = room_img;
	}
	
}
