package com.tech.gndo1.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.gndo1.user.dao.UIDao;

@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/join")
	public String join() {
		return "login/join";
	}
	
	@RequestMapping("/joinMembers")
	public String joinMembers() {
		return "login/joinMembers";
	}
	@RequestMapping("/joinMembersInsert")
	public String joinMembersInsert() {
		return "login/joinMembersInsert";
	}
	
	@RequestMapping("/joinEnd")
	public String joinEnd() {
		return "login/joinEnd";
	}
	
	@RequestMapping("/joinCompany")
	public String joinCompany() {
		return "login/joinCompany";
	}
	
	@RequestMapping("/joinCpy")
	   public String joinCpy(HttpServletRequest request) {
			System.out.println("emfdjdha");
	      String cpy_id = request.getParameter("cpy_id");
	      String cpy_pwd = request.getParameter("cpy_pwd");
	      String cpy_name = request.getParameter("cpy_name");
	      String cpy_cpnum = request.getParameter("cpy_cpnum");
	      String cpy_tel = request.getParameter("cpy_tel");
	      String cpy_resid1 = request.getParameter("cpy_resid1");
	      String cpy_resid2 = request.getParameter("cpy_resid2");
	      String cpy_email = request.getParameter("cpy_email");
	      int cpy_typecode = Integer.parseInt(request.getParameter("cpy_typecode"));
	      String cpy_resid = cpy_resid1 + "-" + cpy_resid2;
	      UIDao dao = sqlSession.getMapper(UIDao.class);
	      dao.insertCompany(cpy_id,cpy_pwd,cpy_name,cpy_cpnum,cpy_tel,cpy_resid,cpy_email,cpy_typecode);
	      
	      return "login/joinEnd";
	   }
	
	@RequestMapping("/joinCompanyInsert")
	public String joinCompanyInsert() {
		return "login/joinCompanyInsert";
	}
}
