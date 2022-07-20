package com.tech.gndo1.main.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MainController {
	
	@Autowired
	SqlSession sqlSession;
}
