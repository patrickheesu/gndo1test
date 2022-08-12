package com.tech.gndo1.pay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.pay.dao.PIDao;
import com.tech.gndo1.payment.dto.ReserveDto;
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
		String acc_name=dao.accnamesel(rt_num);
		RoomTypeDto rdto=dao.reservesel(rt_num);
		MembersDto mdto=dao.memsel(mem_num);
		model.addAttribute("mdto",mdto);
		model.addAttribute("rdto",rdto);
		model.addAttribute("acc_name",acc_name);
		return "payment/reserve";
	}
	@RequestMapping("/paymentEnd")
	public String paymentEnd(HttpServletRequest request,Model model) {
		PIDao pdao=sqlSession.getMapper(PIDao.class);
		int mem_num=Integer.parseInt(request.getParameter("mem_num"));
		int rt_num=Integer.parseInt(request.getParameter("rt_num"));
		String rs_start=request.getParameter("rs_start");
		String rs_end=request.getParameter("rs_end");
		System.out.println(rs_start);
		System.out.println(rs_end);
		int rs_people=Integer.parseInt(request.getParameter("rs_people"));
		String rs_name=request.getParameter("rs_name");
		String rs_pnum=request.getParameter("rs_pnum");
		String pm_type=request.getParameter("pm_type");
		pdao.reservein(mem_num,rt_num,rs_start,rs_end,rs_people,rs_name,rs_pnum);
		int rs_num=pdao.reserveselect(mem_num);
		pdao.paymentin(rs_num,pm_type);
		
		
		return "payment/paymentEnd";
	}
	@RequestMapping("/mbpayment")
	public String paymain(Model model,HttpServletRequest request) {
		PIDao pdao=sqlSession.getMapper(PIDao.class);
		HttpSession session=request.getSession();
		int mem_num=(Integer)(session.getAttribute("mem_num"));
		System.out.println(mem_num);
		List<ReserveDto> rdto=pdao.mbpaymentselect(mem_num);
		System.out.println(rdto.get(0).getRs_people());
		System.out.println(rdto.get(0).getPay().getPm_type());
		model.addAttribute("rdto",rdto);
		
		return "mypage/members/mbPayment";
	}
	@RequestMapping("/cppayment")
	public String paymadd(Model model,HttpServletRequest request) {
		PIDao pdao=sqlSession.getMapper(PIDao.class);
		HttpSession session=request.getSession();
		int cpy_num=(Integer)(session.getAttribute("cpy_num"));
		System.out.println(cpy_num);
		System.out.println("dddd");
		List<ReserveDto> rdto=pdao.cppaymentselect(cpy_num);
		model.addAttribute("rdto",rdto);
		
		
		
		return "mypage/company/cpPayment";
	}
	@RequestMapping("/cancel")
	public String paycancel(HttpServletRequest request,Model model) {
		PIDao pdao=sqlSession.getMapper(PIDao.class);
		int pm_num=Integer.parseInt(request.getParameter("pm_num"));
		List<ReserveDto> rdto=pdao.mbpaycancelselect(pm_num);
		System.out.println(rdto);
		model.addAttribute("rdto",rdto);
		return "payment/cancel";
	}
	@RequestMapping("/cancelEnd")
	public String cancelend(HttpServletRequest request,Model model) {
		PIDao pdao=sqlSession.getMapper(PIDao.class);
		int pm_num=Integer.parseInt(request.getParameter("pm_num"));
		String pc_reason=request.getParameter("pc_reason");
		List<ReserveDto> rdto=pdao.mbpaycancelselect(pm_num);
		int rt_price=rdto.get(0).getRt().getRt_price();
		double pc_appamt=rt_price*0.9;
		System.out.println(pc_appamt);
		pdao.paycancelin(pm_num,pc_reason,rt_price,pc_appamt);
		return "payment/cancelEnd";
	}
}
