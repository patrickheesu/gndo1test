package com.tech.gndo1.cptype.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.gndo1.cptype.dao.CIDao;
import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

@Controller
public class CptypeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/cpinsert")
	public String cpinsert(HttpServletRequest request,Model model) throws Exception {
		//숙소등록 페이지로 이동
		return "mypage/company/cpInsert";
		
	}
	@RequestMapping(value = "/cpRoomInsert", method = RequestMethod.POST)
	public String cpRoomInsert(MultipartHttpServletRequest mtfrequest,Model model,HttpSession session) throws Exception {
		int cpy_num=(Integer)session.getAttribute("cpy_num");
		CIDao dao=sqlSession.getMapper(CIDao.class);
		String acc_map=""; //주소값 통합 변수
		
		String cpname=mtfrequest.getParameter("cpname");
		String acc_tel=mtfrequest.getParameter("acc_tel");
		String acc_info=mtfrequest.getParameter("acc_info");
		String acc_serkeyword=mtfrequest.getParameter("acc_serkeyword");
		String zipcode=mtfrequest.getParameter("zipcode");
		String address1=mtfrequest.getParameter("address1");
		String address2=mtfrequest.getParameter("address2");
		String acc_location=mtfrequest.getParameter("acc_location");
		String lat=mtfrequest.getParameter("lat");
		String lng=mtfrequest.getParameter("lng");
		acc_map=address1;
		
		dao.cpInsert(cpname,acc_tel,acc_info,acc_serkeyword,acc_map,acc_location,lat,lng,cpy_num,address2);
		int accsel=dao.accsel(cpy_num);
		
		model.addAttribute("accsel",accsel);
		
		
		
		System.out.println(lat+lng);
		int acc_num2=dao.selacc_num();
		//업소사진 다중업로드
		String root="C:\\javasbigspring\\springwork22\\gndo1test2\\src\\main\\webapp\\resources\\upload";
		List<MultipartFile> fileList= mtfrequest.getFiles("file");
		
		for (MultipartFile mf : fileList) {
			String originFile=mf.getOriginalFilename();
			long longtime=System.currentTimeMillis();
			String changeFile=longtime+"_"+mf.getOriginalFilename();
			String pathfile=root+"\\"+originFile;
			String after_pathfile = root + "\\" + changeFile;
			try {
				if (!originFile.equals("")) {
//					mf.transferTo(new File(pathfile));
					mf.transferTo(new File(after_pathfile));
					dao.cpimginsert(originFile,acc_num2,changeFile);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		return "mypage/company/cpRoomInsert"; //객실등록 페이지로 이동
	}
	@RequestMapping("/cpRoomInsert2")
	public String cpRoomInsert2(MultipartHttpServletRequest mtfrequest,Model model,HttpSession session) {
		CIDao dao=sqlSession.getMapper(CIDao.class);
		int cpy_num=(Integer)session.getAttribute("cpy_num");
		String acc_num=mtfrequest.getParameter("acc_num");
		Accommodation_infoDto cdto=dao.cptype(acc_num);
		System.out.println(acc_num);
		session.setAttribute("acc_num", cdto.getAcc_num());
		int acc_nu=(Integer)session.getAttribute("acc_num");
		System.out.println(acc_nu);
		int countnum=Integer.parseInt(mtfrequest.getParameter("addcount"));
		System.out.println(countnum);
		String root="C:\\javasbigspring\\springwork22\\gndo1test2\\src\\main\\webapp\\resources\\upload";
		for (int i = 1; i < countnum + 1; i++) {
			String rt_rmname=mtfrequest.getParameter("rt_rmname"+i);
			String rt_rmcount=mtfrequest.getParameter("rt_rmcount"+i);
			String rt_rpeople=mtfrequest.getParameter("rt_rpeople"+i);
			String rt_price=mtfrequest.getParameter("rt_price"+i);
			String rt_info=mtfrequest.getParameter("rt_info"+i);
			String rt_in=mtfrequest.getParameter("rt_in"+i);
			String rt_out=mtfrequest.getParameter("rt_out"+i);
			dao.rtInsert(rt_rmname,rt_rmcount,rt_rpeople,rt_price,rt_info,rt_in,rt_out,acc_nu);
			int rt_num=dao.selrt_num();
			
				List<MultipartFile> fileList= mtfrequest.getFiles("file"+i);
				for (MultipartFile mf : fileList) {
					String originFile=mf.getOriginalFilename();
					long longtime=System.currentTimeMillis();
					String changeFile=longtime+"_"+mf.getOriginalFilename();
					String pathfile=root+"\\"+originFile;
					String after_pathfile = root + "\\" + changeFile;
					try {
						if (!originFile.equals("")) {
							mf.transferTo(new File(after_pathfile));
							dao.rtimginsert(originFile,rt_num,changeFile);
						}
					}catch (Exception e) { }
				}
			}
		
//		String rt_rmname=mtfrequest.getParameter("rt_rmname");
//		String rt_rmcount=mtfrequest.getParameter("rt_rmcount");
//		String rt_rpeople=mtfrequest.getParameter("rt_rpeople");
//		String rt_price=mtfrequest.getParameter("rt_price");
//		String rt_info=mtfrequest.getParameter("rt_info");
//		String rt_in=mtfrequest.getParameter("rt_in");
//		String rt_out=mtfrequest.getParameter("rt_out");
//		dao.rtInsert(rt_rmname,rt_rmcount,rt_rpeople,rt_price,rt_info,rt_in,rt_out,acc_nu);
	
		
		
		
		
		
		
		int acc_cnt=dao.acccnt(cpy_num);
		model.addAttribute("acccnt",acc_cnt);
		return "mypage/company/cpPage"; //사업자 페이지로 이동
				
	}
	@RequestMapping("/cpRoomAdd")
	 public String cpRoomAdd(Model model,HttpSession session) {
		CIDao cdao=sqlSession.getMapper(CIDao.class);
		int cpy_num=(Integer)session.getAttribute("cpy_num");
		int acc_num=cdao.accsel(cpy_num);
		model.addAttribute("accsel",acc_num);
		
		 return "mypage/company/cpRoomInsert";
	 }
	@RequestMapping("/htList")
	public String htList() {
		return "hotel/htList";
		
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
