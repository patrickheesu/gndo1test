<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>소비자 회원가입</title>
    <style>
        body{
            text-align: center;
        }
        .a{
            width: 200px;
            height: 200px;
            align-items: center;
        }
    </style>
   <link rel="stylesheet" href="resources/css/login/joinMembersInsert.css">   
</head>
<body>
    <h3><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3><br>


    <form name="join" action="joinMem" method="post" onsubmit="return jcSubmit()">
        <table class="join">
        	<!-- 아이디 -->
            <tr>
                <td>아이디</td>
                <td><input type="text" name="mem_id" id="id" placeholder="아이디 입력"></td>
                <td><input type="button" class="checkId_bt" value="중복 확인" onclick="duplicateCheck();" /></td>
              	
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_id" class="check_id">*중복 확인 필수</span></td>
            </tr>
            <!-- 비밀번호 -->
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="mem_pwd" id="pwd1" placeholder="************" onkeyup="passwordCheck1();"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_pwd1" class="check_pwd1"></span></td>
            </tr>
            <!-- 비밀번호 확인 -->
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="pwd2" id="pwd2" placeholder="************" onkeyup="passwordCheck2();"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_pwd2" class="check_pwd2"></span></td>
            </tr>
            <!-- 이름 -->
            <tr>
                <td>이름</td>
                <td><input type="text" name="mem_name" id="mem_name" placeholder="이름 입력" onkeyup="mnameCheck();"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_mn" class="check_mn"></span></td>
            </tr>
            <!-- 생년월일 -->
            <tr>
                <td>생년월일</td>
                <td><input class="date" id="mem_birth" name="to_mem_birth" type="date" ></td>
                <td><input type="button" class="checkBr_bt" value="가입여부확인" onclick="agreeCheck();" /></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_birth" class="check_birth">가입여부 확인</span></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" id="mem_nickname" name="mem_nickname" placeholder="닉네임 입력"></td>
                <td><input type="button" name="checkNk_bt" value="중복검사" onclick="duplicateCheck2();" /></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_nick" class="check_nick">닉네임을 입력해주세요</span></td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                <select name="mem_gender" id="mem_gender" class="gender">
                    <option value="">------선택------</option>
                    <option value="man">남자</option>
                    <option value="woman">여자</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>핸드폰 번호</td>
                <td>
                    <input type="text" id="mem_phonenum" name="mem_phonenum" placeholder="010********" 
                    maxlength="13" oninput="autoHyphen2(this)" onkeyup="telCheck();">
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="check_tel" class="check_tel">*</span></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" id="mem_email" name="mem_email" onkeyup="email_vc();" placeholder="email"></td>
                <td><input type="button" class="email_auth_btn"  id="email_auth_btn" disabled value="메일인증"  /></td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="email_vc" class="email_vc">메일형식에 맞게 입력</span></td>
            </tr>
            <tr>
            	<td></td>
				<td><input class="email_auth_key" id="email_auth_key" placeholder="인증번호 입력" maxlength="6"></td>
            </tr>
            <tr>
            	<td></td>
				<td><span id="email_auth" class="email_auth">확인</span></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" name="mem_addr1" id="mem_addr1" placeholder="우편주소 검색" onclick="findAddr()" readonly><br>
                    <input type="text" name="mem_addr2" id="mem_addr2" readonly placeholder="주소"><br>
                    <input type="text" name="mem_addr3" id="mem_addr3" placeholder="상세주소 입력">
                </td>
            </tr>
        </table>
        <input class="join2" type="submit" value="가입하기" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">
    </form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
           console.log(data);

           var roadAddr = data.roadAddress;//도로명 주소 변수
           var jibunAddr = data.jibunAddress;//지번 주소 변수
           document.getElementById('mem_addr1').value = data.zonecode;
           if(roadAddr !==''){
            document.getElementById("mem_addr2").value = roadAddr;
           }else if(jibunAddr !==''){
            document.getElementById("mem_addr2").value = jibunAddr;
           }
           
        }
    }).open();
}
function OnMouseIn(elem){
    elem.style.border="2px solid blue";
    elem.style.color="blue";
}
function OnMouseOut(elem){
    elem.style.border="";
    elem.style.color="";
}
//아이디 유효성 검사 및 중복검사
function duplicateCheck() { 
	
	var lengthId = document.getElementById('id').value;
	var idCheck = /^[a-zA-Z0-9]{8,}$/;
	var memberId = $('#id').val();
	var data = {memberId : memberId}
	
	if (lengthId.length < 8) {
		$("#check_id").html("아이디는 8자 이상이여야 합니다");
		$("#check_id").css('color' , 'red'); 
	}else if(!idCheck.test(memberId)){
		$("#check_id").html("id는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")
		$("#check_id").css('color' , 'red');
	}else {
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/duplicateCheck',
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result == 'true') {
					$("#check_id").html("사용 가능한 아이디 입니다");
					$("#check_id").css('color', 'green');
				} else {
					$("#check_id").html("중복된 아이디 입니다");
					$("#check_id").css('color', 'red');
				}
			}
		});
	}
}
//비밀번호 10자이상이고 영문,숫자,특수문자 포함 판별
function passwordCheck1(){ //비밀번호 검사 함수
		var pw1 = $("#pwd1").val();
		var pw2 = $("#pwd2").val();
		var num = pw1.search(/[0-9]/g);
		var eng = pw1.search(/[a-z]/ig);
		var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(pw1.length<8 || pw1.length>20){
			$("#check_pwd1").html("8자리 ~ 20자리 이내로 입력해주세요.");
			$("#check_pwd1").css('color','red');
		}else if(pw1.search(/\s/) != -1){
			$("#check_pwd1").html("비밀번호는 공백 없이 입력해주세요.");
			$("#check_pwd1").css('color','red');
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$("#check_pwd1").html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			$("#check_pwd1").css('color','red');
		}else{
			$("#check_pwd1").html("ok");
			$("#check_pwd1").css('color','green');
		}
			
	}
//비밀번호 일치판별
function passwordCheck2(){
	var pw1 = $("#pwd1").val();
	var pw2 = $("#pwd2").val();
	if(pw1 != pw2){
		$("#check_pwd2").html("비밀번호가 일치하지 않습니다");
		$("#check_pwd2").css('color','red');
	}else if(pw1 == pw2){
		$("#check_pwd2").html("비밀번호가 일치합니다");
		$("#check_pwd2").css('color','green');
	}
	
}
//고객 이름 정규식검사
function mnameCheck(){
	var mn = $("#mem_name").val();
	var mnCheck = /^[가-힣]{2,6}$/;
	if(!mn){
		$("#check_mn").html("이름을 입력해 주세요.");
		$("#chech_mn").css('color','red');
	}else if(!mnCheck.test(mn)){
		$("#check_mn").html("사용할 수 없는 이름입니다.");
		$("#chech_mn").css('color','red');
	}else if(mnCheck.test(mn) === true){
		$("#check_mn").html("사용가능한 이름입니다.");
		$("#chech_mn").css('color','green');
	}
}
//생년월일 회원가입 가능 여부
function agreeCheck(){
	var today = new Date();
	var mb = $("#mem_birth").val();
	var bd = new Date(mb);
	var age = today.getFullYear() - bd.getFullYear() +1; //+1해준 이유는 세는나이 설정
	//(만나이로 할거면 +1빼고 밑에 객체m으로 if돌리기)
	//만나이 설정(보류)
	/* var m = today.getMonth() - bd.getMonth();
	if(m < 0 || (m === 0 && today.getDate() < bd.getDate())){
		age--;
	} */
	if(age < 20){//세는나이 설정
		$("#check_birth").html("가입할 수 없습니다.");
		$("#check_birth").css('color','red');
	}else{
		$("#check_birth").html("가입하실 수 있습니다.");
		$("#check_birth").css('color','green');
	}
	console.log(today);
	console.log(bd);
	console.log(age);
}
//닉네임 유효성 검사 및 중복검사
function duplicateCheck2() { 
	
	var lengthNk = document.getElementById('mem_nickname').value;
	var nkCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
	var memberNk = $('#mem_nickname').val();
	var data = {memberNk : memberNk}
	
	if (lengthNk.length < 2) {
		console.log(data);
		$("#check_nick").html("아이디는 2자 이상이여야 합니다");
		$("#check_nick").css('color' , 'red'); 
	}else if(!nkCheck.test(memberNk)){
		$("#check_nick").html("id는 2자이상의 한글,영문,숫자로 입력해주세요.")
		$("#check_nick").css('color' , 'red');
	}else {
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/duplicateCheck2',
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result == 'true') {
					$("#check_nick").html("사용 가능한 아이디 입니다");
					$("#check_nick").css('color', 'green');
				} else {
					$("#check_nick").html("중복된 아이디 입니다");
					$("#check_nick").css('color', 'red');
				}
			}
		});
	}
}
//전화번호 오토하이픈
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
//전화번호 정규식검사
function telCheck(){
	var mp = $("#mem_phonenum").val();
	var mpCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(mpCheck.test(mp) === true){
		$("#check_tel").html("사용가능한 번호입니다.");
		$("#check_tel").css('color','green');
	}else{
		$("#check_tel").html("사용할 수 없는 번호입니다.");
		$("#check_tel").css('color','red');
	}
}
//이메일 유효성 검사 및 메일인증버튼 활성화
function email_vc(){ 
	var emailVc = document.getElementById('mem_email').value;
	var eCheck_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var button = document.querySelector(".email_auth_btn");
	button.disabled = true;
	if(eCheck_rule.test(emailVc) === true){
		$("#email_vc").html("메일인증을 눌러주세요!");
		button.disabled = false;
	}else{
		$("#email_vc").html("");
		button.disabled = true;
	}
	
} 
//이메일 발송
var email_auth_cd = ''; 

$(".email_auth_btn").click(function(){
	var email = $('#cpy_email').val();
	if(email == ''){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(email != ''){
		$.ajax({
			type : "POST",
			url : "<%=path%>/join/emailAuth",
			data : {email : email},
			success: function(data){
				alert("인증번호가 발송되었습니다.");
				email_auth_cd = data;
				console.log(email_auth_cd);
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		});
	}
});
$("#email_auth_key").keyup(function(){
	console.log(email_auth_cd);
	var emailKey = $('#email_auth_key').val();
	if(emailKey != email_auth_cd){
		$("#email_auth").html("인증번호가 일치하지 않습니다");
		$("#email_auth").css('color','red');	
	}else{
		$("#email_auth").html("인증번호가 일치합니다");
		$("#email_auth").css('color','green');
	}
});

//가입하기 누를 시 빈칸 및 형식에 맞지 않으면 alert
function jcSubmit(){
 	//아이디 유효성검사
	var lengthId = document.getElementById('id').value;
	var idCheck = /^[a-zA-Z0-9]{8,}$/;
	var memberId = $('#id').val();
	var data = {memberId : memberId};
	var return_f = "";
	
	if (lengthId.length < 8) {
		alert("아이디는 8자 이상이어야 합니다.")
		return false;
	}else if(!idCheck.test(memberId)){
		alert("id는 8자이상의 영문 대소문자와 숫자로만 입력해주세요.")
		return false;
	}else{
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/duplicateCheck',
	   	 	async : false ,
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result != 'true') {
					alert("중복된 아이디입니다.")
					return_f = "returnp";
				}
			}
		});
		if(return_f == "returnp"){
			return false;
		}
		
	}
	//비밀번호 유효성검사
	var pw1 = $("#pwd1").val();
	var pw2 = $("#pwd2").val();
	var num = pw1.search(/[0-9]/g);
	var eng = pw1.search(/[a-z]/ig);
	var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw1 == ""){
		alert("비밀번호를 입력해 주세요.")
		return false;
	}else if(pw1.length<8 || pw1.length>20){
	  	alert("8자리 ~ 20자리 이내로 입력해주세요.");
	  	return false;
	}else if(pw1.search(/\s/) != -1){
	  	alert("비밀번호는 공백 없이 입력해주세요.");
	  	return false;
	}else if(num < 0 || eng < 0 || spe < 0 ){
	  	alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
	  	return false;
	}else if(pw1 != pw2){
		alert("비밀번호가 일치하지 않습니다.")
		return false;
	}
	//대표자 성명 정규식
	var mn = $("#mem_name").val();
	var mnCheck = /^[가-힣]{2,6}$/;
	if(mn == ""){
		alert("이름을 입력해주세요.")
		return false;
	}else if(!mnCheck.test(mn)){
		alert("사용할 수 없는 이름입니다.")
		return false;
	}
	//생년월일 가입여부
	var today = new Date();
	var mb = $("#mem_birth").val();
	var bd = new Date(mb);
	var age = today.getFullYear() - bd.getFullYear() +1; //+1해준 이유는 세는나이 설정
	//(만나이로 할거면 +1빼고 밑에 객체m으로 if돌리기)
	//만나이 설정(보류)
	/* var m = today.getMonth() - bd.getMonth();
	if(m < 0 || (m === 0 && today.getDate() < bd.getDate())){
		age--;
	} */
	if(!mb){
		alert("생년월일을 입력해주세요");
		 return false;
	}else if(age < 20){//세는나이 설정
		alert("20살 이상만 가입할 수 있습니다");
		return false;
	}
	/* console.log(today);
	console.log(bd);
	console.log(age); */
	
	//닉네임 유효성검사 및 중복검사
	var lengthNk = document.getElementById('mem_nickname').value;
	var nkCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
	var memberNk = $('#mem_nickname').val();
	var data = {memberNk : memberNk}
	
	if (lengthNk.length < 2) {
		alert("닉네임은 2자이상의 한글,영문,숫자로 입력해주세요.");
		return false;
	}else if(!nkCheck.test(memberNk)){
		alert("닉네임은 2자이상의 한글,영문,숫자로 입력해주세요.");
		return false;
	}else {
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/duplicateCheck2',
	   		async : false ,
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result != 'true') {
					alert("중복된 닉네임입니다.")
					return_f = "returnp";
				}
			}
		});
		if(return_f == "returnp"){
			return false;
		}
	}
	//성별 체크
	var gender = $("#mem_gender").val();
	if(!gender){
		alert("성별을 체크해주세요");
		return false;
	}
	
	
	//핸드폰 번호 정규식
	var cp = $("#mem_phonenum").val();
	var cpCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(!cp){
		alert("핸드폰 번호를 입력해주세요.")
		return false;
	}else if(!cpCheck.test(cp)){
		alert("사용할 수 없는 핸드폰 번호입니다.")
		return false;
	}
	//이메일주소 정규식 검사
	var emailVc = document.getElementById('mem_email').value;
	var eCheck_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var button = document.querySelector(".email_auth_btn");
	if(!emailVc){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(!eCheck_rule.test(emailVc)){
		alert("이메일 형식이 맞지않습니다.");
		return false;
	}
	//메일인증번호 일치판별
	console.log(email_auth_cd);
	var emailKey = $('#email_auth_key').val();
	if(!emailKey && eCheck_rule.test(emailVc) === true){
		alert("메일 인증번호를 입력해주세요.")
		return false;
	}else if(emailKey != email_auth_cd){
		alert("메일 인증번호가 일치하지 않습니다!")
		return false;
	}
} 


</script>
    
</body>
</html>