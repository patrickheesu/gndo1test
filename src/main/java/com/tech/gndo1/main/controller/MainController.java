package com.tech.gndo1.main.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, Model model){
		MIDao mdao = sqlSession.getMapper(MIDao.class);
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("mem_num") != null) { // 로그인 여부 확인
			int mem_num = (Integer)session.getAttribute("mem_num"); // 회원 출생연도 추출을 위해 로그인된 회원 번호 도출
			int mem_year = mdao.get_birth(mem_num); // 회원 출생연도 도출
			LocalDate now_date = LocalDate.now();
			int mem_generation = 0; // 회원 세대 구분
			int start_year = 0; // 같은 세대의 첫번째 출생 연도 
			int end_year = 0; // 같은 세대의 마지막 출생 연도
			
			for (int i = 2; i < 11; i++) { // 회원 세대와 출생연도 연산을 위한 반복문 및 조건문
				if (i*10 <= now_date.getYear() - mem_year + 1 && now_date.getYear() - mem_year + 1 < (i+1)*10) { // now_date.getYear() - mem_year + 1 은 회원의 나이이다
					mem_generation = i*10; // 회원 세대 연산
					start_year = now_date.getYear() - (mem_generation + 8);
					end_year =  now_date.getYear() - (mem_generation - 2);
				}
			}
			
			LocalDate start_birth = LocalDate.of(start_year, 01, 01);
			LocalDate end_birth =LocalDate.of(end_year, 01, 01); 
			
			String param1 = now_date.minusMonths(3).toString();
			String param2 = now_date.toString();
			String param3 = start_birth.toString();
			String param4 = end_birth.toString();

			//System.out.println(param1);
			//System.out.println(param2);
			//System.out.println(param3);
			//System.out.println(param4);
			
			
			ArrayList<Accommodation_infoDto> adto = mdao.get_recomand(param1, param2, param3, param4);
			model.addAttribute("adto", adto);
			model.addAttribute("adtocnt", adto.size());
			model.addAttribute("age", mem_generation);
			System.out.println(adto.size());
		}
		return "main";
	}
	
	@RequestMapping("/totList")
	public String List (HttpServletRequest request, Model model){
		int typecode=Integer.parseInt(request.getParameter("typecode"));
		   String cptype=request.getParameter("cptype");
		   MIDao dao=sqlSession.getMapper(MIDao.class);
	   if (typecode == 0) {
		   String sk=request.getParameter("sk");
			System.out.println(sk);
			System.out.println("1번");
			ArrayList<Accommodation_infoDto> adto = dao.search_list(sk);	
			model.addAttribute("search", adto);
			model.addAttribute("cptype",cptype);
			if (adto.size()==0) {
				model.addAttribute("adto",adto.size());
			}
		}else {
			System.out.println("typecode:"+typecode);
			System.out.println("cptype"+cptype);
			ArrayList<Accommodation_infoDto> aidto=dao.cptypelistselect(typecode);
			model.addAttribute("search",aidto);
			model.addAttribute("cptype",cptype);
			if (aidto.size()==0) {
				model.addAttribute("adto",aidto.size());
			}
		}
		
		
	
	return "totList";
	}
}











