package com.tech.gndo1.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.cptype.dao.CIDao;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

@Controller
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/cpPage")
	public String cpPage(Model model,HttpSession session) {
		int cpy_num=(Integer)session.getAttribute("cpy_num");
		CIDao cdao=sqlSession.getMapper(CIDao.class);
		int acc_cnt=cdao.acccnt(cpy_num);
		if (acc_cnt==1) {
			int acc_num=cdao.accsel(cpy_num);
			model.addAttribute("cpinfo",acc_num);			
		}
		model.addAttribute("acccnt",acc_cnt);
		
		return "mypage/company/cpPage";
	}
	@RequestMapping("/mbPage")
	public String mbPage() {
		return "mypage/members/mbPage";
	}
	@RequestMapping("/htDetail")
	public String htDetail(Model model) {
		CIDao dao=sqlSession.getMapper(CIDao.class);
		List<RoomTypeDto> rdto=dao.htsel();
		model.addAttribute("rdto",rdto);
		System.out.println(rdto);
		
		
		
		return "hotel/htDetail";
	}
	
}
