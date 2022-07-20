package com.tech.gndo1.board.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {
	
	@Autowired
	SqlSession sqlSession;
}
