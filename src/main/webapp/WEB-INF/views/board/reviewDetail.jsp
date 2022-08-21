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
.reviewdetail{
	width:1200px;
	margin: 0 auto;
	text-align: center;

}
#detailimg img{
	height: 200px;
}
#satr-grade{
color: #3573c4;
}

.rvdetail th{
	width: 80px;
	background-color: #f6f6f6;
    position: static;
    text-align: left;
    padding-left: 20px;
    padding-right: 20px;
}
.rvdetail td{
	padding: 11px;
    box-sizing: border-box;
    vertical-align: middle;
    width:800px;
    text-align: left;
    }
    
.rvdetail th,.rvdetail td{
   	border-bottom: 1px solid #d9d9d9;
   
}
.bottombut{
	margin: 15px;
}
.rvtextcontent{
	width: 500px;
	word-break:break-all; 
}


</style>

<body>
<div class="reviewdetail">
<form action="review_detail" method="post">
<table class="rvdetail">
<tr>
	<th>번호</th>
	<td>${review_detail.rv_num }</td>
	
</tr>
<tr>
	<th>제목</th>
	<td><div id="rvdetail_img">${review_detail.rv_title }</div></td>

</tr>
<tr>
	<th>작성자</th>
	<td>${review_detail.mem.mem_nickname }</td>
</tr>
<tr>
	<th>객실명</th>
	<td>${review_detail.rt.rt_rmname }</td>
</tr>
<tr>
	<th>평점</th>
	<td id=satr-grade>
		<c:if test="${review_detail.rv_grade==1 }">★☆☆☆☆</c:if>
		<c:if test="${review_detail.rv_grade==2 }">★★☆☆☆</c:if>
		<c:if test="${review_detail.rv_grade==3 }">★★★☆☆</c:if>
		<c:if test="${review_detail.rv_grade==4 }">★★★★☆</c:if>
		<c:if test="${review_detail.rv_grade==5 }">★★★★★</c:if>
	</td>
</tr>

<c:forEach items="${rvimg}" var="dto">
	<tr>
		<th>이미지</th>
		<td id="detailimg"><img src="resources/upload/${dto.rvi_afterimg }" alt="${dto.rvi_afterimg }" /></td>
	</tr>
</c:forEach>

<tr>
	<th>내용</th>
	<td class="rvtextcontent">${review_detail.rv_content }</td>
</tr>
<tr>
	<th>날짜</th>
	<td>${review_detail.rv_date }</td>
</tr>

</table>
<button class="bottombut" ><a href="review">목록으로</a></button>

</form>


</div>
</body>
</html>