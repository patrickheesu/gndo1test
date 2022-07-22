<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <style>

        body{
            text-align: center;
        }
        .a{
            width: 200px;
            height: 200px;
        }
        .b{
            margin: auto;
            text-align: center;
        }



    </style>
    <link rel="stylesheet" href="resources/css/login/login.css">
</head>
<body>
    <h3><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3>
    <div>
    <table class="b">
        <tr>
            <td class="account">아이디</td>
            <td colspan="2"><input type="text" placeholder="Username" id="id" class="account2"></td>
        </tr>
        <tr>
            <td class="account">비밀번호</td>
            <td colspan="2"><input type="text" placeholder="********" id="password" class="account2"></td>
        </tr>
        

    </table>
    <input type="radio" class="radio" name="sort" id="member">
    	<label>소비자</label>
    <input type="radio" class="radio" name="sort" id="company">
    	<label>사업자</label> <br>
    <a href="main"><button id="button" style="margin-right: 5px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">로그인</button></a>
    <a href="join"><button id="button" style="margin-left: 10px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">회원가입</button></a>
    
    </div>
    <script>
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