<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이용약관</title>
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
    <link rel="stylesheet" href="resources/css/login/join.css">        
</head>
<body>
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
    <h3><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3><br>
     
    <a href="joinMembers"><button id="button" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">소비자</button></a>
    <a href="joinCompany"><button id="button" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">사업자</button></a>

</body>
</html>