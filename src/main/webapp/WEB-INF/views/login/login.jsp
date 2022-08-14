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
<title>로그인</title>
    <style>

        body{
            text-align: center;
        }
        .a{
            width: 200px;
            height: 200px;
        }
        .b{
            margin: auto;
            text-align: center;
        }
		#button{
		    background-color: rgb(0, 145, 255);
		    border-color: transparent;
		    border-radius: 3px;
		    padding-left: 110px;
		    padding-right: 110px;
		    padding-top: 5px;
		    padding-bottom: 5px;
		    color: white;
		    font-size: large;
		    margin-top: 10px;
		    margin-left: 10px;
		}
		.button1,.button2{
		    background-color: rgb(0, 145, 255);
		    border-color: transparent;
		    border-radius: 3px;
		    padding-left: 24px;
		    padding-right: 18px;
		    padding-top: 5px;
		    padding-bottom: 5px;
		    color: white;
		    margin-top: 10px;
		}


    </style>
    <link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
    <h3><img class="a" src="resources/img/login/강릉도원 로고.png" alt=""></h3>
    <form action="loginProc" method="post" onsubmit="return login_check();">
    <table class="b">
        <tr>
            <td class="account">아이디</td>            
            <td colspan="2"><input type="text" placeholder="Username" name="id" id="id" class="account2"></td>
        </tr>
        <tr>
            <td class="account">비밀번호</td>
            <td colspan="2"><input type="password" placeholder="********" name="pass" id="pwd" class="account2"></td>
        </tr>
    </table>
    <input type="radio" class="radio" value="members" name="sort" checked>
    	<label>소비자</label>
    <input type="radio" class="radio" value="company" name="sort">
    	<label>사업자</label> <br>
    <!-- <a href="../main"><button id="button" style="margin-right: 5px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">로그인</button></a> -->
    <button type="button" class="button1" style="margin-left: 10px;" onclick="gojoin();" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">회원가입</button>
    <button type="button" class="button2" onclick="goidAssistance();" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)">아이디/비밀번호 찾기</button><br />
    <input id="button" type="submit" value="로그인" style="margin-right: 5px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)" size="50"/> 
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function OnMouseIn(elem){
            elem.style.border="2px solid blue";
            elem.style.color="blue";
        }
        function OnMouseOut(elem){
            elem.style.border="";
            elem.style.color="";
        }
        function gojoin(){
        	
        	location.href='join';
        }
		function goidAssistance(){
        	
        	location.href='idAssistance';
        }
        function login_check(){
        	var check_id = $('#id').val();
        	var check_pwd = $('#pwd').val();
        	var check_table = $("input[name='sort']:checked").val();
        	var allData = { check_id : check_id, check_pwd : check_pwd, check_table : check_table};
        	var check_bool = true;
        	
        	$.ajax({
        		type : 'post' ,
        		url : '<%=path%>/login/loginCheck' ,
        		async : false ,  // 순차적으로 함수를 읽기 위해서 ajax가 비동기식이 기본값이지만 강제로 동기식으로 바꾸어 사용
        		data : allData ,
        		dataType : 'text' ,
        		success : function(result) {
        			if (result == 'true') {
        				console.log("ajax true");
        				check_bool = true;
					} else {
						console.log("ajax false");
						alert('아이디 혹은 비밀번호가 일치하지 않습니다');
						check_bool = false;
					}
        		}
        		
        	});
        	console.log("ajax out");
        	console.log(check_bool);
        	return check_bool;

        }
        

    </script>
</body>
</html>