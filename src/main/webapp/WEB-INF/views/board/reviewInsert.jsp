<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/review/reviewinsert.css" />
</head>

<body>
<form action="reviewTo" method="post" enctype="multipart/form-data">
	<div class="review">
			<div class="re_hdtitle">
				<h1># 리뷰작성</h1>
			</div>
	
			<div class="reviewtitle">
			  <label for="rvtitle">제목</label>
			  <input class="rvtitle" type="text" size="60" placeholder="제목을 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력하세요'" name="rv_title">
			</div>
			
			<div class="reviewgrade">
				<label for="rvgrade" >평점</label>
				<div class="star-rating">
				  <input type="radio" id="5-stars" name="rv_grand" value="5" />
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="4-stars" name="rv_grand" value="4" />
				  <label for="4-stars" class="star">&#9733;</label>
				  <input type="radio" id="3-stars" name="rv_grand" value="3" />
				  <label for="3-stars" class="star">&#9733;</label>
				  <input type="radio" id="2-stars" name="rv_grand" value="2" />
				  <label for="2-stars" class="star">&#9733;</label>
				  <input type="radio" id="1-star" name="rv_grand" value="1" />
				  <label for="1-star" class="star">&#9733;</label>
				</div>
			</div>
         <c:forEach items="${reviewNone}" var="dto">
            <div class="reviewaccname">
               <label for="stay">숙소명</label>
               <span class="stayinfo">${dto.acc.acc_name} / ${dto.rt.rt_rmname}</span>
            </div>
      	</c:forEach>
			  <label for="rvcontent" class="rv_content">내용</label>
			  <textarea class="rvcontent" id="review_content"  name="rv_content"></textarea>
	
			<div class="reviewfile">파일첨부
			 <input type="file" name="rvi_img" class="rvfile"/>  
			</div>

			<input type="submit" value="리뷰등록" id="review_submit" />
	</div>
</form>

<script>
ratingToPercent() {
    const score = +this.restaurant.averageScore * 20;
    return score + 1.5;
}

</script>
</body>
</html>