package com.tech.gndo1.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.gndo1.board.dao.BIDao;
import com.tech.gndo1.review.dto.ReviewDto;
import com.tech.gndo1.review.dto.Review_imgDto;
import com.tech.gndo1.user.dao.UIDao;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/review")
	public String review(HttpServletRequest request, Model model) {
		System.out.println("리뷰리스트");

		BIDao bidao=sqlSession.getMapper(BIDao.class);
		ArrayList<ReviewDto> rvdto=bidao.review_list();
		model.addAttribute("review",rvdto);
		
		int listsize = rvdto.size(); 
		model.addAttribute("listsize",listsize);
		int scroll = 0;
		int sum = 2;
		while(true) {
			if (listsize<33) {
				break;
			}
			if(sum*16<listsize && listsize <= (sum+1)*16) {
				scroll = sum - 1;
				break;
			}
			sum++;
		}
		System.out.println(scroll);
		System.out.println(listsize);
		model.addAttribute("scroll",scroll);
		
		return "board/review";
	}
	
	@RequestMapping("/reviewInsert")
	public String reviewIn(HttpServletRequest request,Model model) {
		HttpSession session =request.getSession();
		if (session.getAttribute("mem_num") != null) {
			
			String acc_name=request.getParameter("acc_name");
			String rt_rmname=request.getParameter("rt_rmname");
			String rt_num=request.getParameter("rt_num");
			String pm_num=request.getParameter("pm_num");
			System.out.println("rt_num :" +rt_num);
			System.out.println("pm_num :" +pm_num);
	
			model.addAttribute("rt_num",rt_num);
			model.addAttribute("pm_num",pm_num);
			model.addAttribute("acc_name",acc_name);
			model.addAttribute("rt_rmname",rt_rmname);
		}
		return "board/reviewInsert";
	}
	
	@RequestMapping("/reviewTo")
	public String reviewInsert(MultipartHttpServletRequest mtfrequest, Model model, HttpSession session) {
		System.out.println("리뷰글쓰기");
		BIDao bidao=sqlSession.getMapper(BIDao.class);

		int mem_num=(Integer)session.getAttribute("mem_num");
		
		String rv_title=mtfrequest.getParameter("rv_title");
		String rt_num=mtfrequest.getParameter("rt_num");
		String rv_content=mtfrequest.getParameter("rv_content");
		String rv_grand=mtfrequest.getParameter("rv_grand");
		String pm_num=mtfrequest.getParameter("pm_num");
		
		System.out.println("mem_num:"+mem_num);
		System.out.println("rt_num"+rt_num);
		System.out.println("rv_title"+rv_title);

		List<MultipartFile> rvi_img= mtfrequest.getFiles("rvi_img");
		// 파일은 리스트로 받는다
		bidao.reviewInsert(mem_num, rt_num, rv_title, rv_content,rv_grand, pm_num);
		int rv_num=bidao.rvnumselect(mem_num);
		
		//루트는 사진이 저장되는 폴더
		String root="C:\\javabigspring\\springwork22\\gndo1\\src\\main\\webapp\\resources\\upload";
		
		for (MultipartFile mf : rvi_img) {
	         String originFile=mf.getOriginalFilename();
	         long longtime=System.currentTimeMillis();
	         String changeFile=longtime+"_"+mf.getOriginalFilename();
	         String pathfile=root+"\\"+originFile;
	         String after_pathfile = root + "\\" + changeFile;
	         try {
	            if (!originFile.equals("")) {
	               mf.transferTo(new File(after_pathfile));
	               bidao.reviewrt(originFile,rv_num,changeFile);
	            }
	         }catch (Exception e) { }
	      }

		int reviewcount=bidao.reviewIt(mem_num);
		
		System.out.println("왔오? : "+reviewcount);

		model.addAttribute("reviewcount",reviewcount);
		
		return "redirect:./review";
	}
	@RequestMapping("/reviewDetail")
	public String reviewDetail(HttpServletRequest request, Model model) {
		BIDao bidao=sqlSession.getMapper(BIDao.class);
		String rv_num=request.getParameter("rv_num");
		String rv_grade=request.getParameter("rv_grade");
		ReviewDto rvdto=bidao.review_detail(rv_num);
				
		List<Review_imgDto> rvimg=bidao.rvimg(rv_num);
		model.addAttribute("rvimg",rvimg);
		System.out.println(rvdto.getRv_title());
		model.addAttribute("review_detail",rvdto);
		
		
		
		return "board/reviewDetail";
	}
}
