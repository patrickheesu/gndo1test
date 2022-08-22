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
<title>회원정보수정</title>
<link rel="stylesheet" href="resources/css/member/memberInfoModify.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<a href="./"><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></a><br>
<body style="text-align: center;">
    <div class="memberbody">
        <div class="memberprofile">
            <div class="userprofile">
                <img class="userprofile_img" src="./resources/img/main/user.png" alt="">
                <a>
               		<div>
                    	<div class="userprofile_nickname">${mem_nickname }님</div>
					</div>
						 <br>
                    <div class="userprofile_email">${mem_email }</div>
               		</div>
                </a>
            </div>
        </div>
	</div>
    <div class="memberinfo" style="align-items: center;">
		<h3>개인정보</h3>
		<div class="memuid">
			<div class="memberid">아이디</div>
			<div class="userid">${mem_id }</div><br />
		</div>
		<div class="memuemail">
			<div class="memberemail">이메일</div>
			<div class="useremail">${mem_email }</div><br />
		</div>

		<div class="memupass">
			<div class="memberpass">수정비밀번호</div>
			<div class="userpass"><input class="pass" id="pass1" type="password" /></div>
			<span class="span" id="checkpass1">영문,숫자,특수문자 조합으로 10자이상 입력해주세요</span><br />
		</div>
		<div class="memupass">
			<div class="memberpass">비밀번호확인</div>
			<div class="userpass"><input class="pass" id="pass2" type="password" /></div>
			<span class="span" id="checkpass2"></span>
			<button onclick="mfpass();" class="userpassupdate" id="mfpass" disabled>수정하기</button><br />
		</div>
		<div id="popup" class="popStyle">
					<div id="pcontent" class="pcontent">
						<b>비밀번호 확인</b> <br />
   						<div>
   							기존비밀번호 입력 
   							<input type="password" id="password"/><input type="button" value="확인" onclick="passCheck();"/>
   							 <br />
   						</div>
   						<div class="text">
   							· 외부로부터 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br />
   							· 확인을 누르면 정보가 수정됩니다. <br />
   						</div>
   						
					</div>
		</div>
		<div class="memutel">
			<div class="membertel">휴대폰번호</div>
			<div class="usertel">
				<input class="pass" type="text" id="mtel" oninput="autoHyphen2(this)" onkeyup="telCheck();" maxlength="13"/>
			</div>
			<span class="span" id="checktel">확인용 스판</span>
			<button onclick="mftelnum();" class="usertelupdate" id="mftel" disabled>수정하기</button>
		</div>
		<div id="popup2" class="popStyle">
			<div id="pcontent2" class="pcontent">
				<b>비밀번호 확인</b> <br />
   				<div>
   					기존비밀번호 입력 
   					<input type="password" id="ppassword"/><input type="button" value="확인" onclick="passCheck2();"/>
   					 <br />
   					</div>
   					<div class="text">
   						· 외부로부터 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br />
   						· 확인을 누르면 정보가 수정됩니다. <br />
   					</div>
			</div>
		</div>
	</div>
	<div class="outuser">
		<button class="without" id="without" onclick="wopop();">
            회원탈퇴<text>>></text>
        </button>
	</div>
	<div id="popup3" class="popStyle">
					<div id="pcontent" class="pcontent">
						<b>비밀번호 확인</b> <br />
   						<div>
   							기존비밀번호 입력 
   							<input type="password" id="pppassword"/><input type="button" value="확인" onclick="passCheck3();"/>
   							 <br />
   						</div>
   						<div class="text">
   							· 외부로부터 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br />
   							· 확인을 누르면 회원탈퇴가 완료됩니다. <br />
   						</div>
   						
					</div>
		</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script type="text/javascript">
//비밀번호 10자이상이고 영문,숫자,특수문자 포함 판별
$("#pass1").keyup(function(){ //비밀번호 검사 함수
		var pw1 = $("#pass1").val();
		var pw2 = $("#pass2").val();
		var num = pw1.search(/[0-9]/g);
		var eng = pw1.search(/[a-z]/ig);
		var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
		if(!pw1){
			$("#checkpass1").html("수정할 비밀번호를 입력해주세요.");
			$("#checkpass1").css('color','red');
		}else if(pw1.length<8 || pw1.length>20){
			$("#checkpass1").html("8자리 ~ 20자리 이내로 입력해주세요.");
			$("#checkpass1").css('color','red');
		}else if(pw1.search(/\s/) != -1){
			$("#checkpass1").html("비밀번호는 공백 없이 입력해주세요.");
			$("#checkpass1").css('color','red');
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$("#checkpass1").html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			$("#checkpass1").css('color','red');
		}else{
			$.ajax({
			    type : 'post' ,
		   	    url : '<%=path%>/myPage/mpwddpCheck',
				data : {pw1 : pw1},
				dataType : 'text',
				success : function(result) {
					if (result == 'true') {
						$("#checkpass1").html("사용하고 있는 비밀번호입니다.");
						$("#checkpass1").css('color', 'red');
					} else {
						$("#checkpass1").html("ok");
						$("#checkpass1").css('color', 'green');
					}
				}
			});
		}
		if(pw1 != pw2 || !pw1){
			$("#checkpass2").html("비밀번호가 일치하지 않습니다");
			$("#checkpass2").css('color','red');
			$("#mfpass").attr("disabled",true);
		}else if(pw1 == pw2){
			$("#checkpass2").html("비밀번호가 일치합니다");
			$("#checkpass2").css('color','green');
			$("#mfpass").attr("disabled",false);
		}else if(!pw2){
			$("#checkpass2").html("");
			$("#mfpass").attr("disabled",false);
		}
			
});
//비밀번호확인 일치불일치 검사
$("#pass2").keyup(function(){
	var pw1 = $("#pass1").val();
	var pw2 = $("#pass2").val();
	if(pw1 != pw2){
		$("#checkpass2").html("비밀번호가 일치하지 않습니다");
		$("#checkpass2").css('color','red');
		$("#mfpass").attr("disabled",true);
		$("#mfpass").css('background-color','white')
					.css('border-color','transparent')
					.css('color','#4b94f2');
	}else if(pw1 == pw2){
		$("#checkpass2").html("비밀번호가 일치합니다");
		$("#checkpass2").css('color','green');
		$("#mfpass").attr("disabled",false);
		$("#mfpass").css('background-color','#4b94f2')
					.css('border-color','transparent')
					.css('border-radius','3px')
					.css('color','white');
	}
});

//비밀번호 수정하기버튼 팝업 활성화
function mfpass(){
	console.log("pop");
	$("#popup").bPopup();	
};

//팝업창에서 확인누르면 수정기능 활성화
function passCheck(){
	//수정하려는 비번
	var pw = $("#pass1").val();
	var data = {pw : pw};
	//팝업창 비번
	var pw1 = $("#password").val();
	var mfdata = {pw1 : pw1};
	$.ajax({
	    type : 'post' ,
   	    url : '<%=path%>/myPage/mpwddpCheck',
   	 	async : false ,
		data : mfdata,
		dataType : 'text',
		success : function(result) {
			if (result == 'false') {
				alert("비밀번호가 틀립니다.");
				console.log("fail");
			} else {
				$.ajax({
				    type : 'post' ,
			   	    url : '<%=path%>/myPage/mppwd',
			   	 	async : false ,
					data : data,
					dataType : 'text',
					success : function(result) {
						if (result == 'true') {
							alert("비밀번호가 변경되었습니다!");
							console.log("success");
							location.href='mbModify';
						} else {
							alert("로그아웃 되었습니다.");
							console.log("logout");
						}
					}
				});
			}
		}
	});
};
//전화번호 오토하이픈
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
//전화번호 정규식검사
function telCheck(){
	var mp = $("#mtel").val();
	var mpCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(mpCheck.test(mp) === true){
		$("#checktel").html("사용가능한 번호입니다.");
		$("#checktel").css('color','green');
		$("#mftel").attr("disabled",false);
		$("#mftel").css('background-color','#4b94f2')
					.css('border-color','transparent')
					.css('border-radius','3px')
					.css('color','white');
	}else{
		$("#checktel").html("사용할 수 없는 번호입니다.");
		$("#checktel").css('color','red');
		$("#mftel").attr("disabled",true);
		$("#mftel").css('background-color','white')
					.css('border-color','transparent')
					.css('color','#4b94f2');
	}
}
//전화번호 수정하기버튼 팝업 활성화
function mftelnum(){
	console.log("tpop");
	$("#popup2").bPopup();	
};
//팝업창에서 확인 누르면 전화번호 수정 활성화
function passCheck2(){
	//전화번호 input값
	var mp = $("#mtel").val();
	var data = {mp : mp};
	//팝업창 비번
	var pw1 = $("#ppassword").val();
	var mfdata = {pw1 : pw1};
	$.ajax({
	    type : 'post' ,
   	    url : '<%=path%>/myPage/mpwddpCheck',
   		async : false ,
		data : mfdata,
		dataType : 'text',
		success : function(result) {
			if (result == 'false') {
				alert("비밀번호가 틀립니다.");
				console.log("fail");
			} else {
				$.ajax({
				    type : 'post' ,
			   	    url : '<%=path%>/myPage/mtel',
			   	 	async : false ,
					data : data,
					dataType : 'text',
					success : function(result) {
						if (result == 'true') {
							alert("전화번호가 변경되었습니다!");
							console.log("success");
							location.href='mbModify';
						} else {
							alert("로그아웃 되었습니다.");
							console.log("logout");
						}
					}
				});
			}
		}
	});
}
//회원탈퇴 팝업 활성화
function wopop(){
	console.log("wopop");
	$("#popup3").bPopup();
};
//팝업창에서 확인 누르면 전화번호 수정 활성화
function passCheck3(){
	
	//팝업창 비번
	var pw1 = $("#pppassword").val();
	var mfdata = {pw1 : pw1};
	$.ajax({
	    type : 'post' ,
   	    url : '<%=path%>/myPage/mpwddpCheck',
   		async : false ,
		data : mfdata,
		dataType : 'text',
		success : function(result) {
			if (result == 'false') {
				alert("비밀번호가 틀립니다.");
				console.log("fail");
			} else {
				$.ajax({
				    type : 'post' ,
			   	    url : '<%=path%>/myPage/womem',
			   	 	async : false ,
					dataType : 'text',
					success : function(result) {
						if (result == 'true') {
							alert("회원탈퇴가 완료되셨습니다!");
							console.log("without members success");
							location.href='';
						} else {
							alert("로그아웃 되었습니다.");
							console.log("logout");
						}
					}
				});
			}
		}
	});
}

</script>
</body>


</html>