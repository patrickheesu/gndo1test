<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/review/review.css" />
<title>review_list</title>

<script src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
$(function(){ 
 	let cnt=1;
 	let firstvalue=(cnt+1)*16;
 	let endvalue=(cnt+2)*16;
 	var scroll = ${scroll};
 	
    $(window).scroll(function() {
    	if (cnt <= scroll) {			
    		var docHeight = $(document).height();
    		var winHeight = $(window).height();
        	if($(window).scrollTop() + winHeight >= docHeight) {
				//alert(cnt);
        		firstvalue = (cnt+1)*16;
        		endvalue = (cnt+2)*16;
           	for (var i = firstvalue+1; i < endvalue+1; i++) {
					$("#divnum"+i+"").css("display" , "block");
				}
           	cnt++;
        	}
		}
    });
});


</script>

</head>
<body>

<div class="clear"></div>
<div class="reviewall">
	<div id="review_list">		
		<c:choose>
			<c:when test="${listsize lt 33 }">
				<c:forEach items="${review }" var="review" varStatus="status">
					<div class="review_card">
						<a href="reviewDetail?rv_num=${review.rv_num }">
							<div class="card" style="max-width: 600px; border-collapse: collapse;">
							  <div class="row">
							    <div class="col_01">
							      <img src="resources/upload/${review.rvi.rvi_afterimg }" class="img-fluid" alt="${review.rvi.rvi_afterimg }">
							    </div>
							    <div class="col_02">
							      <div class="card-body">
							        <h5 class="card-title"><text>#</text>${review.rv_title }</h5>
							        <p class="card-text" >${review.rv_content }</p>
							        <p class="card-text"><img src="${pageContext.request.contextPath}/resources/img/list_review/user.png" alt="" width="15px" height="15px"/>
							        <small class="text-muted"></small>${review.mem.mem_nickname }<small class="text-muted_2">${review.rv_date }</small></p>
							      </div>
							    </div>
							  </div>
							</div>
						</a>
					</div>
					<hr/>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
			 	<c:forEach items="${review }" var="review" varStatus="status">
				 	<c:choose>
				 		<c:when test="${status.count lt 33}">
							<div class="review_card" id="divnum${status.count }" ></div>
						</c:when>
						<c:otherwise>
							<div class="review_card" id="divnum${status.count }" style="display: none;" ></div>
						</c:otherwise>
					</c:choose>
						
						<a href="reviewDetail?rv_num=${review.rv_num }">
							<div class="card" style="max-width: 600px; border-collapse: collapse;">
							  <div class="row">
							    <div class="col-md-4">
									<img src="resources/upload/${review.rvi.rvi_afterimg }" class="img-fluid">
							    </div>
							    <div class="col-md-8">
							      <div class="card-body">
							        <h5 class="card-title"><text>${status.count }#</text>${review.rv_title }</h5>
							        <p class="card-text" >${review.rv_content }</p>
							        <p class="card-text"><img src="${pageContext.request.contextPath}/resources/img/list_review/user.png" alt="" width="15px" height="15px"/>
							        <small class="text-muted"></small>${review.mem.mem_nickname }<small class="text-muted_2">${review.rv_date }</small></p>
							      </div>
							    </div>
							  </div>
							</div>
						</a>
						<hr/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<input type="image" src="${pageContext.request.contextPath}/resources/img/list_review/top.png" id="topbnt"
	onClick="javascript:window.scrollTo(0,0)" alt="맨위로" style="width: 50px; height: 50px; bottom: 200px; right: 500px; position: fixed; float: right;" />

</body>
</html>