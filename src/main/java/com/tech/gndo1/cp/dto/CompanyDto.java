package com.tech.gndo1.cp.dto;

import java.sql.Timestamp;

public class CompanyDto {
	private int cpy_num;
	private String cpy_id;
	private String cpy_pwd;
	private String cpy_name;
	private String cpy_cpnum;
	private String cpy_tel;
	private String cpy_resid;
	private String cpy_email;
	private int cpy_typecode;
	private Timestamp cpy_cratedate;
	
	public CompanyDto() {
		// TODO Auto-generated constructor stub
	}

	public CompanyDto(int cpy_num, String cpy_id, String cpy_pwd, String cpy_name, String cpy_cpnum, String cpy_tel,
			String cpy_resid, String cpy_email, int cpy_typecode, Timestamp cpy_cratedate) {
		super();
		this.cpy_num = cpy_num;
		this.cpy_id = cpy_id;
		this.cpy_pwd = cpy_pwd;
		this.cpy_name = cpy_name;
		this.cpy_cpnum = cpy_cpnum;
		this.cpy_tel = cpy_tel;
		this.cpy_resid = cpy_resid;
		this.cpy_email = cpy_email;
		this.cpy_typecode = cpy_typecode;
		this.cpy_cratedate = cpy_cratedate;
	}

	public int getCpy_num() {
		return cpy_num;
	}

	public void setCpy_num(int cpy_num) {
		this.cpy_num = cpy_num;
	}

	public String getCpy_id() {
		return cpy_id;
	}

	public void setCpy_id(String cpy_id) {
		this.cpy_id = cpy_id;
	}

	public String getCpy_pwd() {
		return cpy_pwd;
	}

	public void setCpy_pwd(String cpy_pwd) {
		this.cpy_pwd = cpy_pwd;
	}

	public String getCpy_name() {
		return cpy_name;
	}

	public void setCpy_name(String cpy_name) {
		this.cpy_name = cpy_name;
	}

	public String getCpy_cpnum() {
		return cpy_cpnum;
	}

	public void setCpy_cpnum(String cpy_cpnum) {
		this.cpy_cpnum = cpy_cpnum;
	}

	public String getCpy_tel() {
		return cpy_tel;
	}

	public void setCpy_tel(String cpy_tel) {
		this.cpy_tel = cpy_tel;
	}

	public String getCpy_resid() {
		return cpy_resid;
	}

	public void setCpy_resid(String cpy_resid) {
		this.cpy_resid = cpy_resid;
	}

	public String getCpy_email() {
		return cpy_email;
	}

	public void setCpy_email(String cpy_email) {
		this.cpy_email = cpy_email;
	}

	public int getCpy_typecode() {
		return cpy_typecode;
	}

	public void setCpy_typecode(int cpy_typecode) {
		this.cpy_typecode = cpy_typecode;
	}

	public Timestamp getCpy_cratedate() {
		return cpy_cratedate;
	}

	public void setCpy_cratedate(Timestamp cpy_cratedate) {
		this.cpy_cratedate = cpy_cratedate;
	}
	
	
}
