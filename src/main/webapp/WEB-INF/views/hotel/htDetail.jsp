<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="resources/css/list/content.css">
  <link rel="stylesheet" href="resources/css/list/style.css">
</head>
<body>
<div id="contentbox">

        <div class="slider">
            <input type="radio" name="slide" id="slide1" checked>
            <input type="radio" name="slide" id="slide2">
            <input type="radio" name="slide" id="slide3">
            <input type="radio" name="slide" id="slide4">
            <ul id="imgholder" class="imgs">
                <li><img src="resources/img/list/slide01.JPG"></li>
                <li><img src="resources/img/list/slide02.JPG"></li>
                <li><img src="resources/img/list/slide03.JPG"></li>
                <li><img src="resources/img/list/slide04.JPG"></li>
            </ul>
            <div class="bullets">
                <label for="slide1">&nbsp;</label>
                <label for="slide2">&nbsp;</label>
                <label for="slide3">&nbsp;</label>
                <label for="slide4">&nbsp;</label>
            </div>

        </div>

        <div class="leftinfo" style="position: absolute;">
            <div class="housename">호텔 이름</div>

            <div class="score_cnt">
                <div class="rating">별점[0.0]</div>
                <div class="wrap-star">

                    <div class="star-rating">
                        <span style="width:80%"></span>
                    </div>
                </div>
            </div>
            <strong>숙소설명</strong>
            <div>호텔 소개 내용</div>
            <p class="address">호텔 주소</p>



        </div>
        <div class="housetab">
            <input id="tab1" type="radio" name="tabs" checked="">
            <!--디폴트 메뉴-->
            <label for="tab1">객실정보</label>

            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">숙소위치</label>

            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">숙소정보</label>

            <input id="tab4" type="radio" name="tabs">
            <label for="tab4">리뷰</label>

            <input id="tab5" type="radio" name="tabs">
            <label for="tab5">판매자정보</label>

            <section id="content1">

                    <c:forEach items="${rdto}" var="dto">
                <div class="roompic">
                    <img class="rp1" src="resources/img/list/roomslide01.jpg" alt="">
                    <div class="roomname">
                        ${dto.rt_rmname }                      
                    </div>
                    <div class="roompp">
                        기준${dto.rt_rpeople }인
                    </div>
                    <div class="rprice">
                        가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${dto.rt_price }원

                    </div>
                    <c:choose>
                    	<c:when test="${mem_num ne null }">
                    		<a href="reserve?rt_num=${dto.rt_num }&mem_num=${mem_num}"><button class="rbutton">예약하기</button></a>
                    	</c:when>
                    	<c:when test="${mem_num eq null }">
                    		
                    		<a href="login"><button class="rbutton" onclick="reservebtn()">예약하기</button></a>                    		
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
            <section id="content2">
                <div  id="map" style="width: 100%; height: 100%;" >
<!--                     <iframe -->
<!--                         src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.096949785333!2d126.89601171530919!3d37.48203847981374!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e15a9d09d3d%3A0xc6bd63de2a7fb0c7!2z6rWs7Yq47JWE7Lm0642w66-4!5e0!3m2!1sko!2skr!4v1658469581900!5m2!1sko!2skr" -->
<!--                         width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" -->
<!--                         referrerpolicy="no-referrer-when-downgrade"></iframe> -->
                </div>
<!--                 <div class="mapaddr"> -->
<!--                     구트아카데미<br> -->
<!--                     서울특별시 구로구 시흥대로163길 33 주호타워 2층,3층 -->
<!--                 </div> -->
               

            </section>
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a45464228f79ad52de13e4c48d3dc9d7&libraries=services"></script>
<script>
//지도 설정
const mapContainer = document.getElementById('map'),
	mapOption = { 
	    center: new kakao.maps.LatLng(37.6064791858348,129.068953110056),	// 지도의 중심 좌표(임의 설정)
	    level: 2					// 지도의 확대 레벨(임의 설정)
	};
    
//설정한 지도 생성
const map = new kakao.maps.Map(mapContainer, mapOption);

//마커 초기화(초기화 시 지도에 미리 지정 가능 : 카카오맵 API 문서 참조)
const marker = new kakao.maps.Marker();

//카카오맵 클릭 이벤트 추가
kakao.maps.event.addListener(map, 'click', (mouseEvent) => {
	//클릭한 위도, 경도 정보 불러오기
	const latlng = mouseEvent.latLng;
	var lat = latlng.getLat();
	var lng = latlng.getLng();
	
	//마커 위치를 클릭한 위치로 이동
	marker.setPosition(latlng);
	marker.setMap(map);
	alert(latlng);
	alert("위도 : "+ lat + " , 경도 : "+ lng);
});

</script>
            <section id="content3">
                <div class="hi">
                    
                </div>
                <div class="hi2">

                    <h3>주변정보</h3>
                    <ul>
                        <li>신사역 도보 5분</li>
                        <li>잠원한강공원 차량 6분</li>
                        <li>가로수길 도보 3분</li>
                    </ul>

                    <h3>기본정보</h3>
                    <ul>
                        <li>체크인 : 15:00 | 체크아웃 : 12:00</li>
                        <li>22시 이후 체크인 시 호텔 프론트 문의</li>
                        <li>무료 Wi-Fi</li>
                        <li>전 객실 금연</li>
                        <li>Bath Amenity (치약, 칫솔 무료)</li>
                        <li>주차 가능 (유료 / 1박 및 1대 당 15,000원 / 기계식 주차)</li>
                    </ul>

                    <h3>인원 추가 정보</h3>
                    <ul>
                        <li>디럭스 싱글, 디럭스 트윈, 프리미엄 원 킹베드, 프리미엄 원 킹베드 (욕조), 프리미엄 원 킹베드 (히노끼), 럭셔리 배스 스위트 : 기준 2인 / 최대 2인 투숙
                            가능</li>
                        <li>원 베드룸 스위트, 원 베드룸 스위트 럭셔리 배스, 그랜드 스위트, 로얄 스위트, 원 베드룸 스위트 객실 : 기준 2인 / 최대 3인 투숙 가능</li>
                        <li>인원추가 비용 없음 </li>
                        <li>단, 엑스트라베드 추가 시 1박당 55,000원 </li>
                        <li>현장결제</li>
                    </ul>

                    <h3>투숙객 혜택</h3>
                    <ul>
                        <li>피트니스 센터 무료 이용</li>
                        <li>객실 내 미니바 무료</li>
                    </ul>

                    <h3>부대시설 정보</h3>
                    <ul>
                        <li>피트니스센터/ 3층/ 24시간 / 운동복 및 운동화 등 개별 준비</li>
                        <li>공용 주방/ 2~15층/ 24시간</li>
                    </ul>

                    <h3>조식 정보</h3>
                    <ul>
                        <li>아마리오 / 로비층 / (월~금) 06:30~10:00, (토~일) 06:30~10:30</li>
                        <li>성인(만13세이상) 38,000원, 아동(48개월~만12세이하) 22,800원, 48개월 미만 무료</li>
                        <li>조식 현장 추가 결제</li>
                    </ul>

                    <h3>취소 및 환불 규정</h3>
                    <ul>
                        <li>체크인일 기준 1일전 18시까지 : 100% 환불</li>
                        <li>체크인일 기준 1일전 18시 이후~당일 및 No-show : 환불불가</li>
                        <li>취소, 환불 시 수수료가 발생할 수 있습니다</li>
                    </ul>

                    <h3>확인사항 및 기타</h3>
                    <ul>
                        <li>위의 정보는 호텔의 사정에 따라 변경될 수 있습니다</li>
                        <li>미성년자는 보호자 동반없이 이용이 불가합니다</li>
                        <li>이미지는 실제와 상이 할 수 있습니다</li>
                        <li>체크인 시 배정 또는 베드 타입 미기재 상품은 특정객실과 베드 타입을 보장하지 않습니다</li>
                        <li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    </ul>
                </div>




            </section>

            <section id="content4">



            </section>

            <section id="content5">
                <table class="content5table">
                    <tr>
                        <td>대표자명</td>
                        <td width="1000">홍정희</td>
                    </tr>
                    <tr>
                        <td>상호명</td>
                        <td>K모텔</td>
                    </tr>
                    <tr>
                        <td>사업자주소</td>
                        <td>서울시 구로구</td>
                    </tr>
                    <tr>
                        <td>전자우편주소</td>
                        <td>kjdj119@korea.kr</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>050350502486</td>
                    </tr>
                    <tr>
                        <td>사업자등록번호</td>
                        <td>1471100834</td>
                    </tr>


                </table>


            </section>
        </div>
    </div>
</body>
</html>