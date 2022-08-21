<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/list/content.css?after">
<link rel="stylesheet" href="resources/css/list/style.css?after">
<link rel="stylesheet" href="resources/css/list/mainsilde.css?after">
</head>
<body>
<div id="contentbox">

	<div class="slider">

	<div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
        <c:forEach items="${aidto}" var="dto" varStatus="status">
      	<div class="mySlides fade">
        <div class="numbertext">${status.count} / ${fn:length(aidto) }</div>
        <img src="resources/upload/${dto.acci_afterimg}" style="width:100%">
       </div>
        </c:forEach>

	  <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>
	
    <!-- The dots/circles -->
    <div style="text-align:center">
    <c:forEach items="${arr_imggcnt }" var="imggcnt">
      <span class="dot" onclick="currentSlide(${imggcnt })"></span>
    </c:forEach>
    
    </div>
    	
    <SCript>
      var slideIndex = 0; //slide index

// HTML 로드가 끝난 후 동작
window.onload=function(){
  showSlides(slideIndex);

/*   // Auto Move Slide
   var sec = 5000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec); */ 
}


// Next/previous controls
function moveSlides(n) {
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}

// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

function showSlides(n) {

  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex = 0; n = 0;
  }else if (n < 0) {
    slideIndex = (size-1);
    n = (size-1);
  }

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[n].style.display = "block";
  dots[n].className += " active";
}

    </SCript>
		</div>

    <div class="leftinfo" style="position: absolute;">
		<div class="housename"><!-- 호텔 이름 -->  ${cdto.acc_name} </div>
			${cdto.acc_map} 
			<div class="rating">별점[${avr }/5] 전체 리뷰 ${recnt }개</div>
			
                <div class="wrap-star">

                    <div class="star-rating">
                    
                        <span style="width:${avr_star}%;"></span>
                      
             </div>
                </div>
				<div id="map" style= "width: 530px; height: 280px; clear: both;" >
					
			</div>
	</div>
       <div class="housetab">
			<input id="tab1" type="radio" name="tabs" checked=""><label for="tab1">객실정보</label>
			<input id="tab3" type="radio" name="tabs"> <label for="tab3">숙소정보</label>
			<input id="tab4" type="radio" name="tabs"> <label for="tab4">리뷰</label>
			<input id="tab5" type="radio" name="tabs"> <label for="tab5">판매자정보</label>

            <section id="content1">

				<c:forEach items="${rdto}" var="dto">
					<div class="roompic">
						<img class="rp1" src="resources/upload/${dto.room_img.rti_afterimg}" alt="${dto.room_img.rti_afterimg}">
						<div class="roomname">${dto.rt_rmname }</div>
						<div class="roompp">기준${dto.rt_rpeople }인</div>
						<div class="rprice">가격 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${dto.rt_price }원~

						</div>
						<c:choose>
							<c:when test="${mem_num ne null }">
								<a href="reserve?rt_num=${dto.rt_num }&mem_num=${mem_num}">
								
								<button class="rbutton">객실상세보기</button></a>
							</c:when>
							<c:when test="${mem_num eq null }">

								<a href="login"><button class="rbutton"
										onclick="reservebtn()">객실상세보기</button></a>
							</c:when>
							
						</c:choose>
					</div>
					
				</c:forEach>
<script>
function reservebtn(){
	alert("로그인을 해주세요");
}
</script>
				<!--                 <div class="roompic"> -->
				<!--                     <img class="rp1" src="resources/img/list/roomslide01.jpg" alt=""> -->
				<!--                     <div class="roomname"> -->
				<!--                         방이름 -->
				<!--                     </div> -->
				<!--                     <div class="roompp"> -->
				<!--                         기준 2인 -->
				<!--                     </div> -->
				<!--                     <div class="rprice"> -->
				<!--                         가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 150,000원 -->

				<!--                     </div> -->
				<!--                     <button class="rbutton">예약하기</button> -->
				<!--                 </div> -->

			</section>
      <script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b68dc7ba8e377d6cf7382dfa30dae95d&libraries=services"></script>
<script>
const mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${cdto.acc_la},${cdto.acc_lo}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

const map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
const markerPosition  = new kakao.maps.LatLng(${cdto.acc_la},${cdto.acc_lo}); 

// 마커를 생성합니다
 marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="width : 200px;">${cdto.acc_name} <br><a href="https://map.kakao.com/link/map/${cdto.acc_name},${cdto.acc_la},${cdto.acc_lo}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${cdto.acc_name},${cdto.acc_la},${cdto.acc_lo}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${cdto.acc_la},${cdto.acc_lo}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
           <section id="content3">
				<div class="hi"></div>
				<div class="hi2">
				
					<h3 style="white-space: pre-line;">
					<strong>숙소설명</strong> <BR>
					
					${cdto.acc_info}</h3>
			</div>
			</section>
			<section id="content4">
			
			<div class="review">
			    <div class="rating">별점[${avr }/5] 전체 리뷰 ${recnt }개</div>
			
                <div class="wrap-star">

                    <div class="star-rating">
                    
                        <span style="width:${avr_star}%;"></span>
                      
             </div>
			    <hr />
			  </div>
			  <c:forEach items="${Accdto }" var="dto">
			<c:choose>			 
			 <c:when test="${recnt eq 0 }">
			 리뷰가 없습니다.
			 </c:when>
			 <c:otherwise>
			 
			<div class="reviewtitle">
				<img class="reviewicon" style="width:50px" src="resources/img/mypage/company/reviewicon.png"/> 
				<strong>${dto.rv.rv_title }</strong>	
				<div class="reviewname">${dto.mem.mem_nickname }님 "${dto.r.rt_rmname }" 객실 이용/별점[${dto.rv.rv_grade }.0]
      			</div>
      			</div>
        		<br>
        	<div class="reviewtxt" style="white-space: pre-line;">${dto.rv.rv_content }</div>
        	<br />
        	<div> 
        	<img class="reviewimg" src="resources/upload/${dto.rvi.rvi_afterimg}" ><br />
         	 작성일 ${dto.rv.rv_date }
      		 </div>
     		  <hr />
			 </c:otherwise>
			 </c:choose>
			 </c:forEach>
			</div>
			</section>

			<section id="content5">
				<table class="content5table">
					<tr>
						<td>대표자명</td>
						<td>${cidto.cpy_name}</td>
					</tr>
					<tr>
						<td>상호명</td>
						<td> ${cdto.acc_name}</td>
					</tr>
					<tr>
						<td>사업자주소</td>
						<td> ${cdto.acc_map}${cdto.acc_detailmap }</td>
					</tr>
					<tr>
						<td>전자우편주소</td>
						<td>${cidto.cpy_email}</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${cidto.cpy_tel}</td>
					</tr>
					<tr>
						<td>사업자등록번호</td>
						<td>${cidto.cpy_cpnum}</td>
					</tr>
				

				</table>


			</section>
		</div>
	</div>
</body>
</html>