package com.tech.gndo1.cptype.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.gndo1.cptype.dao.CIDao;
import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

@RestController
@RequestMapping("/addroom/*")
public class CptypeRestController {
	
	static Logger logger=LoggerFactory.getLogger(CptypeRestController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/restroomdata")
	public List<RoomTypeDto> restroomdata(MultipartHttpServletRequest mtfrequest,Model model) throws Exception{
		CIDao cdao=sqlSession.getMapper(CIDao.class);
		HttpSession session=mtfrequest.getSession();
		int cpy_num=(Integer)(session.getAttribute("cpy_num"));
		System.out.println("cpynum="+cpy_num);
		int acc_num=cdao.accsel(cpy_num);
		System.out.println("accnum="+acc_num);
		Accommodation_infoDto cdto=cdao.cptypesel(acc_num);
		session.setAttribute("acc_num", cdto.getAcc_num());
		int acc_nu=(Integer)session.getAttribute("acc_num");
		System.out.println("acc_nu"+acc_nu);
		String rt_rmname=mtfrequest.getParameter("rt_rmname");
		String rt_rmcount=mtfrequest.getParameter("rt_rmcount");
		String rt_rpeople=mtfrequest.getParameter("rt_rpeople");
		String rt_price=mtfrequest.getParameter("rt_price");
		String rt_info=mtfrequest.getParameter("rt_info");
		String rt_in=mtfrequest.getParameter("rt_in");
		String rt_out=mtfrequest.getParameter("rt_out");
		
		System.out.println(rt_rmname);
		cdao.rtInsert(rt_rmname, rt_rmcount, rt_rpeople, rt_price, rt_info, rt_in, rt_out, acc_nu);
		
		
		String root="C:\\javasbigspring\\springwork22\\gndo1test2\\src\\main\\webapp\\resources\\upload";
		
		int rt_num=cdao.selrt_num();
		System.out.println("rtnum="+rt_num);
		List<MultipartFile> fileList= mtfrequest.getFiles("file");
		List<MultipartFile> mainfileList= mtfrequest.getFiles("mainfile");
		for (MultipartFile mf : mainfileList) {
			String originFile=mf.getOriginalFilename();
			long longtime=System.currentTimeMillis();
			String changeFile=longtime+"_"+mf.getOriginalFilename();
			String pathfile=root+"\\"+originFile;
			String after_pathfile = root + "\\" + changeFile;
			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(after_pathfile));
					cdao.rtimginsert(originFile,rt_num,changeFile);
				}
			}catch (Exception e) { }
		}
		System.out.println("filelist"+fileList);
		for (MultipartFile mf : fileList) {
			String originFile=mf.getOriginalFilename();
			long longtime=System.currentTimeMillis();
			String changeFile=longtime+"_"+mf.getOriginalFilename();
			String pathfile=root+"\\"+originFile;
			String after_pathfile = root + "\\" + changeFile;
			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(after_pathfile));
					cdao.rtimginsert(originFile,rt_num,changeFile);
				}
			}catch (Exception e) { }
		}
		List<RoomTypeDto> rdto=cdao.accroomselect(acc_num);
		System.out.println("뭔데"+rdto.get(0).getRti().getRti_afterimg());
		System.out.println("뭔데:"+rdto.get(0).getRti().getRti_img());
		model.addAttribute("rdto",rdto);
		return rdto;
	}
	
	@RequestMapping("/restdeldata")
	public List<RoomTypeDto> restdeldata(HttpServletRequest request)throws Exception{
		CIDao cdao=sqlSession.getMapper(CIDao.class);
		HttpSession session=request.getSession();
		int cpy_num=(Integer)(session.getAttribute("cpy_num"));
		int acc_num=cdao.accsel(cpy_num);
		String rt_num=request.getParameter("rt_num");
		System.out.println("rtnum"+rt_num);
		cdao.rtidel(rt_num);
		cdao.rtdel(rt_num);
		List<RoomTypeDto> rdto=cdao.accroomselect(acc_num);
		
		
		return rdto;
	}
}
