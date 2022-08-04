<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실등록페이지</title>
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
    <h1>객실등록</h1>
    <hr> <br>
<form action="cpRoomInsert2" id="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="accsel" value="${accsel }" />
	<table>
		<tr>
			<td><b>객실 이름</b></td>
			<td><input type="text" name="rt_rmname" placeholder="객실이름입력 " onfocus="this.placeholder=''" onblur="this.placeholder='객실이름입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수</b></td>
			<td><input type="text" name="rt_rmcount" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수용인원</b></td>
			<td><input type="text" name="rt_rpeople" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 가격</b></td>
			<td><input type="text" name="rt_price" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 세부 정보</b></td>
			<td><textarea name="rt_info"  cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<td><b>체크인 시간</b></td>
			<td><input type="time" name="rt_in" value="체크인시간"/></td>
		</tr>
		<tr>
			<td><b>체크아웃 시간</b></td>
			<td><input type="time" name="rt_out" value="체크아웃시간"/></td>
		</tr>
		<tr>
    			<td><b>객실 사진 추가하기</b></td>
    			<td><input multiple  type="file" name="file"></td>
    		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="객실 등록"/></td>
		</tr>
	</table>

</form>
</body>
</html>