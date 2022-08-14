package com.tech.gndo1.user.dao;

import java.util.Date;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.mb.dto.MembersDto;

public interface UIDao {
	public String find_memid(String memName, String memEmail);
	public String find_cpyid(String cpyName, String cpyEmail);
	
	public int m_Existent(String memId, String memEmail);
	public void mpChange(String cn, String logkey, String memId, String memEmail);
	
	public int c_Existent(String cpyId, String cpyEmail);
	public void cpChange(String cn, String logkey, String cpyId, String cpyEmail);
	
	public int check_memail(String email);
	public int check_cpmail(String email);	
	public int check_nk(String memberNk);

	public int check_mem(String memberId);
	public int check_cpy(String memberId);
	
	public int check_cpyNum(String memberCpnum);

	public MembersDto login_checkmpwd(String check_id);
	public CompanyDto login_checkcpwd(String check_id);
	

	public int login_checkc(String id, String pass);

	public MembersDto members(String id);

	public CompanyDto company(String id);
	
	public void insertCompany(String cpy_id, String cpy_pwd, String cpy_name, String cpy_cpnum, String cpy_tel,
	         String cpy_resid, String cpy_email, int cpy_typecode, String cpy_logkey);
	public void insertMembers(String mem_id, String mem_pwd, String mem_nickname, String mem_name, String mem_gender, 
			Date mem_birth, String mem_phonenum, String mem_addr, String mem_email, String logkey);

}
