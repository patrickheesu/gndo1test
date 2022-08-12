<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/mypage_mp.css" />
<title>Insert title here</title>
</head>
<body>
<div class="mypage">

   <div class="mypage_body">
      <div class="user">
         <div class="user_tab">
            <a href="#"><img src="resources/img/mypage/user_icon.png" width="80px" height="80px" id="user_icon"/></a>
            <div class="usertext">USER<small style="font-size:20px;">님</small></div>
            <div class="user_setting">
               <a href="#">내정보관리 ></a>
            </div>
         </div>
      </div>
   
         <div class="mypage_button">
         <div class="box bg-1">
           <a href="mbpayment" title="Button fade blue/green" class="button btnFade btnBlueGreen">내 결제내역</a>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen">나의 리뷰</a>
           <a href="#" title="Button fade blue/green" class="button btnFade btnBlueGreen">내 포인트</a>
         </div>
         </div>
         
           <div class="clear"></div>
      
            <div class="event">
               <!-- 라운드처리해주기 -->
                <a href=""><input id="mp_but_sub" type="image" src="resources/img/mypage/user_icon.png" width="490px" height="80px"></a>
                <a href=""><input id="mp_but_sub" type="image" src="resources/img/mypage/user_icon.png" width="490px" height="80px"></a>
            </div>
   
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