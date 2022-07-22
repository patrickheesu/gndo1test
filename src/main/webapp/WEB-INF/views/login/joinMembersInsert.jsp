<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


    <form name="join" action="joinEnd" method="post">
        <table class="join">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="userId" placeholder="아이디 입력"></td>
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
                <td>이름</td>
                <td><input type="text" name="userName" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input class="date" type="date">
                <!-- <select name="year" id="">
                    <option value="">----선택----</option>
                    <option value="">2003년</option>
                    <option value="">2002년</option>
                    <option value="">2001년</option>
                    <option value="">2000년</option>
                    <option value="">1999년</option>
                    <option value="">1998년</option>
                    <option value="">1997년</option>
                    <option value="">1996년</option>
                    <option value="">1995년</option>
                    <option value="">1994년</option>
                    <option value="">1993년</option>
                    <option value="">1992년</option>
                    <option value="">1991년</option>
                    <option value="">1990년</option>
                    <option value="">1989년</option>
                    <option value="">1988년</option>
                    <option value="">1987년</option>
                    <option value="">1986년</option>
                    <option value="">1985년</option>
                    <option value="">1984년</option>
                </select>
                <select name="month" id="">
                    <option value="">--선택--</option>
                    <option value="">1월</option><option value="">2월</option>
                    <option value="">3월</option><option value="">4월</option>
                    <option value="">5월</option><option value="">6월</option>
                    <option value="">7월</option><option value="">8월</option>
                    <option value="">9월</option><option value="">10월</option>
                    <option value="">11월</option><option value="">12월</option>
                    
                </select>
                <select name="day" id="">
                    <option value="">--선택--</option>
                    <option value="">1일</option><option value="">2일</option>
                    <option value="">3일</option><option value="">4일</option>
                    <option value="">5일</option><option value="">6일</option>
                    <option value="">7일</option><option value="">8일</option>
                    <option value="">9일</option><option value="">10일</option>
                    <option value="">11일</option><option value="">12일</option>
                    <option value="">13일</option><option value="">14일</option>
                    <option value="">15일</option><option value="">16일</option>
                    <option value="">17일</option><option value="">18일</option>
                    <option value="">19일</option><option value="">20일</option>
                    <option value="">21일</option><option value="">22일</option>
                    <option value="">23일</option><option value="">24일</option>
                    <option value="">25일</option><option value="">26일</option>
                    <option value="">27일</option><option value="">28일</option>
                    <option value="">29일</option><option value="">30일</option>
                    <option value="">31일</option>
                </select> -->
                </td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="userNick" placeholder="닉네임 입력"></td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                <select name="gender" id="gender" class="gender">
                    <option value="">------선택------</option>
                    <option value="man">남자</option>
                    <option value="woman">여자</option>
                </select>
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
                <td>주소</td>
                <td>
                    <input type="text" name="zipcode" id="zipcode" placeholder="우편주소 검색" onclick="findAddr()" readonly><br>
                    <input type="text" name="address1" id="address1" readonly placeholder="주소"><br>
                    <input type="text" name="address2" id="address2" placeholder="상세주소 입력">
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
function OnMouseIn(elem){
    elem.style.border="2px solid blue";
    elem.style.color="blue";
}
function OnMouseOut(elem){
    elem.style.border="";
    elem.style.color="";
}
</script>
    
</body>
</html>