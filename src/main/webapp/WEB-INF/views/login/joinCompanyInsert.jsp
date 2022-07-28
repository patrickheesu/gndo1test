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
<style>
body {
	text-align: center;
}

.a {
	width: 200px;
	height: 200px;
	align-items: center;
}
</style>

<link rel="stylesheet" href="../resources/css/joinMembersInsert.css">
</head>
<body>
	<h3>
		<img class="a" src="../resources/img/강릉도원 로고.png" alt="">
	</h3>
	<br>


	<form name="join" action="joinCpy" method="post">
		<table class="join">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="cpy_id" id="id" placeholder="8자 이상"></td>
				<td>
					<input type="button" class="checkId_bt" value="중복 확인" onclick="duplicateCheck();" />
					<span id="check_id" class="check_id">*중복 확인 필수</span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="cpy_pwd" id="pwd1" placeholder="영문,숫자,특수문자를 포함" onkeyup="passwordCheck1();"></td>
				<td><span id="check_pwd" class="check_pwd">*비밀번호는 10자 이상</span></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwd2" placeholder="************"></td>
			</tr>
			<tr>
				<td>대표자 성명</td>
				<td><input type="text" name="cpy_name" placeholder="대표자 성명 입력"></td>
			</tr>
			<tr>
				<td>사업자 번호</td>
				<td><input type="text" name="cpy_cpnum" placeholder="사업자 번호 입력"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td>
					<input type="text" name="cpy_resid1" placeholder="앞자리 6자리 입력">
					<br> <input type="password" name="cpy_resid2" placeholder="*******">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td><input type="text" name="cpy_tel" placeholder="010********"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="cpy_email" id="userEmail" onkeyup="email_vc();" placeholder="email@gmail.com"></td>
				<td><span id="email_vc" class="email_vc">아아</span></td>
				<td>
					<input type="button" class="checkEmail_bt" value="중복 확인" onclick="" />
					<span id="check_email" class="check_email">*중복 확인 필수</span>
				</td>
			</tr>
			<tr>
				<td>사업장 종류</td>
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
		<input class="join2" type="submit" value="가입하기">
	</form>
	
	<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
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

function duplicateCheck() { // 아이디 검사 함수
	
	var lengthId = document.getElementById('id').value;
	var memberId = $('#id').val();
	var data = {memberId : memberId}
	
	if (lengthId.length < 8) {
		$("#check_id").html("아이디는 8자 이상이여야 합니다");
		$("#check_id").css('color' , 'red'); 
	} else {
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

function passwordCheck1(){ //비밀번호 검사 함수
	var pwd1 = document.getElementById('pwd1').value;
	var check_rule = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{10,}$"
	if (pwd1.length > 9) {
		$("#check_pwd").html("사용 가능한 비밀번호입니다");
	} else {
		$("#check_pwd").html("*비밀번호는 10자 이상");
	}
}

function email_vc(){ //이메일 유효성 검사
	var emailVc = document.getElementById('userEmail').value;
	var eCheck_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if(eCheck_rule.test(emailVc) === true){
		$("#email_vc").html("중복확인을 눌러주세요!");
	}else{
		$("#email_vc").html("");
	}
	
}

	</script>

</body>
</html>