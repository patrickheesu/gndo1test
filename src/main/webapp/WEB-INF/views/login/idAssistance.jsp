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
<title>아이디 찾기</title>

<link rel="stylesheet" href="resources/css/login/assistance.css">  
</head>
<body>
<a href="./"><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3><br></a>
<div>
	<table class="table1">
	<tr>
		<td>
			<a class="c" href="idAssistance">
				<button class="bt1" id="bt1"
				 onmouseover="OnMouseIn(this)" 
				 onmouseout="OnMouseOut(this)">아이디 찾기</button>
			</a>
		</td>
		<td>
			<a class="c" href="passAssistance">
				<button class="bt2" id="bt1"
				 onmouseover="OnMouseIn(this)" 
				 onmouseout="OnMouseOut(this)">비밀번호 찾기</button>
			</a>
		</td>
	</tr>
</table>
</div>

<h2>아이디 찾기</h2>
<div>
	<input type="radio" name="sort" id="members" value="members"  checked/>
	<label>소비자</label>
	<input type="radio" name="sort" id="company" value="company" />
	<label>사업자</label>
</div>
<div class="memberstable" id="memberstable">
	<table class="memberstable" id="memberstable">
	<tr class="d">
		<td style="text-align: left">이름</td>
		<td><input id="mem_name" type="text"  size="35px"/></td>
		<td></td>
	</tr>
	<tr class="d" style="top: 10px;"/>
		<td>이메일 주소</td>
		<td><input id="mem_email" type="text" size="35px" ></td>
		<td><button id="mfbutton" class="button">아이디 찾기</button></td>
	</tr>
</table>
</div>

<div class="companytable" id="companytable" style="display: none;">
	<table class="companytable" id="companytable">
		<tr class="d">
			<td style="text-align: left">사업자 이름</td>
			<td><input id="cpy_name" type="text"  size="35px"/></td>
			<td></td>
		</tr>
		<tr class="d" style="top: 10px;">
			<td>이메일 주소</td>
			<td><input id="cpy_email" type="text" size="35px" ></td>
			<td>
				<button id="cfbutton" class="button" onmouseover="OnMouseIn(this)" 
				 onmouseout="OnMouseOut(this)">아이디 찾기</button>
			</td>
		</tr>
	</table>
</div>
<div id="midiv" style="display: none;">
	<span id="memId" class="output"></span><br />
	<a href="login"><button class="button2">로그인</button></a>
	<a href="passAssistance"><button class="button2">비밀번호 찾기</button></a>
</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
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
	var memId = '';
	$("#mfbutton").click(function(){
		var memName = $("#mem_name").val();
		var memEmail = $("#mem_email").val();
		var data = { memName : memName, memEmail : memEmail };
			$.ajax({
				type : 'POST',
				url : '<%=path%>/join/midFind',
				data : data,
				dataType : 'text',
				success : function(data){
					if(!data){
						alert("아이디가 존재하지 않습니다");
					}else{
						memId = data;
						console.log(data);
						$('#midiv').css('display','block');
						$("#memId").html("아이디는 "+memId+"입니다");
					}
					
				}
			})
	})
	
	var cpyId = '';
	$("#cfbutton").click(function(){
		var cpyName = $("#cpy_name").val();
		var cpyEmail = $("#cpy_email").val();
		var data = { cpyName : cpyName, cpyEmail : cpyEmail };
			$.ajax({
				type : 'POST',
				url : '<%=path%>/join/cidFind',
				data : data,
				dataType : 'text',
				success : function(data){
					if(!data){
						alert("아이디가 존재하지 않습니다");
					}else{
						cpyId = data;
						console.log(data);
						$('#midiv').css('display','block');
						$("#memId").html("아이디는 "+cpyId+"입니다");
					}
					
				}
			})
	})
	function OnMouseIn(elem){
            elem.style.border="2px solid blue";
            elem.style.color="blue";
    }
	function OnMouseOut(elem){
            elem.style.border="";
            elem.style.color="";
	}
</script>
</body>
</html>