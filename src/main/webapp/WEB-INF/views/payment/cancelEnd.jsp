<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>예약·결제 취소 완료</title>
    <style>
        body{
            text-align: center;
        }
        .a{
            width: 400px;
            height: 400px;
            align-items: center;
        }
    </style>
   <link rel="stylesheet" href="resources/css/login/joinEnd.css">   
</head>
<body>
    <h3><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3><br>
    <h1>예약·결제 취소가 완료되었습니다</h1>
    <a href="./"><button class="button" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">메인으로 가기</button></a>
    <a href="mbpayment"><button class="button" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">결제 내역 보기</button></a>
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