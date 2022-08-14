package com.tech.gndo1.user.controller;


import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.user.dao.UIDao;

@RestController
public class UserRestController {
	
	private String logkey = "";
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSenderImpl mailSender;
	//소비자 아이디 찾기
	@PostMapping(value = "/join/midFind" , produces = "application/json; charset=UTF-8")
	public String miFind(String memName, String memEmail) {
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		String find_memid = dao.find_memid(memName,memEmail);
		
		return find_memid;
	}
	//사업자 아이디 찾기
	@PostMapping(value = "/join/cidFind" , produces = "application/json; charset=UTF-8")
	public String ciFind(String cpyName, String cpyEmail) {
		UIDao dao = sqlSession.getMapper(UIDao.class);
			
		String find_cpyid = dao.find_cpyid(cpyName,cpyEmail);
			
		return find_cpyid;
	}
	//소비자 비밀번호 찾기
	//유저 아이디 이메일 일치유무 검사
	@PostMapping(value = "/join/mExistent" , produces = "application/json; charset=UTF-8")
	public String mExistent(String memId, String memEmail) {
		UIDao dao = sqlSession.getMapper(UIDao.class);
			
		int mem_existent = dao.m_Existent(memId,memEmail);
		String rt = "";
		
		if (mem_existent != 1)
			rt = "true";		

		return rt;
	}
	//유저 비밀번호 난수로 변경 후 이메일 발송
	@PostMapping(value = "/join/mpassChange" , produces = "application/json; charset=UTF-8")
	public String mpassChange(String memId, String memEmail) throws Exception, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		Random random = new Random();
		int changeNum = random.nextInt(888888) + 111111;
		String cn = Integer.toString(changeNum);
		System.out.println(memId);
		System.out.println(cn);
		
		
		
		//이메일 보내기
		String setFrom = "hayate5@naver.com";
		String toMail = memEmail;
		String title = "임시비밀번호입니다.";
		String content = 
				"임시비밀번호는 " + cn + " 입니다." +
				"<br>" +
				"해당 비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content,true);
	        mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		//암호화 처리
		//단방향 암호화
		MessageDigest md = MessageDigest.getInstance("SHA-512");
	    // 암호화할 데이터를 byte형 배열로 넣어준다. 예외발생해서 예외처리
	    md.update(cn.getBytes("utf-8"));
	    // md.digest() : 암호화된 데이터를 byte배열로 반환한다.
	    logkey = Base64.getEncoder().encodeToString(md.digest());
	      
	    //양방향 암호화
	    byte[] keyBytes = new byte[16];
	    System.arraycopy(logkey.getBytes("utf-8"), 0, keyBytes, 0, keyBytes.length);
	    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
	    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    String iv = logkey.substring(0, 16);
	    byte[] ivBytes = new byte[16]; 
	    System.arraycopy(iv.getBytes("utf-8"), 0, ivBytes, 0, ivBytes.length);
	    c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(ivBytes));
	    byte[] encryptBytes = c.doFinal(cn.getBytes("utf-8"));
	    cn = Base64.getEncoder().encodeToString(encryptBytes);
			    
		UIDao dao = sqlSession.getMapper(UIDao.class);
		dao.mpChange(cn, logkey, memId, memEmail);
		System.out.println("임의 6자리로 비번 변경 완료!");
		
		return cn;
	}
	//사업자 비밀번호 찾기
	//사업자 아이디 이메일 일치유무 검사
	@PostMapping(value = "/join/cExistent" , produces = "application/json; charset=UTF-8")
	public String cExistent(String cpyId, String cpyEmail) {
		UIDao dao = sqlSession.getMapper(UIDao.class);
			
		int cpy_existent = dao.c_Existent(cpyId,cpyEmail);
		String rt = "";
		
		if (cpy_existent != 1)
			rt = "true";		

		return rt;
	}
	//사업자 비밀번호 난수로 변경 후 이메일 발송
	@PostMapping(value = "/join/cpassChange" , produces = "application/json; charset=UTF-8")
	public String cpassChange(String cpyId, String cpyEmail) throws Exception, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		Random random = new Random();
		int changeNum = random.nextInt(888888) + 111111;
		String cn = Integer.toString(changeNum);
		System.out.println(cpyId);
		System.out.println(cn);
		
		
		
		//이메일 보내기
		String setFrom = "hayate5@naver.com";
		String toMail = cpyEmail;
		String title = "임시비밀번호입니다.";
		String content = 
				"임시비밀번호는 " + cn + " 입니다." +
				"<br>" +
				"해당 비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content,true);
	        mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		//암호화 처리
		//단방향 암호화
		MessageDigest md = MessageDigest.getInstance("SHA-512");
	    // 암호화할 데이터를 byte형 배열로 넣어준다. 예외발생해서 예외처리
	    md.update(cn.getBytes("utf-8"));
	    // md.digest() : 암호화된 데이터를 byte배열로 반환한다.
	    logkey = Base64.getEncoder().encodeToString(md.digest());
	      
	    //양방향 암호화
	    byte[] keyBytes = new byte[16];
	    System.arraycopy(logkey.getBytes("utf-8"), 0, keyBytes, 0, keyBytes.length);
	    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
	    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    String iv = logkey.substring(0, 16);
	    byte[] ivBytes = new byte[16]; 
	    System.arraycopy(iv.getBytes("utf-8"), 0, ivBytes, 0, ivBytes.length);
	    c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(ivBytes));
	    byte[] encryptBytes = c.doFinal(cn.getBytes("utf-8"));
	    cn = Base64.getEncoder().encodeToString(encryptBytes);
			    
		UIDao dao = sqlSession.getMapper(UIDao.class);
		dao.cpChange(cn, logkey, cpyId, cpyEmail);
		System.out.println("임의 6자리로 비번 변경 완료!");
		
		return cn;
	}
	
	//사업자 이메일 중복검사
	@PostMapping(value = "/join/duplicateCheck4" , produces = "application/json; charset=UTF-8" )
	public String duplicateCheck4(String email) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_cpmail = dao.check_cpmail(email);
		
		String rt = "";  // return_text
		
		if (count_cpmail != 1)
			rt = "true";		

		return rt;
	}
	//소비자 이메일 중복검사
	@PostMapping(value = "/join/duplicateCheck3" , produces = "application/json; charset=UTF-8" )
	public String duplicateCheck3(String email) throws Exception {
		
		UIDao dao = sqlSession.getMapper(UIDao.class);
		
		int count_memail = dao.check_memail(email);
		
		String rt = "";  // return_text
		
		if (count_memail != 1)
			rt = "true";		

		return rt;
	}
	
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
