<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GANGNENGDOWON</title>
    <link rel="stylesheet" href="resources/css/main/gmain.css">
    <link rel="stylesheet" href="resources/css/main/style.css">
    <link rel="stylesheet" href="resources/css/main/recom.css">
    
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script anguage="JavaScript" type="text/JavaScript" ></script>

<script>
var slideIndex = 0; //slide index

//HTML 로드가 끝난 후 동작
window.onload=function(){
showSlides(slideIndex);

// Auto Move Slide
var sec = 3000;
setInterval(function(){
 slideIndex++;
 showSlides(slideIndex);
}, sec);
}

//Next/previous controls
function moveSlides(n) {
slideIndex = slideIndex + n
showSlides(slideIndex);
}

//Thumbnail image controls
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

</script>

</head>
<body>
<div class="clear"></div>
<div id="wrap">	
	<div id="search">
        <form action="totList?cptype=통합검색&typecode=0" method="post">
        	<div id="search2">
        		<input type="text" name="sk" class="form-control" placeholder="어디로 떠나시나요? 지역,숙소명,키워드로 찾아보세요!" aria-label="Example text with two button addons" style="width: 800px; height: 40px;">
        		<input type="submit" value="검색"  />
        	</div>
        </form>
    </div>	
    <div id="submenu">
  <!-- 아이콘 이미지 삽입 -->
	  	<div id="submenu_icon">
		      <a href="totList?cptype=hotel&typecode=1"><img src="resources/img/main/hotel.png" style="width:100px; heigth:100px;" alt=""></a>
		      <a href="totList?cptype=motel&typecode=2"><img src="resources/img/main/motel.png" style="width:100px; heigth:100px;" alt=""></a>
		      <a href="totList?cptype=pension&typecode=3"><img src="resources/img/main/pension.png" style="width:105px; heigth:105px;" alt=""></a>
		      <a href="totList?cptype=guestHouse&typecode=4"><img src="resources/img/main/guesthouse.png" style="width:100px; heigth:100px;" alt=""></a>
		      <a href="totList?cptype=camping&typecode=5"><img src="resources/img/main/camping.png" style="width:100px; heigth:100px;" alt=""></a>
	     </div>
    </div>
	<div class="slideshow-container">
		<!-- Full-width images with number and caption text -->
	      <div class="mySlides fade">
	        <img src="resources/img/main/main_1.jpg" style="width:100%">
	      </div>
	
	      <div class="mySlides fade">
	        <img src="resources/img/main/main_2.jpg" style="width:100%">
	      </div>	
	      <div class="mySlides fade">
	        <img src="resources/img/main/main_3.jpg" style="width:100%">
	      </div>
	      <div class="mySlides fade">
	        <img src="resources/img/main/main_4.jpg" style="width:100%">
	      </div>
	
	      <div class="mySlides fade">
	        <img src="resources/img/main/main_5.jpg" style="width:100%">
	      </div>
	</div>
	    <br/>
    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(0)"></span>
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
      <span class="dot" onclick="currentSlide(4)"></span>
      <span class="dot" onclick="currentSlide(5)"></span>
    </div>
</div>
<div class="clear"></div>
<div id="front">
	<c:if test="${adto ne null }">
        <div id="recommend">
            <h2>${age }대 HOT 5 숙소 !</h2>
            <table id="recom_table">
            			<c:forEach items="${adto }" var="adto">
            				<tr>
								<div class="main_rclist" style="width: 17rem;">
									<a href="#">
					  					<img src="resources/upload/${adto.ai.acci_afterimg}" class="card-img-top" alt="${adto.ai.acci_afterimg}">
					  					<div class="card-body">
					  						<h5 class="card-title">${adto.acc_name }</h5>
					    					<p class="card-text">${adto.r.rt_price }</p>
					    					<p 
					    					
					    					class="card-text_1"><small class="text-muted">(1박 기준)</small></p>
										</div>
									</a>
								</div>
                			</tr>
            			</c:forEach>
            </table>
        </div>
        </c:if>
	</div>
<div id="remap">
    <div id="remap_sub">
    	<h2 id="remaptitle">권역별 추천 숙박</h2>
    	<div id="remapcom">
            <div id="coment">
                <div id="coment_img" style="position: relative; float: left;">
                    <img src="resources/img/main/map_main.png" id="image">
            	</div>
        	 </div>
    	</div>
	    <div id="coment2">
	       <button class="btn01" onclick="changeimg1()">주문진권</button>
	       <button class="btn01" onclick="changeimg2()">대관령권</button>
	       <button class="btn01" onclick="changeimg3()">시내권</button>
	       <button class="btn01" onclick="changeimg4()">경포권</button>
	       <button class="btn01" onclick="changeimg5()">정동진·옥계권</button>
	    </div>
		<div class="bottommap">
			<div class="section" id="sectiondiv1">
				<input type="radio" name="slide1" id="slide01" checked>
				<input type="radio" name="slide1" id="slide02">
				<input type="radio" name="slide1" id="slide03">
				
				<div class="slidewrap">
					<ul class="slidelist">
						<li>
							<a><img src="resources/img/main/j_1.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/j_2.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/j_3.jpg"></a>
						</li>
					</ul>
					<div class="bullets1">
			              <label for="slide01">&nbsp;</label>
			              <label for="slide02">&nbsp;</label>
			              <label for="slide03">&nbsp;</label>
			       </div>
				</div>
			</div>
			
			<div class="section" id="sectiondiv2">
				<input type="radio" name="slide1" id="slide001" checked>
				<input type="radio" name="slide1" id="slide002">
				<input type="radio" name="slide1" id="slide003">
				
				<div class="slidewrap2">
					<ul class="slidelist2" >
						<li>
							<a><img src="resources/img/main/dae_1.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/dae_2.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/dae_3.jpg"></a>
						</li>
					</ul>
					<div class="bullets2">
			              <label for="slide001">&nbsp;</label>
			              <label for="slide002">&nbsp;</label>
			              <label for="slide003">&nbsp;</label>
			       </div>
				</div>
			</div>
			
			<div class="section" id="sectiondiv3">
				<input type="radio" name="slide1" id="slide0001" checked>
				<input type="radio" name="slide1" id="slide0002">
				<input type="radio" name="slide1" id="slide0003">
				
				<div class="slidewrap3">
					<ul class="slidelist3">
						<li>
							<a><img src="resources/img/main/cen_1.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/cen_2.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/cen_3.jpg"></a>
						</li>
					</ul>
					<div class="bullets3">
			              <label for="slide0001">&nbsp;</label>
			              <label for="slide0002">&nbsp;</label>
			              <label for="slide0003">&nbsp;</label>
			       </div>
				</div>
			</div>
			<div class="section" id="sectiondiv4">
				<input type="radio" name="slide1" id="slide00001" checked>
				<input type="radio" name="slide1" id="slide00002">
				<input type="radio" name="slide1" id="slide00003">
				
				<div class="slidewrap4">
					<ul class="slidelist4">
						<li>
							<a><img src="resources/img/main/k_1.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/k_2.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/k_3.jpg"></a>
						</li>
					</ul>
					<div class="bullets4">
			              <label for="slide00001">&nbsp;</label>
			              <label for="slide00002">&nbsp;</label>
			              <label for="slide00003">&nbsp;</label>
			       </div>
				</div>
			</div>
			<div class="section" id="sectiondiv5">
				<input type="radio" name="slide1" id="slide000001" checked>
				<input type="radio" name="slide1" id="slide000002">
				<input type="radio" name="slide1" id="slide000003">
				
				<div class="slidewrap5">
					<ul class="slidelist5">
						<li>
							<a><img src="resources/img/main/ok_1.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/ok_2.jpg"></a>
						</li>
						<li>
							<a><img src="resources/img/main/ok_3.jpg"></a>
						</li>
					</ul>
					<div class="bullets5">
			              <label for="slide000001">&nbsp;</label>
			              <label for="slide000002">&nbsp;</label>
			              <label for="slide000003">&nbsp;</label>
			       </div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	     function changeimg1(){
	         document.getElementById("image").src="resources/img/main/map_1.png";
	         document.getElementById("sectiondiv1").style.display = "block";
	         document.getElementById("sectiondiv2").style.display = "none";
	         document.getElementById("sectiondiv3").style.display = "none";
	         document.getElementById("sectiondiv4").style.display = "none";
	         document.getElementById("sectiondiv5").style.display = "none";
		     }
	     function changeimg2(){
	         document.getElementById("image").src="resources/img/main/map_2.png";
	         document.getElementById("sectiondiv2").style.display = "block";
	         document.getElementById("sectiondiv1").style.display = "none";
	         document.getElementById("sectiondiv3").style.display = "none";
	         document.getElementById("sectiondiv4").style.display = "none";
	         document.getElementById("sectiondiv5").style.display = "none";
		     }  
	     function changeimg3(){
	         document.getElementById("image").src="resources/img/main/map_3.png";
	         document.getElementById("sectiondiv3").style.display = "block";
	         document.getElementById("sectiondiv1").style.display = "none";
	         document.getElementById("sectiondiv2").style.display = "none";
	         document.getElementById("sectiondiv4").style.display = "none";
	         document.getElementById("sectiondiv5").style.display = "none";
		     }
	     function changeimg4(){
	         document.getElementById("image").src="resources/img/main/map_4.png";
	         document.getElementById("sectiondiv4").style.display = "block";
	         document.getElementById("sectiondiv1").style.display = "none";
	         document.getElementById("sectiondiv2").style.display = "none";
	         document.getElementById("sectiondiv3").style.display = "none";
	         document.getElementById("sectiondiv5").style.display = "none";

		     }  
	     function changeimg5(){
	         document.getElementById("image").src="resources/img/main/map_5.png";
	         document.getElementById("sectiondiv5").style.display = "block";
	         document.getElementById("sectiondiv1").style.display = "none";
	         document.getElementById("sectiondiv2").style.display = "none";
	         document.getElementById("sectiondiv3").style.display = "none";
	         document.getElementById("sectiondiv4").style.display = "none";
		     }  

    </script>
</body>
</html>
