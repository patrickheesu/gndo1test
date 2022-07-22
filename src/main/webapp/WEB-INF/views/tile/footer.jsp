<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
        
        
    }
    .logo{
     	margin: 10px 500px 0 20px;
    }
	.ftable{
		border-spacing: 10px;
        text-align: center;
        position: relative;
        left: 250px;
        bottom: 140px;
        margin-left: 300px;
	}
	.ftable tr a{
		text-decoration: none;
		color: #333;
	}
	td{
        width: 160px;
}
</style>
<body>
<hr />
   <a href=""><img class="logo" src="resources/img/tileimg/로고1.png" alt="" width="150" height="140" ></a>
    <table class="ftable">
        <tr>
            <th><a href="">예약하기</a></th>
            <th><a href="">자유게시판</a></th> 
            <th><a href="">리뷰</a></th>
            <th><a href="">내정보</a></th>
            <th><a href="">고객센터</a></th>
            
        </tr>
        <tr>
            <td><a href="">호텔 예약</a></td>
            <td><a href="">자유게시판</a></td>
            <td><a href="">리뷰</a></td>
            <td><a href="">예약확인</a></td>
            <td><a href="">공지사항</a></td>
        </tr>
        <tr>
            <td ><a href="">모텔 예약</a></td>
            <td colspan="3"></td>
            <td><a href="">자주묻는 질문</a></td>
        </tr>
        <tr>
            <td><a href="">펜션 예약</a></td>
        </tr>
        <tr>
            <td><a href="">게스트하우스 예약</a></td>
        </tr>
        <tr>
            <td><a href="">캠핑 예약</a></td>
        </tr>
    </table>
</body>
</html>