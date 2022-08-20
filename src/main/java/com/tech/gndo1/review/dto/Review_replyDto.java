package com.tech.gndo1.review.dto;

import java.sql.Date;

public class Review_replyDto {
	private int rvr_num;
	private int rv_num;
	private int cpy_num;
	private Date rvr_date;
	private String rvr_coment;
	
	
	
	public Review_replyDto() {
		// TODO Auto-generated constructor stub
	}
	
	public int getRvr_num() {
		return rvr_num;
	}
	public void setRvr_num(int rvr_num) {
		this.rvr_num = rvr_num;
	}
	public int getRv_num() {
		return rv_num;
	}
	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}
	public int getCpy_num() {
		return cpy_num;
	}
	public void setCpy_num(int cpy_num) {
		this.cpy_num = cpy_num;
	}
	public Date getRvr_date() {
		return rvr_date;
	}
	public void setRvr_date(Date rvr_date) {
		this.rvr_date = rvr_date;
	}
	public String getRvr_coment() {
		return rvr_coment;
	}
	public void setRvr_coment(String rvr_coment) {
		this.rvr_coment = rvr_coment;
	}
	public Review_replyDto(int rvr_num, int rv_num, int cpy_num, Date rvr_date, String rvr_coment) {
		super();
		this.rvr_num = rvr_num;
		this.rv_num = rv_num;
		this.cpy_num = cpy_num;
		this.rvr_date = rvr_date;
		this.rvr_coment = rvr_coment;
	}

	
	
}
