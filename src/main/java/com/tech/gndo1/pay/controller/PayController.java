package com.tech.gndo1.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.pay.dao.PIDao;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

@Controller
public class PayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/reserve")
	public String reserve(Model model,HttpSession session,HttpServletRequest request) {
//		int mem_num=(Integer)session.getAttribute("mem_num");
//		System.out.println(mem_num);
		PIDao dao=sqlSession.getMapper(PIDao.class);
		String rt_num=request.getParameter("rt_num");
		String mem_num=request.getParameter("mem_num");
		RoomTypeDto rdto=dao.reservesel(rt_num);
		MembersDto mdto=dao.memsel(mem_num);
		model.addAttribute("mdto",mdto);
		model.addAttribute("rdto",rdto);

		return "payment/reserve";
	}
}
