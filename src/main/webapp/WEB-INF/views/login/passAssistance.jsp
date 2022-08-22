<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="resources/css/login/assistance.css">  
</head>
<body>
<a href="./"><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3><br></a>
<div>
	<table class="table1">
	<tr>
		<td>
			<a class="c" href="idAssistance">
				<button class="bt2"
				 onmouseover="OnMouseIn(this)" 
				 onmouseout="OnMouseOut(this)">아이디 찾기</button>
			</a>
		</td>
		<td>
			<a class="c" href="passAssistance">
				<button class="bt1"
				 onmouseover="OnMouseIn(this)" 
				 onmouseout="OnMouseOut(this)">비밀번호 찾기</button>
			</a>
		</td>
	</tr>
</table>
</div>

<h2>비밀번호 찾기</h2>
<div>
	<input type="radio" name="sort" id="members" value="members"  checked/>
	<label>소비자</label>
	<input type="radio" name="sort" id="company" value="company" />
	<label>사업자</label>
</div>
<div class="memberstable" id="memberstable">
	<table class="memberstable" id="memberstable">
	<tr class="d">
		<td style="text-align: left">아이디</td>
		<td><input id="mem_id" type="text"  size="35px"/></td>
		<td></td>
	</tr>
	<tr class="d" style="top: 10px;"/>
		<td style="padding-right: 25px; text-align: left;">이메일 주소</td>
		<td><input id="mem_email" type="text" size="35px" ></td>
		<td><button id="mfbutton" class="button">임시비밀번호 발송</button></td>
	</tr>
</table>
</div>

<div class="companytable" id="companytable" style="display: none;">
	<table class="companytable" id="companytable">
		<tr class="d">
			<td style="text-align: left">사업자 아이디</td>
			<td><input id="cpy_id" type="text"  size="35px"/></td>
			<td></td>
		</tr>
		<tr class="d" style="top: 10px; text-align: left;"/>
			<td>이메일 주소</td>
			<td><input id="cpy_email" type="text" size="35px" ></td>
			<td><button id="cfbutton" class="button">임시비밀번호 발송</button></td>
		</tr>
	</table>
</div>
<div id="exdiv" style="display: none;">
	<span id="explain" class="output"></span><br />
	<a href="login"><button class="button" style="margin-top: 10px;">로그인</button></a>
</div>

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function OnMouseIn(elem){
	    elem.style.border="2px solid blue";
	    elem.style.color="blue";
	}
	function OnMouseOut(elem){
	    elem.style.border="";
	    elem.style.color="";
	}
	$('input[type=radio][name=sort]').on('click',function(){
		var chkValue = $('input[type=radio][name=sort]:checked').val();
		if(chkValue == 'members'){
			$('#memberstable').css('display','block');
			$('#companytable').css('display','none');
		}else if(chkValue == 'company'){
			$('#memberstable').css('display','none');
			$('#companytable').css('display','block');
		}
	})
	//소비자 비밀번호찾기
	$("#mfbutton").click(function(){
		var memId = $("#mem_id").val();
		var memEmail = $("#mem_email").val();
		var data = { memId : memId, memEmail : memEmail };
			$.ajax({
				type : 'POST',
				url : '<%=path%>/join/mExistent',
				async : false ,
				data : data,
				dataType : 'text',
				success : function(result){
					if(result == 'true'){
						alert("아이디와 이메일이 일치하지 않습니다.");
					}else{
						$.ajax({
							type : 'POST',
							url : '<%=path%>/join/mpassChange',
							async : false ,
							data : data,
							dataType : 'text',
							success : function(data){
								alert("임시비밀번호가 발급되었습니다.");
								$('#exdiv').css('display','block');
								$('#explain').css('color','green');
								$('#explain').html('메일로 발송된 임시비밀번호로 로그인해 주세요!');
							}
						})
					}
					
				}
			})
	})
	//사업자 비밀번호찾기
	$("#cfbutton").click(function(){
		var cpyId = $("#cpy_id").val();
		var cpyEmail = $("#cpy_email").val();
		var data = { cpyId : cpyId, cpyEmail : cpyEmail };
			$.ajax({
				type : 'POST',
				url : '<%=path%>/join/cExistent',
				async : false ,
				data : data,
				dataType : 'text',
				success : function(result){
					if(result == 'true'){
						alert("아이디와 이메일이 일치하지 않습니다.");
					}else{
						$.ajax({
							type : 'POST',
							url : '<%=path%>/join/cpassChange',
							async : false ,
							data : data,
							dataType : 'text',
							success : function(data){
								alert("임시비밀번호가 발급되었습니다.");
								$('#exdiv').css('display','block');
								$('#explain').css('color','green');
								$('#explain').html('메일로 발송된 임시비밀번호로 로그인해 주세요!');
							}
						})
					}
					
				}
			})
	})

	
</script>