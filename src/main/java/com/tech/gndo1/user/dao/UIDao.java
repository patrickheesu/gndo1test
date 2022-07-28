package com.tech.gndo1.user.dao;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.mb.dto.MembersDto;

public interface UIDao {

	public int check_mem(String memberId);

	public int check_cpy(String memberId);

	public int login_checkm(String id, String pass);

	public int login_checkc(String id, String pass);

	public MembersDto members(String id);

	public CompanyDto company(String id);
	
	public void insertCompany(String cpy_id, String cpy_pwd, String cpy_name, String cpy_cpnum, String cpy_tel,
	         String cpy_resid, String cpy_email, int cpy_typecode);
}
