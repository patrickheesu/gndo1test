<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>사업자 회원가입</title>
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


<form name="join" action="joinEnd" method="post">
        <table class="join">
            <tr>
                <td>아이디</td>
                <td>
                	<input type="text" name="userId" placeholder="아이디 입력"> <br /> 
                	<input type="button" value="중복 확인" onclick="duplicateCheck(this.form);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userPass1" placeholder="************"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="userPass2" placeholder="************"></td>
            </tr>
            <tr>
                <td>대표자 성명</td>
                <td><input type="text" name="userName" placeholder="대표자 성명 입력"></td>
            </tr>
            <tr>
                <td>사업자 번호</td>
                <td><input type="text" name="companyNum" placeholder="사업자 번호 입력"></td>
            </tr>
            <tr>
                <td>사업장 이름</td>
                <td><input type="text" name="companyName" placeholder="사업장 이름 입력"></td>
            </tr>             
            <tr>
                <td>주민등록번호</td>
                <td><input type="text" name="IDNum" placeholder="앞자리 6자리 입력"> <br>
                    <input type="password" name="userPass2" placeholder="*******">
                </td>
            </tr>

            <tr>
                <td>핸드폰 번호</td>
                <td>
                    <input type="text" name="userPhone" placeholder="010********">
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="email" name="userEmail" placeholder="email@gmail.com">
                </td>
            </tr>
            <tr>
                <td>사업장 주소</td>
                <td>
                    <input type="text" name="zipcode" id="zipcode" placeholder="우편주소 검색" onclick="findAddr()" readonly><br>
                    <input type="text" name="address1" id="address1" readonly placeholder="주소"><br>
                    <input type="text" name="address2" id="address2" placeholder="상세주소 입력">
                </td>
            </tr>
            <tr>
                <td>사업장 종류</td>
                <td>
                    <input type="radio" name="radio" value="m" >
                    <label for="motel">모텔</label>
                    <input type="radio" name="radio" value="m" >
                    <label for="hotel">호텔</label> 
                    <input type="radio" name="radio" value="m" >
                    <label for="guesthouse">게스트하우스</label> <br>
                    <input type="radio" name="radio" value="m" >
                    <label for="pension">펜션</label>
                    <input type="radio" name="radio" value="m" >
                    <label for="camping">캠핑장</label>
                </td>
            </tr>
        </table>
        <!-- <input class="join2" type="submit" value="가입하기"> -->
    </form>
    <a href="joinEnd"><button class="button" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">가입하기</button></a>
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
function duplicateCheck(tf) {
	
}
</script>
    
</body>
</html>