<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script>
        // 클릭 카운트
        // 결과 출력

        function count(type)  {
        // 결과를 표시할 element
        const resultElement = document.getElementById('result');
        
        // 현재 화면에 표시된 값
        let number = resultElement.innerText;
        
        // 더하기/빼기
        if(type === 'plus') {
            number = parseInt(number) + 1;
        }else if(type === 'minus')  {
            number = parseInt(number) - 1;
            if (number<0)
                number=0;
        }

        resultElement.innerText = number;
        }
</script>
<style>
	.cdiv{
		margin-left: 100px;
	}
	.ctable{
 		 
  		margin-left: 100px; 
 		background-color: #f2f6f7;
	}
	#tablediv{
		width: 100%;
	}
	.pay{
		margin-left: 500px;
	}
	table tr td img{
/* 		float: right; */
	}

</style>
<body>
<%-- <c:forEach items="${rdto}" var="dto"> --%>
<div id="tablediv">
<table class="ctable">
        <tr>
            <td>
                <h1 class="h1">호텔</h1>
            </td>
        </tr>
        <tr>
            <td>
                <h3>${rdto.rt_rmname}</h3>
            </td>
            <td><img src="resources/img/reserve/객실1.png" width="700px;" height="400"/></td>
        </tr> 
        <tr>
            <td>2022.07.18(월) ~ 2022.07.19(화)</td>
        </tr>
        <tr>
            <td>체크인 ${rdto.rt_in } 체크아웃 ${rdto.rt_out } </td>
        </tr>
        <tr>
    <td><h2 class="pay">${rdto.rt_price }원</h2></td>
    </tr>
    </table>
    </div>
<%--     </c:forEach> --%>
    <hr>

    <div class="cdiv">
    <h2>예약자 정보</h2>
    <h3>이름</h3> 
    <input type="text" id="memname" placeholder="홍길동" onfocus="this.placeholder=''" onblur="this.placeholder='홍길동'"> <br>
    <h3>핸드폰번호</h3>
    <input type="text" id="memtel" placeholder="010-0000-0000" onfocus="this.placeholder=''" onblur="this.placeholder='010-0000-0000'"> <br>
    <input type="checkbox" name="meminfo" id="meminfo" value="mbinfo" onclick="sameinfo()" />회원정보와같음 <br />
    <h3>인원수</h3>
    <div id="count">
            
            <input type='button'onclick='count("minus")'value='-'/>
            <b id='result'>0</b>
            <input type='button'onclick='count("plus")' value='+'/>
        </div>
    <hr>
    <div style="background-color: whitesmoke;">
    결제 수단 선택 <br>
    <input type="radio" id="iamportPaymentKakaod" name="pay_type" value="Kakao" >카카오페이 <br>
    <input type="radio" id="iamportPaymentToss" name="pay_type" value="Toss">토스 <br>
    <input type="radio" id="iamportPaymentCard" name="pay_type" value="Card">카드 <br>
</div>  <br><br>  
<input type="checkbox" name="selectall" value="selectall" onclick="selectAll(this)"  > 전체 동의하기 <br><br>
<input type="checkbox" name="agree" value="nineteen" onclick="checkSelectAll()" />[필수]만 19세 이상 이용 동의 <br />
<input type="checkbox" name="agree" value="event1" onclick="checkSelectAll()" />[선택]이벤트,혜택 정보 수신 동의 <br />
<input type="checkbox" name="agree" value="event2" onclick="checkSelectAll()" />[선택]이벤트,혜택 정보 전송을 위한 개인정보 수집 및 이용 동의 <br /> <br />
<div class="accordion" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            이용규칙
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <strong>숙소 이용규칙</strong> <br /> <li>각 숙박시설의 규정(규칙 및 약관 등)을 준수해야 합니다. 숙박시설 규정을 위반 시 입실 불가, 퇴실 조치, 추가요금 등이 발생할 수 있으며, 이에 대한 모든 책임은 예약 및 이용 고객님에게 있으므로 숙박시설의 이용규칙과 시설 현황을 반드시 확인하시기 바랍니다.</li>
<li>규정 내 이용 가능 인원을 초과할 경우, 이용 불가 통보 또는 초과 인원에 대한 추가 요금이 발생할 수 있으며, 이에 대한 모든 책임은 예약 및 이용 고객님에게 있습니다.</li>
<li>모든 숙박시설의 예약은 실시간으로 이루어지기 때문에, "예약과 동시에 확정"이 되더라도 over booking(오버부킹)을 비롯한 숙박시설 사정에 따라 “예약 대기” 또는 “예약취소” 상태로 변경될 수 있으며, 결제하신 금액은 자동 환불 처리됩니다.</li>
<li>미성년자 투숙 시 청소년보호법 등 관계 법령에 따라 미성년자(만 19세 미만 청소년)의 경우 혼숙이 금지되며, 법정대리인 동행 없이 혼숙이 불가한 점 반드시 유의하여 주시길 바랍니다. 또한 해당 사유로 인하여 현장에서 입실이 불가할 경우 취소 및 환불이 불가합니다.</li>
<li>각 숙박시설 정보는 예약을 위한 참고 자료입니다. 숙박시설 내 자체 변동이나 기타 사유로 인해 실제와 차이가 있을 수 있으며, 이에 대해 (주)강릉도원는 책임을 지지 않습니다.</li>
<li>객실배정에 따른 요청사항(금연룸, 고층 등)은 숙박시설에 전달되나, 최종 반영 여부는 예약하신 숙박시설의 결정사항이므로 (주)강릉도원에서 보장할 수 없는 사항임을 유의하여 주시기 바랍니다.</li>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingTwo">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            개인정보 수집 및 이용
          </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <strong>개인정보 수집 및 이용</strong><br /> <br /><br />
            <table border="1" style="width: 100%; border-collapse: collapse;  box-shadow: 0 -1px 0 0 #919191;">
            <thead>
            	<th>분류</th>
            	<th>수집 이용동의 목적</th>
            	<th>항목</th>
            	<th>보유 · 이용기간</th>
            	</thead>
            	<td>필수정보</td>
            	<td>계약의 이행 및 서비스 제공, 예약 · 구매 · 관심상품 내역, 결제대금의 청구, 상담 · 불만 · 민원처리, 고지 · 안내사항 전달, 상품 · 서비스 이용실적 정보 통계 · 분석, 상품 · 서비스 개선 및 추천, 불법 · 부정이용방지, 개인정보 유효기간제 준수</td>
            	<td>
            	<ul>
            		<li> <b>예약 · 구매 시:</b>
            			<ul>            		
            					<li>공통 - 예약내역(예약일시, 결제금액, 업체명), 휴대폰 번호</li>
            					<li>예약자 및 구매자 - 이름, 휴대폰 번호, (필요한 서비스의 경우)생년월일</li>            				
            					<li>예약자와 방문자가 다른 경우 - 방문자 및 탑승자의 이름, 휴대폰 번호, (필요한 서비스의 경우)생년월일</li>            				
            					<li>해외숙소 예약 시 - 예약자의 이메일 주소, 투숙객의 영문 이름, (만 17세 이하 자녀 동반 시) 자녀의 나이</li>            				
            					<li>예약확인서 발급 시 - 예약자의 이메일 주소</li>            				
            			</ul>
            		</li>
            		<li><b>현금 환불 요청 시:</b> 계좌번호 및 예금주명</li>
            		<li><b>고객 상담 시:</b> 상담내용 및 상담에 필요한 개인정보</li>
            	</ul>
            	</td>
            	<td>
            		<ul>
            			<li>이용종료일로부터 <b><u>상담 등 민원처리, 정산 및 환불 처리를 위해 30일 후</u></b> 삭제</li>
            			<li>관계법령에 따라 보존할 필요가 있는 경우 <b>해당 법령에서 요구하는 기한까지</b> 보관 (예: 구매 회원의 경우 5년간, IP 주소의 경우 3개월)</li>
            		</ul>
            	</td>
            </table>
            &#8251;위 개인정보 수집 · 이용에 대한 동의를 거부할 수 있으며, 거부할 경우 서비스 이용이 제한됩니다.
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingThree">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            개인정보 제3자 제공
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <strong>숙소 개인정보 제3자 제공</strong>  <br /><br />
            <table border="1" style="width: 100%;" >
            	<tr >
            		<td >제공받는자</td>
            		<td colspan="5">춘천 더 잭슨나인스 호텔</td>
            		
            	</tr>
            	<tr>
            		<td>제공 목적</td>
            		<td colspan="5">예약 · 구매한 상품 · 서비스의 제공 및 계약의 이행(이용자 및 이용정보 확인), 민원처리 등 소비자 분쟁해결</td>
            		
            	</tr>
            	<tr>
            		<td>제공 항목</td>
            		<td colspan="5">예약번호, 예약자 정보(예약자명, 휴대폰 번호) 또는 방문자 정보(방문자명, 휴대폰 번호)</td>
            		
            	</tr>
            	<tr>
            		<td>이용 및 보유기간</td>
            		<td colspan="5">개인정보 이용목적 달성 시까지
단, 관계법령에 의하여 보존할 필요성이 있는 경우 그 시점까지 보존 후 지체 없이 파기</td>
					
            	</tr>
            </table><br />
            &#8251;위의 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 서비스 이용이 제한됩니다.
          </div>
        </div>
      </div>
    </div>
<br /><br />
<input type="button"  onclick="payment();" value="결제하기"/> <br /></div>
<input type="button"  onclick="checkcheck();" value="테스트"/>
<script>

function sameinfo(){	
	if (document.getElementById("meminfo").checked) {		
		$('#memname').val("${mdto.mem_name}");
		$('#memtel').val("${mdto.mem_phonenum}");
	}
	
}




function checkcheck(){
	alert($('input[name="agree"]:checked').val());
// 	 const query = 'input[name="agree"]:checked';
// 	  const selectedEls = 
// 	      document.querySelectorAll(query);
	  
// 	  // 선택된 목록에서 value 찾기
// 	  let result = '';
// 	  selectedEls.forEach((el) => {
// 	    result += el.value + ' ';
// 	  });
// 	  if (result==nineteen'') {
// 		alert("dff");
// 	}
// 	  alert(result);
}

function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="agree"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="agree"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	function payment(){
// 		alert($('input[name="pay_type"]:checked').val());
		var Kakao = "";
		var Toss = "";
		var Card = "";
		if ($('input[name="pay_type"]:checked').val()=="Kakao") {
			paymentKakao();
		}else if ($('input[name="pay_type"]:checked').val()=="Toss") {
			paymentToss();
		}else if ($('input[name="pay_type"]:checked').val()=="Card") {
			paymentCard();
		}
		
		
	}
function paymentKakao(data){
	IMP.init('imp23258415');
	IMP.request_pay({
		pg: 'kakaopay',
		pay_method: "card",
		merchant_uid: "iamport_test_idhhjsffdfeeee",
		name: "${rdto.rt_rmname}",
		amount: ${rdto.rt_price},
		buyer_email: "${mdto.mem_email}",
		buyer_name: "${mdto.mem_name}",
		buyer_tel : "${mdto.mem_phonenum}"
	}, function(rsp){
		if(rsp.success){
			alert("완료 -> imp_uid : "+rsp.imp_uid+" / mercha  nt_uid(orderKey) : "+rsp.merchant_uid);
		}else{
			alert("실패 : 코드("+rsp.error_code+") / 메세지("+rsp.error_msg +")");
		}
	});
	}
function paymentCard(data){
	IMP.init('imp23258415');
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: "card",
		merchant_uid: "aaaa",
		name: "${rdto.rt_rmname}",
		amount: ${rdto.rt_price},
		buyer_email: "${mdto.mem_email}",
		buyer_name: "${mdto.mem_name}",
		buyer_tel : "${mdto.mem_phonenum}"
	}, function(rsp){
		if(rsp.success){
			alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid);
		}else{
			alert("실패 : 코드("+rsp.error_code+") / 메세지("+rsp.error_msg +")");
		}
	});
	}
function paymentToss(data){
	IMP.init('imp23258415');
	IMP.request_pay({
		pg: 'tosspay',
		pay_method: "card",
		merchant_uid: "iamport_test_idddhsffdfeeeed",
		name: "${rdto.rt_rmname}",
		amount: ${rdto.rt_price},
		buyer_email: "${mdto.mem_email}",
		buyer_name: "${mdto.mem_name}",
		buyer_tel : "${mdto.mem_phonenum}"
	}, function(rsp){
		if(rsp.success){
			alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid);
		}else{
			alert("실패 : 코드("+rsp.error_code+") / 메세지("+rsp.error_msg +")");
		}
	});
	}
</script>
</body>
</html>