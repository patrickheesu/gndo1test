package com.tech.gndo1.user.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tech.gndo1.user.dao.UIDao;

@RestController
public class UserRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@PostMapping(value = "/join/duplicateCheck" , produces = "application/json; charset=UTF-8" )
	public String duplicateCheck(String memberId) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_mem = dao.check_mem(memberId);
		int count_cpy = dao.check_cpy(memberId);
		
		String rt = "";  // return_text
		
		if (count_mem + count_cpy != 1)
			rt = "true";		

		return rt;
	}
	
	@PostMapping("/login/loginCheck")
	public String loginCheck(String check_id, String check_pwd, String check_table) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		System.out.println(check_id);
		int check_ok;
		String check_bool = "";
		
		if (check_table.equals("members")) {
			check_ok = dao.login_checkm(check_id,check_pwd);
		}else {
			check_ok = dao.login_checkc(check_id,check_pwd);
		}
		System.out.println(check_ok);
		if (check_ok == 1){
			check_bool = "true";
		} else {
			check_bool = "false";
		}
		
		System.out.println(check_bool);
		return check_bool;
	}
}
