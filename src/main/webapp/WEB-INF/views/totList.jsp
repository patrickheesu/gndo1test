<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<script>
</script>

<style>

.all_list{
	margin: 0 auto;
	width:1300px;
	
}
.hotle_title{
	margin-left: 35px;
}
.louge_list{
	float: left;
	margin: 40px 0 0 30px;
}
.louge_list img {
	border-radius: 20px;
	width: 17rem;
	height: 17rem;
}
.card-body{
float: right;
	margin-top: 15px;
	margin-right: 10px;
	text-decoration: none;
	color: #333;
}
.card-text {
	float: right;
	margin-top: 5px;
	
}
.card-text_1{
	margin-top: 5px;
	float: right;
}

.text-muted{
	float: right;
	margin-right: 5px;
}
small{
right: 0;
}

</style>
<script>
ratingToPercent() {
    const score = +this.restaurant.averageScore * 20;
    return score + 1.5;
}
</script>


<div class="all_list">

<table id="">
<tr>
	<td>
		
		<!-- 타이틀 -->
		<div class="hotle_title"><h1 style="font-style: italic;">#${cptype }</h1></div>
		
		<c:forEach items="${search}" var="search">
			<div class="louge_list" style="width: 17rem;">
				<a href="htdetail?acc_num=${search.acc_num }">
		  			<img src="resources/upload/${search.ai.acci_afterimg}" class="card-img-top" alt="${search.ai.acci_afterimg}">
		  			<div class="card-body">
		 		 		<h5 class="card-title">${search.acc_name}</h5>
		    			<p class="card-text">~ ${search.r.rt_price}원 부터</p>
		    			<p class="card-text_1"><small class="text-muted">(1박 기준)</small></p>
					</div>
				</a>
			</div>	
			<%-- ${search.r.rt_price}
			${search.i.acci_afterimg} --%>
		</c:forEach>
		
	</td>
</tr>

</table>
<p id="sentinel"></p>


</div>
</body>
</html>