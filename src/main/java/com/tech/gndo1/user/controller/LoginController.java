package com.tech.gndo1.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.user.dao.UIDao;

@Controller
public class LoginController {
	
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	@RequestMapping("/loginProc")
	public String loginProc(HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("id");
		String sort = request.getParameter("sort"); 
		System.out.println(sort);
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		if (sort.equals("members")) {
			MembersDto mdto = dao.members(id);
			
			session = request.getSession();
			session.setAttribute("mem_num", mdto.getMem_num());
			session.setAttribute("mem_nickname", mdto.getMem_nickname());
			
		} else {
			CompanyDto cdto = dao.company(id);
			
			session = request.getSession();
			session.setAttribute("cpy_num", cdto.getCpy_num());
			session.setAttribute("cpy_name", cdto.getCpy_name());
		}

		
		return "redirect:./";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();
		session.invalidate();

		return "redirect:./";
	}
}
