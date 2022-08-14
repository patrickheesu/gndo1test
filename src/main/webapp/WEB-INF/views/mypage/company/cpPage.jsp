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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage_mp.css" />
<title>Insert title here</title>

<style>
.cppopStyle {
opacity: 0;
display: none;
position: relative;
left: 100px;
width: auto;
border: 5px solid #fff;
padding: 20px;
background-color: #fff;
  
width: 400px;
height: 160px;
}
#cpcontent {
top:50px;
position: absolute;
}
#cppopup {
position: relative;
} 
</style>

</head>
<body>

<div class="mypage">
   <div class="mypage_body">
      <div class="user">
         <div class="user_tab">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/mypage/user_icon.png" width="80px" height="80px" id="user_icon"/></a>
            <div class="usertext">${cpy_name }<small style="font-size:20px;">님</small></div>
            <div class="user_setting">
               <a href="#" onclick="cpPwdCheck('cpy_info');">내 사업장 수정 ></a>
            </div>
         </div>
      </div>
   
         <div class="mypage_button">
         <div class="box bg-1">
           
           <c:choose>
           	<c:when test="${acccnt eq 1 }">
           	<a style="color: gray;" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="acc()">사업장 등록</a>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="cpPwdCheck('room_info');">객실 추가 등록</a>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="cpPwdCheck('reserve_info');">예약 및 결제 현황</a>
           </c:when>
           <c:otherwise>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="cpPwdCheck('acc_info');">사업장 등록</a>
           <a style="color: gray;" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="accin()">객실 추가 등록</a>
           <a style="color: gray;" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="accin()">예약 및 결제 현황</a>
           </c:otherwise>
           </c:choose>
         </div>
         </div>
         
           <div class="clear"></div>

         <div class="mypagebut_2">
            <div class="mypagebut_sub">
               <div class="mypage_title">고객센터</div>
               <div class="mypage_btu">
                 <a href="#" title="mp_but_sub1" class="but_sub btnF btnqa">자주묻는질문</a>
                 <a href="#" title="mp_but_sub1" class="but_sub btnF btnqa">1:1문의</a>
                 <a href="#" title="mp_but_sub1" class="but_sub btnF btnqa">공지사항</a>
                 </div>
              </div>
         </div>
         
   <div class="gndo1"><a href="">강릉숙박 정보</a></div>

   <div class="clear"></div>
   
   <div id="cppopup" class="cppopStyle">
		<div id="cpcontent" class="cpcontent" style="height: auto; width: auto;'">
			<b>비밀번호 확인</b> <br />
   				<div id="cppass1">
   					비밀번호 재입력 
   					<input type="password" id="cppassword"/><input type="button" value="확인" onclick="cpPassCheck();"/>
   					<input type="hidden" id="type"/>
   					<br />
   					</div>
   						· 외부로부터 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br />
   						· 항상 비밀번호는 타인에게 노출되지 않도록 주의하시기 바랍니다. <br />
					</div>
				</div>
   		</div>
	</div>
<script>
	function accin(){
		alert("사업장 등록을 먼저 해주세요");
	}	
	function acc(){
		alert("이미 사업장등록이 되어있습니다");
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script>
function cpPwdCheck(type) {
	console.log("pop");
	$("#type").val(type);
	$("#cppassword").val("");
	$("#cppopup").bPopup();
}
function cpPassCheck() {
	console.log("ajax");
	var msg = $("#type").val();
	console.log(msg);
	var password = $("#cppassword").val();
	$.ajax({
		type : 'post' ,
		url : '<%=path%>/myPage/cpPwdCheck' ,
		data : {password : password} ,
		dataType : 'text' , 
		success : function(result) {
			if (result == 'true') {
				console.log("ajax true");
				if (msg == 'cpy_info') {
					location.href='cpModify';
				} else if (msg == 'acc_info'){
					location.href='cpInsert';
				} else if (msg == 'room_info'){
					location.href='cpRoomAdd';
				} else if (msg == 'reserve_info'){
					location.href='cppayment';
				} else {
					console.log("nope");
				}
			} else if (result == 'false') {
				console.log("ajax false");
				alert('비밀번호가 일치하지 않습니다');
			} else {
				location.href='';
				alert('세션이 만료되어 로그아웃 되셨습니다');
			}
		}
	});
}
</script>
</body>
</html>