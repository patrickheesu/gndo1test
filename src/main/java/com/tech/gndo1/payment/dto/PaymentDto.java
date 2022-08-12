package com.tech.gndo1.payment.dto;

import java.sql.Timestamp;

public class PaymentDto {
	private int pm_num;
	private int rs_num;
	private Timestamp pm_date;
	private String pm_type;
	
	public PaymentDto() {
		// TODO Auto-generated constructor stub
	}

	public int getPm_num() {
		return pm_num;
	}

	public void setPm_num(int pm_num) {
		this.pm_num = pm_num;
	}

	public int getRs_num() {
		return rs_num;
	}

	public void setRs_num(int rs_num) {
		this.rs_num = rs_num;
	}

	public Timestamp getPm_date() {
		return pm_date;
	}

	public void setPm_date(Timestamp pm_date) {
		this.pm_date = pm_date;
	}

	public String getPm_type() {
		return pm_type;
	}

	public void setPm_type(String pm_type) {
		this.pm_type = pm_type;
	}

	public PaymentDto(int pm_num, int rs_num, Timestamp pm_date, String pm_type) {
		super();
		this.pm_num = pm_num;
		this.rs_num = rs_num;
		this.pm_date = pm_date;
		this.pm_type = pm_type;
	}
	
	
}
