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
margin: 0 auto;
width:1000px;
height: 500px;
}
.second1_div{
float: left;
width: 46%;
text-align: center;
}
.second1_div h3{
	background-color: #f5f5f5;
}
.second2_div{
float: right;
width: 46%;
text-align: center;

}
.second2_div h3{
	background-color: #f5f5f5;
	background-size: 49% 5%;
}
a{
	text-decoration: none;
	color: #333;
}
a:hover{
	color: #F23005;
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
                <a href="htDetail?acc_num=${dto.acc.acc_num}">숙소 이름 : ${dto.acc.acc_name} | 객실 이름 : ${dto.rt.rt_rmname} </a> <br /> 
                제목 : ${dto.rv_title } | 평점 : ${dto.rv_grade }점 | 작성 일자 : ${dto.rv_date } <br />
                내용 : ${dto.rv_content }
                <hr />
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
                <a href="reviewInsert">
                   ${dto.acc.acc_name} / ${dto.rt.rt_rmname} <br />
                   숙박 일자 : ${dto.rs_start } ~ ${dto.rs_end }
                </a>
             </div>   
          </c:forEach>
      </div>
      
   
   </div>
   
</body>
</html>
