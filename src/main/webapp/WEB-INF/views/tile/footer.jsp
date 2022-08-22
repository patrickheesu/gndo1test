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

    .logo{
   		 float:left;
    /*     margin: 10px 500px 0 20px; */
    }
    .ftable{
    	margin: 0 auto;
    	width: 1000px;
    	padding-top: 20px;
    }
   .ftable tr td .ftable tr th{
      	border-spacing: 10px;
        text-align: center;
        position: relative;
        left: 250px;
        margin-left: 300px;
        margin-top: 20px;
   }
   .ftable tr a{
      text-decoration: none;
      color: #333;
   }
    .ftable tr td{
        width: 160px;
}
</style>
<body>

   <a href="./"><img class="logo" src="resources/img/tileimg/로고1.png" alt="" width="150" height="140" ></a>
    <table class="ftable">
        <tr>
            <th>예약하기</th>
            <th>리뷰</th>
            <th>내정보</th>
            <th>고객센터</th>
            
        </tr>
        <tr>
            <td><a href="totList?cptype=hotel&typecode=1">호텔 예약</a></td>
            <td><a href="review">리뷰</a></td>
            <td><a href="">예약확인</a></td>
            <td><a href="">공지사항</a></td>
        </tr>
        <tr>
            <td><a href="totList?cptype=motel&typecode=2">모텔 예약</a></td>
            <td colspan="2"></td>
            <td><a href="">자주묻는 질문</a></td>
        </tr>
        <tr>
            <td><a href="totList?cptype=pension&typecode=3">펜션 예약</a></td>
        </tr>
        <tr>
            <td><a href="totList?cptype=guestHouse&typecode=4">게스트하우스 예약</a></td>
        </tr>
        <tr>
            <td><a href="totList?cptype=camping&typecode=5">캠핑 예약</a></td>
        </tr>
    </table>
</body>
</html>