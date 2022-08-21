package com.tech.gndo1.review.dto;

import java.sql.Date;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

public class ReviewDto {
	private int rv_num;
	private int mem_num;
	private int rt_num;
	private Date rv_date;
	private String rv_title;
	private String rv_content;
	private int rv_grade;
	
	private Review_imgDto rvi;
	private Review_replyDto rvr;
	private MembersDto mem;
	private RoomTypeDto rt;
	private Accommodation_infoDto acc;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int rv_num, int mem_num, int rt_num, Date rv_date, String rv_title, String rv_content,
			int rv_grade, Review_imgDto rvi, Review_replyDto rvr, MembersDto mem, RoomTypeDto rt, Accommodation_infoDto acc) {
		super();
		this.rv_num = rv_num;
		this.mem_num = mem_num;
		this.rt_num = rt_num;
		this.rv_date = rv_date;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_grade = rv_grade;
		this.rvi = rvi;
		this.rvr = rvr;
		this.mem = mem;
		this.rt = rt;
		this.acc = acc;
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
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

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_grade() {
		return rv_grade;
	}

	public void setRv_grade(int rv_grade) {
		this.rv_grade = rv_grade;
	}

	public Review_imgDto getRvi() {
		return rvi;
	}

	public void setRvi(Review_imgDto rvi) {
		this.rvi = rvi;
	}

	public Review_replyDto getRvr() {
		return rvr;
	}

	public void setRvr(Review_replyDto rvr) {
		this.rvr = rvr;
	}

	public MembersDto getMem() {
		return mem;
	}

	public void setMem(MembersDto mem) {
		this.mem = mem;
	}

	public RoomTypeDto getRt() {
		return rt;
	}

	public void setRt(RoomTypeDto rt) {
		this.rt = rt;
	}

	public Accommodation_infoDto getAcc() {
		return acc;
	}

	public void setAcc(Accommodation_infoDto acc) {
		this.acc = acc;
	}


	

}
	
	

