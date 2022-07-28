package com.tech.gndo1.mb.dto;

import java.sql.Timestamp;

public class MembersDto {
	private int mem_num;
	private String mem_id;
	private String mem_pwd;
	private String mem_nickname;
	private String mem_name;
	private String mem_gender;
	private Timestamp mem_birth;
	private String mem_phonenum;
	private String mem_addr;
	private String mem_email;
	private Timestamp mem_createdate;
	
	public MembersDto() {
		// TODO Auto-generated constructor stub
	}
	public MembersDto(int mem_num, String mem_id, String mem_pwd, String mem_nickname, String mem_name,
			String mem_gender, Timestamp mem_birth, String mem_phonenum, String mem_addr, String mem_email,
			Timestamp mem_createdate) {
		super();
		this.mem_num = mem_num;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_nickname = mem_nickname;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_birth = mem_birth;
		this.mem_phonenum = mem_phonenum;
		this.mem_addr = mem_addr;
		this.mem_email = mem_email;
		this.mem_createdate = mem_createdate;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public Timestamp getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Timestamp mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_phonenum() {
		return mem_phonenum;
	}
	public void setMem_phonenum(String mem_phonenum) {
		this.mem_phonenum = mem_phonenum;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public Timestamp getMem_createdate() {
		return mem_createdate;
	}
	public void setMem_createdate(Timestamp mem_createdate) {
		this.mem_createdate = mem_createdate;
	}
	
	
}
