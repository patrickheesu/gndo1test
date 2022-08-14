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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js">
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(function(){
    $('#datepicker1, #datepicker2').datepicker({
    });
 });
</script>

</head>
<body>
   
    <script>
        //슬라이더 이미지
        slider[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 2000); // Change image every 2 seconds

        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
            autoplay: {
        	    delay: 3000}
        }


        // 달력
        $(function() {
            //input을 datepicker로 선언
            $("#datepicker1, #datepicker2").datepicker({
                dateFormat: 'yy-mm-dd' //달력 날짜 형태
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                ,changeYear: true //option값 년 선택 가능
                ,changeMonth: true //option값  월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                ,buttonText: "선택" //버튼 호버 텍스트              
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            });                    
            
            //초기값을 오늘 날짜로 설정해줘야 합니다.
            $('#datepicker1, #datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
        });
     </script>

     <script>
     //체크인 체크아웃
        // 클릭 카운트
        // 결과 출력

        function count(type)  {
        // 결과를 표시할 element
        const resultElement = document.getElementById('result1');
        
        // 현재 화면에 표시된 값
        let number = resultElement.innerText;
        
        // 더하기/빼기
        if(type === 'plus1') {
            number = parseInt(number) + 1;
        }else if(type === 'minus1')  {
            number = parseInt(number) - 1;
            if (number<0)
                number=0;
        }

        resultElement.innerText = number;
        }
        // 클릭 카운트
        // 결과 출력
        function count1(type)  {
        // 결과를 표시할 element
        const resultElement = document.getElementById('result2');
        
        // 현재 화면에 표시된 값
        let number = resultElement.innerText;
        
        // 더하기/빼기
        if(type === 'plus2') {
            number = parseInt(number) + 1;
        }else if(type === 'minus2')  {
            number = parseInt(number) - 1;
            if (number<0)
                number=0;
        }
        // 결과 출력
        resultElement.innerText = number;
        }

     </script>
        <div class="clear"></div>
        <div id="wrap">			
            <div class="slider">
                <input type="radio" name="slide" id="slide1" checked>
                <input type="radio" name="slide" id="slide2">
                <input type="radio" name="slide" id="slide3">
                <input type="radio" name="slide" id="slide4">
                <input type="radio" name="slide" id="slide5">
                <ul id="imgholder" class="imgs">
                    <li class="item"><img src="resources/img/main/main_1.jpg"></li>
                    <li class="item"><img src="resources/img/main/main_2.jpg"></li>
                    <li class="item"><img src="resources/img/main/main_3.jpg"></li>
                    <li class="item"><img src="resources/img/main/main_4.jpg"></li>
                    <li class="item"><img src="resources/img/main/main_5.jpg"></li>
                </ul>
                <div class="bullets">
                    <label for="slide1">&nbsp;</label>
                    <label for="slide2">&nbsp;</label>
                    <label for="slide3">&nbsp;</label>
                    <label for="slide4">&nbsp;</label>
                    <label for="slide5">&nbsp;</label>
                </div>
        	<script src="slide.js"></script>
            </div>
        </div>
        <div class="clear"></div>
        <div id="search">
       
            <div id="checkin">
            <button class="btn btn-outline-secondary" type="button">체크인 <input type="text" id="datepicker1"></button>
            </div>
            <div id="checkout">
            <button class="btn btn-outline-secondary" type="button">체크아웃 <input type="text" id="datepicker2"></button>
             </div>
        <div id="adult">
            <input type='button'onclick='count("plus1")' value='+'/>
            <input type='button'onclick='count("minus1")'value='-'/>
            성인<div id='result1'>0</div>
        </div>
        <div id="child">
            <input type='button'onclick='count1("plus2")' value='+'/>
            <input type='button'onclick='count1("minus2")'value='-'/>
            아동<div id='result2'>0</div>
        </div>
        <form action="totList" method="post">
        <div id="search2">
        
        <input type="text" name="sk" class="form-control" placeholder="키워드를 입력하세요." aria-label="Example text with two button addons" style="width: 300px; height: 40px;">

        <input type="submit" value="검색"  />
        </div>
        </form>

        </div>

        <div id="submenu">
  <!-- 아이콘 이미지 삽입 -->
	  		<div id="submenu_icon">
		        <a href="htList"><img src="resources/img/main/hotel.png" style="width:100px; heigth:100px;" alt=""></a>
		        <a href="resources/motel/mtList.jsp"><img src="resources/img/main/motel.png" style="width:100px; heigth:100px;" alt=""></a>
		        <a href="resources/pension/psList.jsp"><img src="resources/img/main/pension.png" style="width:105px; heigth:105px;" alt=""></a>
		        <a href="resources/guestHouse/ghList.jsp"><img src="resources/img/main/guesthouse.png" style="width:100px; heigth:100px;" alt=""></a>
		        <a href="resources/camping/cpList.jsp"><img src="resources/img/main/camping.png" style="width:100px; heigth:100px;" alt=""></a>
	        </div>
        </div>
      

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
					    					<p class="card-text_1"><small class="text-muted">(1박 기준)</small></p>
										</div>
									</a>
								</div>
                			</tr>
            			</c:forEach>
            </table>
        </div>
        </c:if>
        
        <div id="sale">
            <h2 style="margin-bottom: 30px;">오늘의 특가!</h2>
                <div id="saleimg">   <!-- 특가 배너 이미지 -->
                    <a href="#"><img src="resources/img/main/banner1.png" alt="sale1"></a>
                    <a href="#"><img src="resources/img/main/banner2.png" alt="sale2"></a>
                    <a href="#"><img src="resources/img/main/banner3.png" alt="sale3"></a>
                    <a href="#"><img src="resources/img/main/banner4.png" alt="sale4"></a>
                    <a href="#"><img src="resources/img/main/banner5.png" alt="sale5"></a>
                </div>
        </div>
	</div>
        <div id="remap">
        <div id="remap_sub">
            <h2>권역별 추천 숙박</h2>
        <div id="remapcom">
            <div id="coment">
                <div id="coment_img" style="position: relative; float: left;">
                    <img src="resources/img/main/map_main.png" id="image">
            </div>
         </div>
    </div>
                <div id="coment2">
                <button onclick="changeimg(1)">주문진권</button>
                <button onclick="changeimg(2)">대관령권</button>
                <button onclick="changeimg(3)">시내권</button>
                <button onclick="changeimg(4)">경포권</button>
                <button onclick="changeimg(5)">정동진·옥계권</button>
            </div>
        
		<div class="section">
		<input type="radio" name="slide1" id="slide01" checked>
		<input type="radio" name="slide1" id="slide02">
		<input type="radio" name="slide1" id="slide03">
	<div class="slidewrap">
		<ul class="slidelist">
			<li>
				<a><img src="resources/img/main/slide01.jpg"></a>
			</li>
			<li>
				<a><img src="resources/img/main/banner1.png"></a>
			</li>
			<li>
				<a><img src="resources/img/main/slide03.jpg"></a>
			</li>
		</ul>
		<div class="bullets">
              <label for="slide01">&nbsp;</label>
              <label for="slide02">&nbsp;</label>
              <label for="slide03">&nbsp;</label>
       </div>

	</div>
	</div>
	</div>
</div>
    <script>
        function changeimg(n){
            document.getElementById("image").src="resources/img/main/map_"+n+".png";
        }
    </script>
</body>
</html>
