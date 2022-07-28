package com.tech.gndo1.main.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping("/main")
	public String main() {
		
		return "main";
	}
}
