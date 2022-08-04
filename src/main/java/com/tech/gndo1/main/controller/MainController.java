package com.tech.gndo1.main.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.main.dao.MIDao;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main")
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping("/totList")
	public String List (HttpServletRequest request, Model model){
		String sk=request.getParameter("sk");
		System.out.println(sk);
		MIDao dao=sqlSession.getMapper(MIDao.class);
		System.out.println("1번");
		ArrayList<Accommodation_infoDto> adto = dao.search_list(sk);	
		model.addAttribute("search", adto);
		
	
	return "totList";
	}
}











