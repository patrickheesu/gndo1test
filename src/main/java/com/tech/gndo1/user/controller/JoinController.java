package com.tech.gndo1.user.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.gndo1.user.dao.UIDao;

@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlSession;
	private String logkey = "";
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping("/idAssistance")
	public String idAssistance() {
		return "login/idAssistance";
	}
	
	@RequestMapping("/passAssistance")
	public String passAssistance() {
		return "login/passAssistance";
	}
	
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
	
	@RequestMapping("/joinCompanyInsert")
	public String joinCompanyInsert() {
		return "login/joinCompanyInsert";
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
	   public String joinCpy(HttpServletRequest request) throws Exception, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
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
	      
	      //암호화 처리
	      //단방향 암호화
	      MessageDigest md = MessageDigest.getInstance("SHA-512");
	      // 암호화할 데이터를 byte형 배열로 넣어준다. 예외발생해서 예외처리
	      md.update(cpy_pwd.getBytes("utf-8"));
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
	      byte[] encryptBytes = c.doFinal(cpy_pwd.getBytes("utf-8"));
	      cpy_pwd = Base64.getEncoder().encodeToString(encryptBytes);
	      

	      UIDao dao = sqlSession.getMapper(UIDao.class);
	      dao.insertCompany(cpy_id,cpy_pwd,cpy_name,cpy_cpnum,cpy_tel,cpy_resid,cpy_email,cpy_typecode,logkey);
	      
	      return "login/joinEnd";
	   }
	
	@RequestMapping("/joinMem")
	public String joinMem(HttpServletRequest request) throws Exception, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		System.out.println("소비자 회원가입 완료!");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_name = request.getParameter("mem_name");
		String to_mem_birth = request.getParameter("to_mem_birth");
		Date mem_birth = df.parse(to_mem_birth);
		System.out.println(mem_birth);
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_gender = request.getParameter("mem_gender");
		String mem_phonenum = request.getParameter("mem_phonenum");
		String mem_email = request.getParameter("mem_email");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		String mem_addr3 = request.getParameter("mem_addr3");
		String mem_addr = mem_addr1 + " " + mem_addr2 + " " + mem_addr3;
	      
	    //암호화 처리
	    //단방향 암호화
	    MessageDigest md = MessageDigest.getInstance("SHA-512");
	    // 암호화할 데이터를 byte형 배열로 넣어준다. 예외발생해서 예외처리
	    md.update(mem_pwd.getBytes("utf-8"));
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
	    byte[] encryptBytes = c.doFinal(mem_pwd.getBytes("utf-8"));
	    mem_pwd = Base64.getEncoder().encodeToString(encryptBytes);
	      

	    UIDao dao = sqlSession.getMapper(UIDao.class);
	    dao.insertMembers(mem_id, mem_pwd, mem_nickname, mem_name, mem_gender, mem_birth, mem_phonenum, mem_addr, mem_email , logkey);
	      
	    return "login/joinEnd";
	}
	@ResponseBody
	@RequestMapping(value = "/join/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("키 생성");
//		이메일 보내기
		String setFrom = "hayate5@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" +
				"인증 번호는 " + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
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
		return Integer.toString(checkNum);
	}
	
}
