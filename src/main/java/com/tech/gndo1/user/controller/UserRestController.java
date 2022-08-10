package com.tech.gndo1.user.controller;


import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.user.dao.UIDao;

@RestController
public class UserRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@PostMapping(value = "/join/duplicateCheck2" , produces = "application/json; charset=UTF-8" )
	public String duplicateCheck2(String memberNk) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_nk = dao.check_nk(memberNk);
		
		String rt = "";  // return_text
		
		if (count_nk != 1)
			rt = "true";		

		return rt;
	}
	
	@PostMapping(value = "/join/duplicateCheck" , produces = "application/json; charset=UTF-8" )
	public String duplicateCheck(String memberId) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_mem = dao.check_mem(memberId);
		int count_cpy = dao.check_cpy(memberId);
		
		String rt = "";  // return_text
		
		if (count_mem + count_cpy != 1)
			rt = "true";		

		return rt;
	}
	@PostMapping(value = "/join/CpnCheck" , produces = "application/json; charset=UTF-8" )
	public String CpnCheck(String memberCpnum) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_cpyNum = dao.check_cpyNum(memberCpnum);
		
		String rt = "";  // return_text
		
		if (count_cpyNum != 1)
			rt = "true";		

		return rt;
	}
	
	@PostMapping("/login/loginCheck")
	public String loginCheck(String check_id, String check_pwd, String check_table) throws Exception, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		String check_bool = "default";
		String solve_pwd = "";
		String db_key = "";
		String db_pwd = "";
		
		if (check_table.equals("members") && 1 == dao.check_mem(check_id)) {
			MembersDto mdto = dao.login_checkmpwd(check_id);
			db_key = mdto.getMem_logkey();
			db_pwd = mdto.getMem_pwd();
		} else if (check_table.equals("company") && 1 == dao.check_cpy(check_id)) {
			CompanyDto cdto = dao.login_checkcpwd(check_id);
			db_key = cdto.getCpy_logkey();
			db_pwd = cdto.getCpy_pwd();
		} else {
			check_bool = "false";
		}
		
		if (check_bool.equals("default")) {
			byte[] keyBytes = new byte[16];
			System.arraycopy(db_key.getBytes("utf-8"), 0, keyBytes, 0, keyBytes.length);
			SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
			Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
			String iv = db_key.substring(0, 16);
			byte[] ivBytes = new byte[16];
			System.arraycopy(iv.getBytes("utf-8"), 0, ivBytes, 0, ivBytes.length);
			c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(ivBytes));
			byte[] byteStr = Base64.getDecoder().decode(db_pwd);
			solve_pwd = new String(c.doFinal(byteStr), "utf-8");			
			
				if (check_pwd.equals(solve_pwd)) {
					check_bool = "true";
				}
		}
		
		
		System.out.println(check_bool);
		return check_bool;
	}
}
