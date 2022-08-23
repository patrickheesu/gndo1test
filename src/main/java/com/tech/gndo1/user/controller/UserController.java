package com.tech.gndo1.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.cptype.dao.CIDao;
import com.tech.gndo1.payment.dto.ReserveDto;
import com.tech.gndo1.review.dto.ReviewDto;
import com.tech.gndo1.user.dao.UIDao;

@Controller
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/cpPage")
	public String cpPage(HttpServletRequest request, Model model) {
		HttpSession session =request.getSession();
		if (session.getAttribute("cpy_num") != null) {
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
		return "redirect:./";
	}
	@RequestMapping("/mbPage")
	public String mbPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mem_num") != null) {
			return "mypage/members/mbPage";
		}
		return "redirect:./";
	}
	@RequestMapping("/mbModify")
	public String mbModify(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mem_num") != null) {
		return "mypage/members/mbModify";
		}
		return "redirect:./";
	}
	@RequestMapping("/cpModify")
	public String cpModify(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cpy_num") != null) {
		return "mypage/company/cpModify";
		}
		return "redirect:./";
	}
	
	@RequestMapping("/mbreview")
	public String mbreview(HttpServletRequest request,Model model) {
		HttpSession session =request.getSession();
		if (session.getAttribute("mem_num") != null) {
			
			int mem_num = (Integer)session.getAttribute("mem_num");
			UIDao udao = sqlSession.getMapper(UIDao.class);
			//내가 쓴 리뷰 목록 select
			ArrayList<ReviewDto> rvdto = udao.mem_reviews(mem_num);
			System.out.println(rvdto.size());
			model.addAttribute("reviewDone", rvdto);
			
			//아직 쓰지 않은 리뷰 목록 select
			ArrayList<ReserveDto> rsdto = udao.have_to_write(mem_num);
			model.addAttribute("reviewNone", rsdto);
			
			
		}
		return "mypage/members/mbReview";
	}
	
}
