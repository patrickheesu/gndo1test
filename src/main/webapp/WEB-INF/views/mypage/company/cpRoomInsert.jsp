<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path=request.getContextPath();

%>
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
     }

    table{
    	margin-left: auto;
    	margin-right: auto;
    	border-collapse: collapse;
    }
    b #tcon{
    	min-width: 120px;
    }
    #preview{
    	float: right;
    	position: relative;
     	right: 400px; 
    	width: 400px;
    	height: 300px;
    	
    }
</style>
<body>
<div class="logo"><img src="resources/img/mypage/company/로고1.png" alt="" width="150" height="150"></div>
    <h1>객실등록</h1>
    <hr> <br>
<form action="cpRoomInsert2" id="addform" method="post" onsubmit="return valueck();" enctype="multipart/form-data">
<input type="hidden" name="acc_num" value="${accsel }" />	<img id="preview" />
	<table>
		<tr>
			<td><b>객실 이름</b></td>
			<td><input type="text" name="rt_rmname" id="rt_rmname" placeholder="객실이름입력 " onfocus="this.placeholder=''" onblur="this.placeholder='객실이름입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수</b></td>
			<td><input type="number" name="rt_rmcount" id="rt_rmcount" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 수용인원</b></td>
			<td><input type="number" name="rt_rpeople" id="rt_rpeople" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 가격</b></td>
			<td><input type="number" name="rt_price" id="rt_price" placeholder="숫자만입력 " onfocus="this.placeholder=''" onblur="this.placeholder='숫자만입력'"/></td>
		</tr>
		<tr>
			<td><b>객실 세부 정보</b></td>
			<td><textarea name="rt_info" id="rt_info" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<td><b>체크인 시간</b></td>
			<td><input type="time" name="rt_in" id="rt_in" value="체크인시간"/></td>
		</tr>
		<tr>
			<td><b>체크아웃 시간</b></td>
			<td><input type="time" name="rt_out" id="rt_out" value="체크아웃시간"/></td>
		</tr>
		<tr>
			<td><b>객실 메인사진 추가하기</b></td>
			<td><input  type="file" name="mainfile" id="mainfile" onchange="imgpreview(this);"/></td>
		</tr>
		<tr>
    			<td><b>객실 사진 추가하기</b></td>
    			<td><input multiple  type="file" name="file" id="file"></td>
    		</tr>
    		<tr>
			<td><a href="cpPage"><button type="button">사업자페이지로 돌아가기</button></a></td>
			<td><input type="button" id="addroom" onclick="addroominsertform()" value="객실 등록 후 추가" /></td>
		</tr>
	</table>

</form>
<div id="display"></div>
<script type="text/javascript">
function imgpreview(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else {
		document.getElementById('preview').src = "";
	}
}
function addroominsertform(){
	if ($("#rt_rmname").val()!=="") {
		if ($("#rt_rmcount").val()!=="") {
			if ($("#rt_rpeople").val()!=="") {
				if ($("#rt_price").val()!=="") {
					if ($("#rt_info").val()!=="") {
						if ($("#rt_in").val()!=="") {
							if ($("#rt_out").val()!=="") {
								if ($("#mainfile").val()!=="") {
									if ($("#file").val()!=="") {
	var form = $('#addform')[0];
	var formData = new FormData(form);
	$.ajax({
		url:"<%=path%>/addroom/restroomdata",
		type : 'POST',
		data : formData,
		async : false,
		contentType : false,
		processData : false,
		success:function(result){			
					htmltxt="<table width='100%' border='1'>"+
					"<tr><th  style='display: none;'>객실번호</th>"+
					"<th>객실 이름</th>"+
					"<th>객실 수</th>"+
					"<th>수용인원</th>"+
					"<th>객실 가격</th>"+
					"<th>객실 정보</th>"+
					"<th>체크인 시간</th>"+
					"<th>체크아웃 시간</th>"+
					"<th>객실 사진수</th>"+
					"<th>삭제하기</th></tr>";
					for ( var ele in result) {
						htmltxt=htmltxt+"<tr><td  style='display: none;'>"+result[ele].rt_num+"</td>"+
						"<td>"+result[ele].rt_rmname+"</td>"+
						"<td>"+result[ele].rt_rmcount+"</td>"+
						"<td>최대"+result[ele].rt_rpeople+"명</td>"+
						"<td>"+result[ele].rt_price+"원</td>"+
						"<td>"+result[ele].rt_info+"</td>"+
						"<td>"+result[ele].rt_in+"</td>"+
						"<td>"+result[ele].rt_out+"</td>"+
						"<td>"+result[ele].rti.rti_afterimg+"장</td>"+
						"<td><button onclick='delroom("+result[ele].rt_num+")'>삭제</button></td>"+
						"</tr>";
					}
					htmltxt=htmltxt+"</table>";
					$("#display").html(htmltxt);
					$("#addform")[0].reset(); 
		}
	});
									}else alert("객실사진을 1장이상 추가해주세요"); 
								}else alert("객실메인사진을 1장이상 추가해주세요"); 
							}else alert("체크아웃시간을 입력해주세요");
						}else alert("체크인시간을 입력해주세요");
					}else alert("객실 세부정보를 입력해주세요");
				}else alert("객실 가격을 입력해주세요");
			}else alert("객실 수용인원을 입력해주세요");
		}else alert("객실 수를 입력해주세요");
	}else alert("객실 이름을 입력해주세요");								
}

function delroom(thisno){
	alert(thisno);
	var htmltxt="";
	$.ajax({
		type:"post",
		url:"<%=path%>/addroom/restdeldata?rt_num="+thisno,
		success:function(result){
			htmltxt="<table width='100%' border='1'>"+
			"<th>객실 이름</th>"+
			"<th>객실 수</th>"+
			"<th>수용인원</th>"+
			"<th>객실 가격</th>"+
			"<th>객실 정보</th>"+
			"<th>체크인 시간</th>"+
			"<th>체크아웃 시간</th>"+
			"<th>객실 사진수</th>"+
			"<th>삭제하기</th></tr>";
			for ( var ele in result) {
				htmltxt=htmltxt+"<tr><td style='display: none;'>"+result[ele].rt_num+"</td>"+
				"<td>"+result[ele].rt_rmname+"</td>"+
				"<td>"+result[ele].rt_rmcount+"</td>"+
				"<td>최대"+result[ele].rt_rpeople+"명</td>"+
				"<td>"+result[ele].rt_price+"원</td>"+
				"<td>"+result[ele].rt_info+"</td>"+
				"<td>"+result[ele].rt_in+"</td>"+
				"<td>"+result[ele].rt_out+"</td>"+
				"<td>"+result[ele].rti.rti_afterimg+"장</td>"+
				"<td><button onclick='delroom("+result[ele].rt_num+")'>삭제</button></td>"+
				"</tr>";
			}
			htmltxt=htmltxt+"</table>";
			$("#display").html(htmltxt);
		}
	});
}	
</script>
</body>
</html>