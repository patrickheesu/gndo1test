<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1 style="text-align: center;">예약·결제 취소</h1>
	<div  style="padding: 50px;">
    	<c:forEach items="${rdto}" var="dto">
    		<h2>예약·결제 정보</h2>
    		<table>
    	<tr><td><b>예약 업소명</b> : ${dto.acc.acc_name }</td></tr> 
		<tr><td><b>예약 객실명</b> : ${dto.rt.rt_rmname }</td></tr> 
		<tr><td><b>예약 가격</b> : ${dto.rt.rt_price }원 </td></tr>
		<tr><td><b>숙박 시작일</b> : ${dto.rs_start }</td></tr> 
		<tr><td><b>숙박 종료일</b> : ${dto.rs_end }</td></tr>
		<tr><td><b>예약 인원수</b> : ${dto.rs_people }</td></tr>
		<tr><td><b>예약자 이름</b> : ${dto.rs_name }</td></tr>
		<tr><td><b>예약자 휴대폰번호</b> : ${dto.rs_pnum }</td></tr>
		<tr><td><b>결제일시</b> : ${dto.pay.pm_date }</td></tr>
		<tr><td><b>결제방식</b> : ${dto.pay.pm_type }</td></tr>
		
		
		</table>
    	
    	</div>
    	<table>
    		<tr>
    			<td><b>취소 사유</b></td>
    			<td><textarea rows="10" cols="30" name="pc_reason" id="pc_reason"></textarea></td>
    		</tr>
    	</table>
    	<input type="button" onclick="cancel();" value="예약·결제 취소" />
 <script type="text/javascript">
 function cancel(){
	 var pc_reason = $("#pc_reason").val(); 
	 var pm_num = ${dto.pay.pm_num}
    location.href="cancelEnd?pm_num="+pm_num+"&pc_reason="+pc_reason;
 }
 	
 </script> 
 </c:forEach>  	
</body>
</html>