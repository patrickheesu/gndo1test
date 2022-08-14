<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
	#headingOne{
		padding: 30px;
	}
	#contentaccor{
		padding-left: 30px;
	}
	#htitle{
		text-align: center;
		margin-top: 300px;
		color: blue;
	}
</style>
</head>
<body>

		<h1 style="text-align: center;">예약·결제 내역 리스트</h1>
		<c:choose>
		<c:when test="${paycheck eq 0 }">
			<h1 id="htitle">예약 · 결제 내역이 없습니다.</h1>
		</c:when>
		<c:otherwise>
<div id="accordionpadding">
	<div class="accordion" id="accordionExample">
      <div class="accordion-item">
            <c:forEach items="${rdto }" var="dto" varStatus="status">
        <h2 class="accordion-header" id="headingOne">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#s${status.count }" aria-expanded="true" aria-controls="collapseOne">
          <strong>예약자 이름</strong> : ${dto.rs_name }  &nbsp;&nbsp;&nbsp;   <strong>결제 일시</strong> : ${dto.pay.pm_date }
          </button>
        </h2>
        <div id="s${status.count }" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body" id="contentaccor">
	            <h3>결제 내역</h3> <br />
	<li><b>예약 객실명</b> : ${dto.rt.rt_rmname } </li>
	<li><b>예약 가격</b> : ${dto.rt.rt_price }원 </li>
	<li><b>체크인 시간</b> : ${dto.rt.rt_in } </li>
	<li><b>체크아웃 시간</b> : ${dto.rt.rt_out } </li>
	<li><b>숙박 시작일</b> : ${dto.rs_start } </li>
	<li><b>숙박 종료일</b> : ${dto.rs_end }</li>
	<li><b>예약 인원수</b> : ${dto.rs_people }</li>
	<li><b>예약자 이름</b> : ${dto.rs_name }</li>
	<li><b>예약자 휴대폰번호</b> : ${dto.rs_pnum }</li>
	<li><b>결제일시</b> : ${dto.pay.pm_date }</li>
	<li><b>결제방식</b> : ${dto.pay.pm_type }</li>
          </div>
        </div>
        </c:forEach>
      </div>      
    </div>
    </div>
    </c:otherwise>
    </c:choose>
</body>
</html>