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
<title>사업자 회원가입</title>
<link rel="stylesheet" href="resources/css/login/joinMembersInsert.css">
</head>
<body>
	<a href="./"><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""><br></a>
	<form name="join" id="join" action="joinCpy" method="post" onsubmit="return jcSubmit()">
		<table class="join">
			<tr>
				<td>아이디*</td>
				<td><input type="text" name="cpy_id" id="id" placeholder="8자 이상"></td>
				<td><input type="button" class="checkId_bt" value="중복 확인" onclick="duplicateCheck();" /></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_id" class="check_id"></span></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호*</td>
				<td><input type="password" name="cpy_pwd" id="pwd1" placeholder="영문,숫자,특수문자를 포함" onkeyup="passwordCheck1();"></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_pwd1" class="check_pwd1"></span></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호 확인*</td>
				<td><input type="password" name="pwd2" id="pwd2" placeholder="************" onkeyup="passwordCheck2();"></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_pwd2" class="check_pwd2"></span></td>
				<td></td>
			</tr>
			<tr>
				<td>대표자 성명*</td>
				<td><input type="text" name="cpy_name" id="cpy_name" placeholder="대표자 성명 입력" onkeyup="cnameCheck();"></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_cn" class="check_cn"></span></td>
				<td></td>
			</tr>
			<tr>
				<td>사업자 번호*</td>
				<td><input type="text" name="cpy_cpnum" id="cpy_cpnum" oninput="autoHyphen(this)" maxlength="12" placeholder="ex)123-45-78912"></td>
				<td><input type="button" class="checkCpnum_bt" value="중복 확인" onclick="CpnumCheck();" /></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_Cpnum" class="check_Cpnum"></span></td>
				<td></td>
			</tr>
			<tr>
				<td>주민등록번호*</td>
				<td>
					&nbsp<input type="text" name="cpy_resid1" id="cpy_resid1" placeholder="6자리 입력" maxlength="6" size="11" onkeyup="CpresidCheck1();">
					-&nbsp<input type="password" name="cpy_resid2" id="cpy_resid2" placeholder="1~4" maxlength="1" size="1" onkeyup="CpresidCheck2();">
				</td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_Cpresid" class="check_Cpresid"></span></td>
			</tr>
			<tr>
				<td>핸드폰 번호*</td>
				<td><input type="text" name="cpy_tel" id="cpy_tel" placeholder="010********" maxlength="13" oninput="autoHyphen2(this)" onkeyup="CptelCheck();"></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="check_Cptel" class="check_Cptel"></span></td>
			</tr>
			<tr>
				<td>이메일*</td>
				<td><input type="email" name="cpy_email" id="cpy_email" onkeyup="email_vc();" placeholder="email" /></td>
				<td><input type="button" class="email_auth_btn"  id="email_auth_btn" disabled value="메일 인증"  /></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="email_vc" class="email_vc"></span></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="email_auth_key" id="email_auth_key" placeholder="인증번호 입력" maxlength="6"></td>
			</tr>
			<tr>
				<td></td>
				<td><hr /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="email_auth" class="email_auth"></span></td>
			</tr>
			<tr>
				<td>사업장 종류*</td>
				<td>
					<select name="cpy_typecode">
						<option value="1">호텔</option>
						<option value="2">모텔</option>
						<option value="3">펜션</option>
						<option value="4">게스트 하우스</option>
						<option value="5">캠핑장</option>
					</select>
			</tr>
		</table>
		<input class="join2" type="submit" value="가입하기" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">
	</form>
	
	<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	//가입하기버튼 빤짝이
	function OnMouseIn(elem){
	    elem.style.border="2px solid blue";
	    elem.style.color="blue";
	}
	function OnMouseOut(elem){
	    elem.style.border="";
	    elem.style.color="";
	}
	
	//주소찾기
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
           console.log(data); 

           var roadAddr = data.roadAddress;//도로명 주소 변수
           var jibunAddr = data.jibunAddress;//지번 주소 변수
           document.getElementById('zipcode').value = data.zonecode;
           if(roadAddr !==''){
            document.getElementById("address1").value = roadAddr;
           }else if(jibunAddr !==''){
            document.getElementById("address1").value = jibunAddr;
           }
           
        }
    }).open();
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
//대표자성명 정규식검사
function cnameCheck(){
	var cn = $("#cpy_name").val();
	var ccn = document.getElementById("check_cn");
	var cnCheck = RegExp(/^[가-힣]{2,6}$/);
	if(cnCheck.test(cn) === true){
		$("#check_cn").html("사용가능한 이름입니다.");
		ccn.style.color = "green";
	}else{
		$("#check_cn").html("사용할 수 없는 이름입니다.");
		ccn.style.color = "red";
	}
}
//사업자번호 오토하이픈
const autoHyphen = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
//사업자번호 정규식검사 및 중복검사
function CpnumCheck() { 
	
	var lengthCpnum = document.getElementById('cpy_cpnum').value;
	var CpnumCheck = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
	var memberCpnum = $('#cpy_cpnum').val();
	var data = {memberCpnum : memberCpnum}
	
	if (!CpnumCheck.test(memberCpnum)) {
		$("#check_Cpnum").html("숫자 10자리로 구성되어야 합니다.");
		$("#check_Cpnum").css('color' , 'red'); 
	}else {
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/CpnCheck',
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result == 'true') {
					$("#check_Cpnum").html("사용가능한 번호입니다.");
					$("#check_Cpnum").css('color', 'green');
				} else {
					$("#check_Cpnum").html("중복된 번호입니다.");
					$("#check_Cpnum").css('color', 'red');
				}
			}
		});
	}
}
//주민등록번호 앞자리 정규식검사
function CpresidCheck1(){
	var ci1 = $("#cpy_resid1").val();
	var ci1Check = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/;
	if(ci1Check.test(ci1) === true){
		$("#check_Cpresid").html("뒷자리를 입력하세요.");
		$("#check_Cpresid").css('color','green');
	}else if(!ci1){
		$("#check_Cpresid").html("값을 입력해 주세요");
		$("#check_Cpresid").css('color','red');
	}else if(!ci1Check.test(ci1)){
		$("#check_Cpresid").html("형식에 맞지 않습니다.");
		$("#check_Cpresid").css('color','red');
	}
}
//주민등록번호 뒷자리 정규식검사
function CpresidCheck2(){
	var ci2 = $("#cpy_resid2").val();
	var ci2Check = ci2.search(/[1-4]/g);
	if(ci2.search(/\s/) != -1){
		$("#check_Cpresid").html("공백이 입력되었습니다");
		$("#check_Cpresid").css('color','red');
	}else if(ci2Check < 0){
		$("#check_Cpresid").html("1~4값을 입력해주세요");
		$("#check_Cpresid").css('color','red');
	}else{
		$("#check_Cpresid").html("전화번호를 입력해주세요")
		$("#check_Cpresid").css('color','green');
	}
}
//전화번호 오토하이픈
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
//전화번호 정규식검사
function CptelCheck(){
	var cp = $("#cpy_tel").val();
	var cpCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(cpCheck.test(cp) === true){
		$("#check_Cptel").html("사용가능한 번호입니다.");
		$("#check_Cptel").css('color','green');
	}else{
		$("#check_Cptel").html("사용할 수 없는 번호입니다.");
		$("#check_Cptel").css('color','red');
	}
}

//이메일 유효성 검사 및 메일인증버튼 활성화
function email_vc(){ 
	var emailVc = document.getElementById('cpy_email').value;
	var eCheck_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var button = document.querySelector(".email_auth_btn");
	button.disabled = true;
	if(eCheck_rule.test(emailVc) === true){
		$("#email_vc").html("메일인증을 눌러주세요!");
		$("#email_vc").css('color','green');
		button.disabled = false;
	}else{
		$("#email_vc").html("");
		button.disabled = true;
	}
	
} 

var email_auth_cd = ''; 

$(".email_auth_btn").click(function(){
	var email = $('#cpy_email').val();
	var data = {email : email}
		$.ajax({
			type : 'POST' ,
		   	url : '<%=path%>/join/duplicateCheck4',
		   	async : false ,
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result != 'true') {
					alert("중복된 이메일입니다.");
				}else if(result == 'true'){
					$.ajax({
						type : "POST",
						url : "<%=path%>/join/emailAuth",
						async : false ,
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
			}
		});
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
		alert("id는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")
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
	var cn = $("#cpy_name").val();
	var cnCheck = /^[가-힣]{2,6}$/;
	if(cn == ""){
		alert("대표자 성명을 입력해주세요.")
		return false;
	}else if(!cnCheck.test(cn)){
		alert("사용할 수 없는 이름입니다.")
		return false;
	}	
	//사업자번호 중복확인
	var lengthCpnum = document.getElementById('cpy_cpnum').value;
	var CpnumCheck = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
	var memberCpnum = $('#cpy_cpnum').val();
	var data = {memberCpnum : memberCpnum}
	var return_fs = "";
	
	if (!CpnumCheck.test(memberCpnum)) {
		alert("숫자 10자리로 구성되어야 합니다.")
		return false;
	}else {
		$.ajax({
		    type : 'post' ,
	   	    url : '<%=path%>/join/CpnCheck',
	   	 	async : false ,
			data : data,
			dataType : 'text',
			success : function(result) {
				if (result != 'true') {
					alert("중복된 사업자번호입니다.")
					return_fs = "returnp";
				}
			}
		});
		if(return_fs == "returnp"){
			return false;
		}
	}
	//주민등록번호 앞자리 정규식검사
	var ci1 = $("#cpy_resid1").val();
	var ci1Check = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/;
	if(!ci1){
		alert("주민등록번호 값을 입력해 주세요.");
		return false;
	}else if(!ci1Check.test(ci1)){
		alert("형식에 맞지 않습니다.");
		return false;
	}
	//주민등록번호 뒷자리 정규식검사
	var ci2 = $("#cpy_resid2").val();
	var ci2Check = ci2.search(/[1-4]/g);
	if(!ci2){
		alert("주민등록번호 값을 입력해 주세요.");
		return false;
	}else if(ci2Check < 0){
		alert("주민등록번호 뒷자리 1~4값을 입력해주세요.");
		return false;
	}	
	//핸드폰 번호 정규식
	var cp = $("#cpy_tel").val();
	var cpCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(!cp){
		alert("핸드폰 번호를 입력해주세요.")
		return false;
	}else if(!cpCheck.test(cp)){
		alert("사용할 수 없는 핸드폰 번호입니다.")
		return false;
	}
	//이메일주소 정규식 검사
	var emailVc = document.getElementById('cpy_email').value;
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