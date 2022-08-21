package com.tech.gndo1.cptype.dto;

import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.review.dto.ReviewDto;
import com.tech.gndo1.review.dto.Review_imgDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

public class Accommodation_infoDto {
	private int acc_num;
	private int cpy_num;
	private String acc_location;
	private String acc_map;
	private String acc_la;
	private String acc_lo;
	private String acc_tel;
	private String acc_info;
	private String acc_serkeyword;
	private String acc_name;
	private String acc_detailmap;
	
	private Accommodation_imgDto ai;
	private RoomTypeDto r;
	private ReviewDto rv;
	private Review_imgDto rvi;
	private MembersDto mem;
	
	
	public Accommodation_infoDto() {
		// TODO Auto-generated constructor stub
	}


	public int getAcc_num() {
		return acc_num;
	}


	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}


	public int getCpy_num() {
		return cpy_num;
	}


	public void setCpy_num(int cpy_num) {
		this.cpy_num = cpy_num;
	}


	public String getAcc_location() {
		return acc_location;
	}


	public void setAcc_location(String acc_location) {
		this.acc_location = acc_location;
	}


	public String getAcc_map() {
		return acc_map;
	}


	public void setAcc_map(String acc_map) {
		this.acc_map = acc_map;
	}


	public String getAcc_la() {
		return acc_la;
	}


	public void setAcc_la(String acc_la) {
		this.acc_la = acc_la;
	}


	public String getAcc_lo() {
		return acc_lo;
	}


	public void setAcc_lo(String acc_lo) {
		this.acc_lo = acc_lo;
	}


	public String getAcc_tel() {
		return acc_tel;
	}


	public void setAcc_tel(String acc_tel) {
		this.acc_tel = acc_tel;
	}


	public String getAcc_info() {
		return acc_info;
	}


	public void setAcc_info(String acc_info) {
		this.acc_info = acc_info;
	}


	public String getAcc_serkeyword() {
		return acc_serkeyword;
	}


	public void setAcc_serkeyword(String acc_serkeyword) {
		this.acc_serkeyword = acc_serkeyword;
	}


	public String getAcc_name() {
		return acc_name;
	}


	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}


	public String getAcc_detailmap() {
		return acc_detailmap;
	}


	public void setAcc_detailmap(String acc_detailmap) {
		this.acc_detailmap = acc_detailmap;
	}


	public Accommodation_imgDto getAi() {
		return ai;
	}


	public void setAi(Accommodation_imgDto ai) {
		this.ai = ai;
	}


	public RoomTypeDto getR() {
		return r;
	}


	public void setR(RoomTypeDto r) {
		this.r = r;
	}


	public ReviewDto getRv() {
		return rv;
	}


	public void setRv(ReviewDto rv) {
		this.rv = rv;
	}


	public Review_imgDto getRvi() {
		return rvi;
	}


	public void setRvi(Review_imgDto rvi) {
		this.rvi = rvi;
	}


	public MembersDto getMem() {
		return mem;
	}


	public void setMem(MembersDto mem) {
		this.mem = mem;
	}


	public Accommodation_infoDto(int acc_num, int cpy_num, String acc_location, String acc_map, String acc_la,
			String acc_lo, String acc_tel, String acc_info, String acc_serkeyword, String acc_name,
			String acc_detailmap, Accommodation_imgDto ai, RoomTypeDto r, ReviewDto rv, Review_imgDto rvi,
			MembersDto mem) {
		super();
		this.acc_num = acc_num;
		this.cpy_num = cpy_num;
		this.acc_location = acc_location;
		this.acc_map = acc_map;
		this.acc_la = acc_la;
		this.acc_lo = acc_lo;
		this.acc_tel = acc_tel;
		this.acc_info = acc_info;
		this.acc_serkeyword = acc_serkeyword;
		this.acc_name = acc_name;
		this.acc_detailmap = acc_detailmap;
		this.ai = ai;
		this.r = r;
		this.rv = rv;
		this.rvi = rvi;
		this.mem = mem;
	}
	
}
