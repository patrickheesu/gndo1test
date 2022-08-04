package com.tech.gndo1.user.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/cpPage")
	public String cpPage(HttpSession session) {
		int spy_num=(Integer)session.getAttribute("cpy_num");
		System.out.println(spy_num);
		
		return "mypage/company/cpPage";
	}
	@RequestMapping("/mbPage")
	public String mbPage() {
		return "mypage/members/mbPage";
	}
}
