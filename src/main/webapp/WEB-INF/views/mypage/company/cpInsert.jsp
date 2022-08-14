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
<title>숙소등록 페이지</title>
</head>
<style>
    body{
        text-align: center;
        margin: auto;
    }
    img{
        text-align: center;
        margin: auto;
        width: 150px;
        height: 150px;
    }
    table tr td{
        margin: 10px 0 0  10px;
    }
    #form{
       margin-left: 700px;   
       margin-right: 200px;
          
     
       text-align: left;
       /* float: left;      */
    }
    b #tcon{
    	min-width: 120px;
    }
</style>

<body>
<div class="logo"><img src="resources/img/mypage/company/로고1.png" alt="" width="150" height="150">
    <h1>업소등록</h1>
    <hr> <br>
    <form action="cpRoomInsert" id="form" method="post" onsubmit="return valueck();"  enctype="multipart/form-data">
    	<table>
    		<tr>
    			<td><b>업소명</b></td>
    			<td><input type="text" name="cpname" id="cpname"></td>
    		</tr>
    		<tr>
    			<td><b>주소</b></td>
    			<td><input type="text" readonly name="zipcode" id="zipcode" placeholder="우편번호" onfocus="this.placeholder=''" onblur="this.placeholder='우편번호'"><input type="button" onclick="addrsearch();" value="주소 검색"> <br />
            
             <input type="text" readonly  id="address1" name="address1" width="250;" > <br> 
           <!--  placeholder="도로명 주소 혹은 지번 주소 " onfocus="this.placeholder=''" onblur="this.placeholder='도로명 주소 혹은 지번 주소'" -->
             <input type="text" name="address2" id="address2" width="250;"  placeholder="상세 주소" onfocus="this.placeholder=''" onblur="this.placeholder='상세 주소'"> <br> </td>
    		</tr>
    		<tr>
  				
    			<td><input style="display: none;" type="text" name="lat" id="lat"  /><input style="display: none;" type="text" name="lng" id="lng" /></td>
<!--     			<td><input type="button" onclick="geoCoding();" /></td> -->
    		</tr>
    		<tr>
    			<td><b>지역</b></td> 
    			<td><select name="acc_location" id="location">
    			<option value="주문진권">주문진권</option>
    			<option value="대관령권">대관령권</option>
    			<option value="시내권">시내권</option>
    			<option value="경포권">경포권</option>
    			<option value="정동진·옥계권">정동진·옥계권</option>
    			</select></td>
    		
    			
    		</tr>
<!--     		<tr> -->
<!--     			<td><b>위도</b></td> -->
<!--     			<td><input type="text" value="위도값" /> &nbsp; <button onclick="addrl">추출</button></td> -->
<!--     		</tr> -->
<!--     		<tr> -->
<!--     			<td><b>경도</b></td> -->
<!--     			<td><input type="text" value="경도값" /></td> -->
<!--     		</tr> -->
    		<tr>
    			<td><b>유선 전화번호</b></td>
    			<td><input type="tel" id="acc_tel" maxlength='12' name="acc_tel" placeholder="ex)033-123-1234 " oninput="autoHyphen2(this)" onfocus="this.placeholder=''" onblur="this.placeholder='ex)033-123-1234'"></td>
    		</tr>
    		<tr>
    			<td><b>기본 정보</b></td>
    			<td><textarea name="acc_info" id="acc_info" rows="10" cols="30"></textarea></td>
    		</tr>
    		<tr>
    			<td><b>검색키워드</b></td>
    			<td><textarea name="acc_serkeyword" id="acc_serkeyword" rows="10" cols="30"></textarea></td>
    		</tr>
    		<tr>
    			<td><b>사진 추가하기</b></td>
    			<td><input multiple  type="file" id="file" name="file"></td>
    		</tr>
			<tr>
				<td colspan="2"><input type="submit" value="업소 등록" /></td>
			</tr>
    	</table>
    	<div id="map" style="width:100%; height:500px;"></div>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a45464228f79ad52de13e4c48d3dc9d7&libraries=services"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a45464228f79ad52de13e4c48d3dc9d7"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a45464228f79ad52de13e4c48d3dc9d7&libraries=services"></script>

<script type="text/javascript">
function valueck(){
	const regPhone=/^033-\d{3,4}-\d{4}$/;
	const text = $("#acc_tel").val();
//  	alert($("#cpname").val());
	if ($("#cpname").val()!== ""){
		if ($("#zipcode").val()!=="") {
			if ($("#address2").val()!=="") {
				if (regPhone.test(text)===true) {
					if ($("#acc_info").val()!=="") {
						if ($("#acc_serkeyword").val()!=="") {
							if ($("#file").val()!=="") {
								
								return true;
							}else alert("사진을 1장이상 추가해주세요"); return false; 
						}else alert("검색키워드를 입력해주세요"); return false;
					}else alert("기본 정보를 입력해주세요"); return false;
				}else alert("올바른 전화번호를 입력해주세요 ex(033-111-1411)"); return false;
			}else alert("상세주소를 입력해주세요"); return false;
		}else alert("주소검색을 해주세요"); return false;
	}else alert("업소명을 입력해주세요"); return false;
}


</script>
<script>
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,3})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}



function geoCoding(){	
	var addr = document.getElementById('address1');




	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr.value, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
//		    $("#lat").val(coords.getLat());
//		    $("#lng").val(coords.getLng());
	    var lat = coords.getLat();
	    var lng = coords.getLng();
	    
	    $("#lat").val(lat);
	    $("#lng").val(lng);
//		    alert(latlng);
//		    document.getElementById('lat').value =lat;
//		    document.getElementById('lng').value =lng;
		
	 	

	} 
	});




}
function addrsearch(){
	new daum.Postcode({
		oncomplete: function(data){
			console.log(data);
			var roadAddr = data.roadAddress; //도로명 주소 변수
			var jibunAddr = data.jibunAddress; //지번 주소 변수
			document.getElementById('zipcode').value = data.zonecode;
			if(roadAddr !==''){
				document.getElementById('address1').value = roadAddr;
			}else if(jibunAddr !==''){
				document.getElementById('address1').value = jibunAddr;
			}
			geoCoding();
		}
	 
	}).open();
}

</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



</body>
</html>