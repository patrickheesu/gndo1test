package com.tech.gndo1.user.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
	
	@Autowired
	SqlSession sqlSession;
}
