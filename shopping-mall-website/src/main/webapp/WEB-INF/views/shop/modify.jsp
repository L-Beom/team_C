<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>공대생쇼핑몰</title>

<!-- font awesome 추가하기 -->
<link rel="stylesheet" href="../css/font-awesome.min.css">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="../css/custom.css">
<!-- Popper 자바스크립트 추가하기 -->
<script src="../js/popper.min.js"></script>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="../js/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="../js/bootstrap.min.js"></script>
<script>
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
} 
function popupSubmit() {

    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.popForm.target = "parentPage"; // 타켓을 부모창으로 설정
    document.popForm.action = "/target/parentPage2.do";  //부모창에 호출될 url 
    document.popForm.submit();
    self.close();
}

</script>
<style>
/* Rating Star Widgets Style */
.rating-stars {
	margin-left: 100px;
	display: block;
}

.rating-stars ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul>li.star.hover>i.fa {
	color: #FFCC36;
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;
}

.popup-btn {
	padding-left: 160px;
	padding-top: 80px;
}
</style>
</head>
<body>


	<section id="container">
		<form role="form" method="post" autocomplete="off">
			<h2
				style="text-align: center; font-weight: bold; margin-bottom: 20px; margin-top: 20px;">
				리뷰 수정하기</h2>
			<div class="review-textarea">
				<textarea name="replyData" id="replyData" class="form-control"
					rows="4" cols="50" maxlength="100" required="required">${reply.replyData}</textarea>
			</div>
			<div class='rating-stars text-center'>
				<ul id='stars'>
					<li class='star 
						<c:if test="${reply.replyRating >= 1}">
						selected
						</c:if>' data-value='1'><i
						class='fa fa-star fa-fw'></i></li>
					<li class='star 
					<c:if test="${reply.replyRating >= 2}">
						selected
					</c:if>'
					data-value='2'><i class='fa fa-star fa-fw'></i></li>
					<li class='star
					<c:if test="${reply.replyRating >= 3}">
						selected
					</c:if>'
					data-value='3'><i class='fa fa-star fa-fw'></i></li>
					<li class='star
						<c:if test="${reply.replyRating >= 4}">
						selected
					</c:if>'
					 data-value='4'><i class='fa fa-star fa-fw'></i></li>
					<li class='star
						<c:if test="${reply.replyRating >= 5}">
						selected
					</c:if>'
					data-value='5'><i class='fa fa-star fa-fw'></i></li>
				</ul>
			</div>
			<input type="hidden" name="replyRating" id="replyRating" value="${reply.replyRating}">
			<div class="popup-btn">
				<button type="submit" class="btn btn-primary"
					id="${reply.replyNumber}modify-confirm">수정하기</button>
				<a href="javascript:frameclose()" type="button" class="btn btn-secondary" >닫기</a>
			</div>
		</form>
	</section>
	<script>
	  $(document).ready(function(){
			  
			  /* 1. Visualizing things on Hover */
			  $('#stars li').on('mouseover', function(){
			    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
			   
			    // Now highlight all the stars that's not after the current hovered star
			    $(this).parent().children('li.star').each(function(e){
			      if (e < onStar) {
			        $(this).addClass('hover');
			      }
			      else {
			        $(this).removeClass('hover');
			      }
			    });
			    
			  }).on('mouseout', function(){
			    $(this).parent().children('li.star').each(function(e){
			      $(this).removeClass('hover');
			    });
			  });
			  
			  
			  /* 2. Action to perform on click */
			  $('#stars li').on('click', function(){
			    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
			    var stars = $(this).parent().children('li.star');
			    
			    for (i = 0; i < stars.length; i++) {
			      $(stars[i]).removeClass('selected');
			    }
			    
			    for (i = 0; i < onStar; i++) {
			      $(stars[i]).addClass('selected');
			    }
			    
			    // JUST RESPONSE
			    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
			    var msg = "";
			   /*  console.log(ratingValue) */
			   $('input[name=replyRating]').attr('value',ratingValue);
			    
			  });
			  
			});
	</script>
</body>
</html>
