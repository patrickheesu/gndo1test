package com.tech.gndo1.user.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/join")
	public String join() {
		return "login/join";
	}
	
	@RequestMapping("/joinMembers")
	public String joinMembers() {
		return "login/joinMembers";
	}
	@RequestMapping("/joinMembersInsert")
	public String joinMembersInsert() {
		return "login/joinMembersInsert";
	}
	
	@RequestMapping("/joinEnd")
	public String joinEnd() {
		return "login/joinEnd";
	}
	
	@RequestMapping("/joinCompany")
	public String joinCompany() {
		return "login/joinCompany";
	}
	
	@RequestMapping("/joinCompanyInsert")
	public String joinCompanyInsert() {
		return "login/joinCompanyInsert";
	}
}
