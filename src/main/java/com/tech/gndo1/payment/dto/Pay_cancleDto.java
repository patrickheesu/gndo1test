package com.tech.gndo1.payment.dto;

import java.sql.Timestamp;

public class Pay_cancleDto {
	private int pc_num;
	private int pm_num;
	private int pc_amount;
	private int pc_appamt;
	private String pc_reason;
	private Timestamp pc_date;
	
	public Pay_cancleDto() {
		// TODO Auto-generated constructor stub
	}

	public int getPc_num() {
		return pc_num;
	}

	public void setPc_num(int pc_num) {
		this.pc_num = pc_num;
	}

	public int getPm_num() {
		return pm_num;
	}

	public void setPm_num(int pm_num) {
		this.pm_num = pm_num;
	}

	public int getPc_amount() {
		return pc_amount;
	}

	public void setPc_amount(int pc_amount) {
		this.pc_amount = pc_amount;
	}

	public int getPc_appamt() {
		return pc_appamt;
	}

	public void setPc_appamt(int pc_appamt) {
		this.pc_appamt = pc_appamt;
	}

	public String getPc_reason() {
		return pc_reason;
	}

	public void setPc_reason(String pc_reason) {
		this.pc_reason = pc_reason;
	}

	public Timestamp getPc_date() {
		return pc_date;
	}

	public void setPc_date(Timestamp pc_date) {
		this.pc_date = pc_date;
	}

	public Pay_cancleDto(int pc_num, int pm_num, int pc_amount, int pc_appamt, String pc_reason, Timestamp pc_date) {
		super();
		this.pc_num = pc_num;
		this.pm_num = pm_num;
		this.pc_amount = pc_amount;
		this.pc_appamt = pc_appamt;
		this.pc_reason = pc_reason;
		this.pc_date = pc_date;
	}
	
	
}
