<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage_mp.css" />
<title>Insert title here</title>
</head>
<body>

<div class="mypage">
   <div class="mypage_body">
      <div class="user">
         <div class="user_tab">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/mypage/user_icon.png" width="80px" height="80px" id="user_icon"/></a>
            <div class="usertext">${cpy_name }<small style="font-size:20px;">님</small></div>
            <div class="user_setting">
               <a href="#">내 사업장 수정 ></a>
            </div>
         </div>
      </div>
   
         <div class="mypage_button">
         <div class="box bg-1">
           <a href="cpinsert" title="Button fade blue/green" class="button btnFade btnBlueGreen">사업장 등록</a>
           <a href="htDetail" title="Button fade blue/green" class="button btnFade btnBlueGreen">내 사업장 관리</a>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen">예약 및 결제 현황</a>
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
   
   
   
   
   
   </div>
</div>

</body>
</html>