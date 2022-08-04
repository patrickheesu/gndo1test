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


    <form name="join" action="joinMem" method="post">
        <table class="join">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="mem_id" id="id" placeholder="8자 이상"></td>
				<td>
					<input type="button" class="checkId_bt" value="중복 확인" onclick="duplicateCheck();" />
					<span id="check_id" class="check_id">*중복 확인 필수</span>
				</td>
            </tr>
            <tr>
                <td>비밀번호</td>
				<td><input type="password" name="mem_pwd" id="pwd1" placeholder="영문,숫자,특수문자를 포함" onkeyup="passwordCheck1();"></td>
				<td><span id="check_pwd" class="check_pwd">*비밀번호는 10자 이상</span></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="pwd2" placeholder="************"></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="mem_nickname" placeholder="닉네임 입력"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="mem_name" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                <select name="mem_gender" id="gender" class="gender">
                    <option value="man">남자</option>
                    <option value="woman">여자</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input class="date" type="date" name="mem_birth">
                </td>
            </tr>
            <tr>
                <td>핸드폰 번호</td>
                <td>
                    <input type="text" name="mem_phonenum" placeholder="010********">
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" name="zipcode" id="zipcode" placeholder="우편주소 검색" onclick="findAddr()" readonly><br>
                    <input type="text" name="mem_addr1" id="address1" readonly placeholder="주소"><br>
                    <input type="text" name="mem_addr2" id="address2" placeholder="상세주소 입력">
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="email" name="mem_email" placeholder="email@gmail.com">
                </td>
            </tr>
        </table>
        <input class="join2" type="submit" value="가입하기">
    </form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><script>

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
</script>
    
</body>
</html>