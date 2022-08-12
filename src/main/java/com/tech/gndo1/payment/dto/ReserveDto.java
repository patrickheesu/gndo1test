package com.tech.gndo1.payment.dto;

import java.sql.Timestamp;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

public class ReserveDto {
	private int rs_num;
	private int mem_num;
	private int rt_num;
	private Timestamp rs_start;
	private Timestamp rs_end;
	private int rs_people;
	private String rs_name;
	private String rs_pnum;
	
	private PaymentDto pay;
	private Accommodation_infoDto acc;
	private RoomTypeDto rt;
	public ReserveDto() {
		// TODO Auto-generated constructor stub
	}

	public int getRs_num() {
		return rs_num;
	}

	public void setRs_num(int rs_num) {
		this.rs_num = rs_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getRt_num() {
		return rt_num;
	}

	public void setRt_num(int rt_num) {
		this.rt_num = rt_num;
	}

	public Timestamp getRs_start() {
		return rs_start;
	}

	public void setRs_start(Timestamp rs_start) {
		this.rs_start = rs_start;
	}

	public Timestamp getRs_end() {
		return rs_end;
	}

	public void setRs_end(Timestamp rs_end) {
		this.rs_end = rs_end;
	}

	public int getRs_people() {
		return rs_people;
	}

	public void setRs_people(int rs_people) {
		this.rs_people = rs_people;
	}

	public String getRs_name() {
		return rs_name;
	}

	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}

	public String getRs_pnum() {
		return rs_pnum;
	}

	public void setRs_pnum(String rs_pnum) {
		this.rs_pnum = rs_pnum;
	}
	

	public PaymentDto getPay() {
		return pay;
	}

	public void setPay(PaymentDto pay) {
		this.pay = pay;
	}

	public Accommodation_infoDto getAcc() {
		return acc;
	}

	public void setAcc(Accommodation_infoDto acc) {
		this.acc = acc;
	}

	public RoomTypeDto getRt() {
		return rt;
	}

	public void setRt(RoomTypeDto rt) {
		this.rt = rt;
	}

	public ReserveDto(int rs_num, int mem_num, int rt_num, Timestamp rs_start, Timestamp rs_end, int rs_people,
			String rs_name, String rs_pnum, PaymentDto pay, Accommodation_infoDto acc, RoomTypeDto rt) {
		super();
		this.rs_num = rs_num;
		this.mem_num = mem_num;
		this.rt_num = rt_num;
		this.rs_start = rs_start;
		this.rs_end = rs_end;
		this.rs_people = rs_people;
		this.rs_name = rs_name;
		this.rs_pnum = rs_pnum;
		this.pay = pay;
		this.acc = acc;
		this.rt = rt;
	}

	
	
	
}
