<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.allabout{
margin-left: 10%;
margin-right: 10%;
}
.second1_div{
float: left;
width: 49%;
border: solid 1px red;
text-align: center;
}
.second2_div{
float: right;
width: 49%;
border: solid 1px blue;
text-align: center;
}

</style>

</head>
<body>
	<div class="allabout">
		<div class="second1_div">
		 	<h3>${mem_nickname }님의 리뷰</h3>
		 	<hr />
		 	<c:forEach items="${reviewDone}" var="dto">
		 		<div class="reviews">
		 			<!--a태그 주소는 해당 숙소 상세 페이지로 이동 dto.acc.acc_num model에 붙어있음-->
		 			<a href="#">숙소 이름 : ${dto.acc.acc_name} | 객실 이름 : ${dto.rt.rt_rmname} </a> <br /> 
		 			제목 : ${dto.rv_title } | 평점 : ${dto.rv_grade }점 | 작성 일자 : ${dto.rv_date } <br />
		 			내용 : ${dto.rv_content }
		 		</div>
		 	</c:forEach>
		</div>
		<div class="second2_div">
			<h3>리뷰를 작성해주세요 !</h3>
			<hr />
		 	<c:forEach items="${reviewNone}" var="dto">
		 		<div class="needToWrite">
		 			<!--a태그 주소는 리뷰쓰기 페이지로 이동 dto.acc.acc_num, dto.rt.rt_num, pay.pm_num model에 붙어있음
		 			 ?로 다 가져가서 쓰기 controller에서 getParameter 로 받아서 쓸 수 있음 -->
		 			<a href="#">
		 				${dto.acc.acc_name} / ${dto.rt.rt_rmname} <br />
		 				숙박 일자 : ${dto.rs_start } ~ ${dto.rs_end }
		 			</a>
		 		</div>	
		 	</c:forEach>
		</div>
		
	
	</div>
	
</body>
</html>