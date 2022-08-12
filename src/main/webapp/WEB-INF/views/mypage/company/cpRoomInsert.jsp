<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.10.4/polyfill.min.js"></script>
<script type="text/babel" src="/plugin/devbox.js"></script>
<meta charset="UTF-8">
<title>객실등록페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<div id="form2">
<form action="cpRoomInsert2" id="form" method="post" onsubmit="return valueck();" enctype="multipart/form-data">
<input type="hidden" name="acc_num" value="${accsel }" />
	<table>
		<tr>
			<td><b>객실 이름</b></td>
			<td><input type="text" name="rt_rmname1" id="rt_rmname1" placeholder="객실이름입력 " onfocus="this.placeholder=''" onblur="this.placeholder='객실이름입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수</b></td>
			<td><input type="number" name="rt_rmcount1" id="rt_rmcount1" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수용인원</b></td>
			<td><input type="number" name="rt_rpeople1" id="rt_rpeople1" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 가격</b></td>
			<td><input type="number" name="rt_price1" id="rt_price1" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 세부 정보</b></td>
			<td><textarea name="rt_info1" id="rt_info1" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<td><b>체크인 시간</b></td>
			<td><input type="time" name="rt_in1" id="rt_in1" value="체크인시간"/></td>
		</tr>
		<tr>
			<td><b>체크아웃 시간</b></td>
			<td><input type="time" name="rt_out1" id="rt_out1" value="체크아웃시간"/></td>
		</tr>
		<tr>
    			<td><b>객실 사진 추가하기</b></td>
    			<td><input multiple  type="file" name="file1" id="file1"></td>
    			<td style="display: none;"><input type="text" name="addcount" id="addcount" /></td>
    		</tr>
	</table>
	
</form>
	<table>
		<tr>
			<td><button type="submit" form="form">객실등록완료</button></td>
			<td><input type="button" onclick="addroominsertform()" value="추가 등록" /></td>
			<td><input type="button" onclick="testbb()" value="테스트벝은" /></td>
		</tr>
		</table>
</div>
<script type="text/javascript">
let count = 1;
function testbb(){	
	count = count+1;
	alert(count);
	const form = document.getElementById("form");
	const newP= document.createElement('p');
	newP.innerHTML = "\
	<table>\
	<tr>\
	<td><b>객실 이름</b></td>\
	<td><input type='text' name='rt_rmname"+count+"' id='rt_rmname"+count+"' placeholder='객실이름입력' /></td>\
	</tr>\
	<tr>\
	<td><b>객실 수</b></td>\
	<td><input type='number' name='rt_rmcount"+count+"' id='rt_rmcount"+count+"' placeholder='숫자만입력' /></td>\
</tr>\
<tr>\
	<td><b>객실 수용인원</b></td>\
	<td><input type='number' name='rt_rpeople"+count+"' id='rt_rpeople"+count+"' placeholder='숫자만입력' /></td>\
</tr>\
<tr>\
	<td><b>객실 가격</b></td>\
	<td><input type='number' name='rt_price"+count+"' id='rt_price"+count+"' placeholder='숫자만입력' /></td>\
</tr>\
<tr>\
	<td><b>객실 세부 정보</b></td>\
	<td><textarea name='rt_info"+count+"' id='rt_info"+count+"' cols='30' rows='10'></textarea></td>\
</tr>\
<tr>\
	<td><b>체크인 시간</b></td>\
	<td><input type='time' name='rt_in"+count+"' id='rt_in"+count+"' value='체크인시간'/></td>\
</tr>\
<tr>\
	<td><b>체크아웃 시간</b></td>\
	<td><input type='time' name='rt_out"+count+"' id='rt_out"+count+"' value='체크아웃시간'/></td>\
</tr>\
<tr>\
		<td><b>객실 사진 추가하기</b></td>\
		<td><input multiple  type='file' name='file"+count+"' id='file"+count+"'></td>\
	</tr>\
	</table>\
	";
	form.appendChild(newP);
	
	
// 	var namech = document.getElementById('rt_rmname').name
// 	namech = namech+count;
// 	alert(`name=${namech}`);
// 	let content = ;

// 	$('#addroominsert').append(content);
	$('#addcount').attr('value',count);
}

	function valueck(){
		if ($("#rt_rmname1").val()!=="") {
			if ($("#rt_rmcount1").val()!=="") {
				if ($("#rt_rpeople1").val()!=="") {
					if ($("#rt_price1").val()!=="") {
						if ($("#rt_info1").val()!=="") {
							if ($("#rt_in1").val()!=="") {
								if ($("#rt_out1").val()!=="") {
									if ($("#file1").val()!=="") {
										return true;
									}else alert("객실사진을 1장이상 추가해주세요"); return false;
								}else alert("체크아웃시간을 입력해주세요");return false;
							}else alert("체크인시간을 입력해주세요");return false;
						}else alert("객실 세부정보를 입력해주세요");return false;
					}else alert("객실 가격을 입력해주세요");return false;
				}else alert("객실 수용인원을 입력해주세요");return false;
			}else alert("객실 수를 입력해주세요");return false;
		}else alert("객실 이름을 입력해주세요");return false;
	}

</script>
</body>
</html>