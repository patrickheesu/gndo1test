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
<link rel="stylesheet" href="resources/css/mypage/mypage_mp.css" />
<title>Insert title here</title>
<style>
.popStyle {
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
#pcontent {
   top:50px;
   position: absolute;
}
#popup {
   position: relative;
} 

</style>
</head>
<body>
<!-- pwd check popup -->
<div class="mypage">

   <div class="mypage_body">
      <div class="user">
         <div class="user_tab">
            <a href="main"><img src="resources/img/mypage/user_icon.png" width="80px" height="80px" id="user_icon"/></a>
            <div class="usertext">${mem_nickname }<small style="font-size:20px;">님</small></div>
            <div class="user_setting">
               <a href="#" onclick="pwdCheck();">내정보관리 ></a>
				<div id="popup" class="popStyle">
					<div id="pcontent" class="pcontent" style="height: auto; width: auto;'">
						<b>비밀번호 확인</b> <br />
   						<div id="pass1">
   							비밀번호 재입력 
   							<input type="password" id="password"/><input type="button" value="확인" onclick="passCheck();"/>
   							 <br />
   							</div>
   						· 외부로부터 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br />
   						· 항상 비밀번호는 타인에게 노출되지 않도록 주의하시기 바랍니다. <br />
					</div>
				</div>
            </div>
         </div>
      </div>
   
         <div class="mypage_button">
         <div class="box bg-1">
           <a href="mbpayment" title="Button fade blue/green" class="button btnFade btnBlueGreen">내 결제내역</a>
           <a href="mbreview" title="Button fade blue/green" class="button btnFade btnBlueGreen">나의 리뷰</a>
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
   <div class="clear"></div>
   
   
   
   
   
   </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script>
function pwdCheck() {
	console.log("pop");
	$("#password").val("");
	$("#popup").bPopup();
}
function passCheck() {
	console.log("ajax");
	var password = $("#password").val();
	$.ajax({
		type : 'post' ,
		url : '<%=path%>/myPage/pwdCheck' ,
		data : {password : password} ,
		dataType : 'text' , 
		success : function(result) {
			if (result == 'true') {
				console.log("ajax true");
				location.href='mbModify';
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