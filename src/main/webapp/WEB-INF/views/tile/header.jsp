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
<title>Insert title here</title>
</head>
<style>
 	table .logo{ 
 		margin-right: 400px;

 	}
 	.ttable{
 		font-size: 25px;
 		height: 150px;
 	}
 	.login{
 		float: right;
 		font-size: 20px;
 		
 	}
 	.login a{
 		text-decoration: none;
 		color: #333;
 	}
	.ttable tr a{
		text-decoration: none;
		color: #333;
	}
	
</style>
<body>
 <table class="ttable">
        <tr>
            <td colspan="10"><a href="./"><img class="logo" src="resources/img/tileimg/로고1.png" alt="" width="150" height="150"></a></td>
		
            <td><a href="">예약</a></td>
            <td><a href="">게시판</a></td>
            <td><a href="">리뷰</a></td>
            <td><a href="">Q&A</a></td>
		<c:choose>
            <c:when test="${mem_num ne null }">      
                   <div class="login"><a href="mbPage">내정보</a> | <a href="logout">로그아웃.</a></div>
                </c:when>
                <c:when test="${cpy_num ne null }">
                   <div class="login"><a href="cpPage" >내정보</a> | <a href="logout">로그아웃</a></div>
                </c:when>
                <c:otherwise>
                   <div class="login"><a href="login">로그인</a> | <a href="join">회원가입</a></div>
                </c:otherwise>
         </c:choose>
        </tr>
    </table>
<hr / style="width: 1130px;
 		text-align: center; border-color: #ffffff;">
 		

</body>
</html>