<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
				rel="stylesheet" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
			<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet" />

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
		</head>
		<style>
			.notice {
				margin: 0 auto;
				width: 1000px;

			}
		</style>
		<div class="notice">

			<body class="p-3 m-0 border-0 bd-example">
				<!-- Example Code -->
				<h2>QnA</h2>
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								예약을 취소하고 싶어요.
							</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
							data-bs-parent="#accordionExample" style="">
							<div class="accordion-body">
								예약취소는 앱/웹 > 내정보 > 예약/구매내역에서 직접 가능합니다.<br>
								<br>
								예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 <br>
								<br>
								취소수수료를 차감한 금액으로 환불 처리됩니다. 일부 숙소에 한해 취소가 가능한 <br>
								<br>
								시점이나 앱/웹에서 취소가 불가할 수 있으니 이 경우에는 고객행복센터로 요청해 주시길 바랍니다.<br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								예약대기 건 예약취소하고 싶어요.
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
							data-bs-parent="#accordionExample" style="">
							<div class="accordion-body">
								예약 대기중에는 강릉도원 고객행복센터에 예약취소 요청해주시길 바랍니다.<br>
								<br>
								단, 예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.<br>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								체크인날짜/객실타입을 변경하고 싶어요.
							</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
							data-bs-parent="#accordionExample" style="">
							<div class="accordion-body">
								예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.<br>
								<br>
								예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 <br>
								<br>
								예약취소 후 재결제 하셔서 이용 부탁드립니다.<br>
								<br>
								만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다.<br>
								<br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								현금영수증 발급받고 싶어요.
							</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
							data-bs-parent="#accordionExample" style="">
							<div class="accordion-body">
								현금영수증은 현금성 결제수단으로 결제 시 발급이 가능합니다.<br>
								<br>
								결제 단계에서 현금영수증을 신청하면 자동으로 발행되지만,<br>
								신청을 누락했거나 발행받지 못한 경우라면 영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다.<br>
								<br>
								[네이버페이]<br>
								- 결제 단계에서 현금영수증 신청하면 자동으로 발행 (19년 12월 26일 시행)<br>
								- 자진발급 : 네이버페이 > 결제내역 > 주문건 > 주문상세정보 > 영수증 발급내역 > 현금영수증 확인<br>
								- 단, 19년 12월 26일 10시 이전 결제 건은 강릉도원 고객행복센터로 요청<br>
								<br>
								[간편계좌이체 / TOSS / PAYCO]<br>
								- 결제 단계에서 현금영수증 신청하면 자동으로 발행<br>
								- 단, 간편계좌이체의 경우 신청 누락 시 강릉도원 고객행복센터로 요청<br>
								<br>
								[카카오페이]<br>
								- 카카오페이머니 결제 시 자동으로 발행<br>
								- 자진발급 : 카카오톡 > pay > 우측톱니바퀴(나의 카카오페이) > 이용내역 > 결제 > 개별 상세내역 > 현금영수증 확인<br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFive">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
								영수증(거래내역서) 발급받고 싶어요.
							</button>
						</h2>
						<div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
							data-bs-parent="#accordionExample" style="">
							<div class="accordion-body">
								예약정보와 결제정보가 기재되어 있는 영수증(거래내역서)은 강릉도원 고객행복센터로 문의하시면 발급이 가능합니다.<br>
								<br>
								예약내역, 영수증을 받으실 이메일 주소(또는 FAX번호)를 1:1문의 또는 카카오 상담톡으로 남겨주시길 바라며, <br>
								발급 완료까지는 영업일 기준 최대 1~2일 소요되오니 시간 양해 부탁드립니다.
							</div>
						</div>
					</div>
				</div>
		</div>
		<!-- End Example Code -->
		</body>

		</html>