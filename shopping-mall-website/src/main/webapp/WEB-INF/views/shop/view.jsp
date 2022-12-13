<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공대생쇼핑몰</title>
<link rel="stylesheet" href="../css/goods-view.css">
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
</head>
<style>
.product_view {
	margin-left: 300px;
	margin-top: 150px;
	margin-bottom: 150px;
}

.responsive_view {
	display: none;
}

@media screen and (max-width: 650px) {
	.product_view {
		display: none;
	}
	.responsive_view {
		display: block;
		margin-left: 70px;
		margin-top: 30px;
	}
}

.review-header {
	margin-left: 300px;
	font-weight: bold;
	margin-bottom: 20px;
	margin-top: 80px;
	display: block;
	/* color:lightblue; */
}

.review-button {
	margin-left: 300px;
	margin-top: 80px;
	display: block;
}

.review-textarea {
	margin-left: 300px;
	margin-right: 300px;
}

.table-view {
	margin-left: 300px;
	margin-right: 300px;
	margin-top: 50px;
	text-align: center;
}

.reply-p {
	margin-left: 300px;
	font-size: 18px;
}

/* Rating Star Widgets Style */
.rating-stars {
	margin-left: 300px;
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

/* Rating Star Widgets Style */
.stars-idle-yellow ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.stars-idle-yellow ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.stars-idle-yellow ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #FF912C; /* Color on idle state */
}

/* Rating Star Widgets Style */
.stars-idle-grey ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.stars-idle-grey ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.stars-idle-grey ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

.table td {
	padding: 0;
	vertical-align: middle;
	border: none;
}

.table th {
	padding: 0;
	vertical-align: middle;
	border: none;
}

@media screen and (max-width: 1100px) {
	.review-header {
		margin-left: 10%;
	}
	.product_view {
		margin-left: 10%;
	}
	.review-textarea {
		margin-left: 10%;
		margin-right: 10%;
	}
	.review-button {
		margin-left: 10%;
	}
	.table-view {
		margin-left: 10%;
		margin-right: 10%;
	}
	.reply-p {
		margin-left: 10%;
	}
	.rating-stars {
		margin-left: 10%;
	}
}

/* rating star modal */
.rating-stars-modal ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.rating-stars-modal ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars-modal ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars-modal ul>li.star.hover>i.fa {
	color: #FFCC36;
}

/* Selected state of the stars */
.rating-stars-modal ul>li.star.selected>i.fa {
	color: #FF912C;
}

</style>
<body>

	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>
	
	<div class="responsive_view">
		<h2 style="font-weight: bold; margin-bottom: 20px;">${view.goodsName}</h2>
		<img src="${view.goodsImage}" alt=""
			style="width: 270px; height: auto;"> 
		<label style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">판매가</label>
		<label class="price" style="font-size: 20px; color: red;">${view.goodsPrice}
			<span>원</span>
		</label> <label
			style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">상품코드</label>
		<label>${view.goodsCode}</label> 
		<label style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">제조사/공급사</label>
		<label>${view.brand}</label>
		<label style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px; margin-bottom:15px;">구매수량</label>
		<div class="length">
			<input type="number" class="numBox2" style="width:25%;" min="1" value="1" /> 
			<a href="#a" class="plus_small"></a> <a href="#a" class="minus_small"></a>
						<script>
						$(".numBox2").on("keyup keydown change",function(event){
						    var boxNum = $('.numBox2').val();
						  /*   console.log(boxNum); */
						});
						
						</script>
		</div>
		<label
			style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">사용가능쿠폰</label>
		<label>0개</label> <label
			style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">옵션선택</label>
		<label><select>
				<option>기본</option>
		</select></label> <label
			style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">배송비</label>
		<label>무료배송</label> <label
			style="display: block; font-weight: bold; font-size: 26px; margin-top: 10px;">결제금액</label>
		<label style="font-size: 20px; color: red;"><b>${view.goodsPrice}</b>원</label>
		<div class="btns" style="margin-bottom: 200px; margin-top: 40px;">
			<a id="update_Btn" class="addCart_btn2 btn btn-default"
				style="background-color: grey; color: white;">장바구니</a>
			<a href="/shop/orderGood?n=${view.goodsName}" id="back_Btn" class="btn btn-default"
				style="background-color: blue; color: white;">구매하기</a>
		</div>
	</div>
	
	<script>
	  $(".addCart_btn2").click(function(){
	   var goodsCode = $(".goodsCode").val();
	   var goodsName = $(".goodsName").val();
	   var cartStock = $(".numBox2").val();
	      
	   var data = {
	     goodsCode : goodsCode,
	     goodsName : goodsName,
	     cartStock : cartStock
	     };
	   
	   $.ajax({
	    url : "/shop/view/addCart",
	    type : "post",
	    data : data,
	    success : function(result){
	    	if(result == 1){
	     		alert("카트에 담았습니다.");
	     		$(".numBox").val("1");
	    	}else{
	    		alert("회원만 사용할 수 있습니다");
	     		$(".numBox").val("1");
	    	}
	    },
	    error : function(){
	     alert("카트 담기 실패");
	    }
	   });
	  });
	</script>
	
	
	<div class="product_view">
		<h2>${view.goodsName}</h2>
		<table>
			<caption>
				<details class="hide">
					<summary>상품정보</summary>
					판매가, 상품코드, 옵션 및 결제금액 안내
				</details>
			</caption>
			<colgroup>
				<col style="width: 173px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th>판매가</th>
					<td class="price">${view.goodsPrice}</td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td>${view.goodsCode}</td>
				</tr>
				<tr>
					<th>제조사/공급사</th>
					<td>${view.brand}</td>
				</tr>
				<tr>
					<th>구매수량</th>
					<td>
						<div class="length">
							<c:set var="num" value="1" />
							<input type="number" class="numBox" min="1"
								max="${view.goodsStock}" value="1" readonly="readonly" /> <a
								href="#a" class="plus">증가</a> <a href="#a" class="minus">감소</a>
							<script>				
								$(".plus").click(function() {
								var num = $(".numBox").val();
	 							var plusNum = Number(num) + 1; 
	 							var stock = ${view.goodsStock};
							if (plusNum >= stock) {
								$(".numBox").val(num);
							} else {
							$(".numBox").val(plusNum);
							}
							});

							$(".minus").click(function() {
							var num = $(".numBox").val();
							var minusNum = Number(num) - 1;
	
							if (minusNum <= 0) {
								$(".numBox").val(num);
							} else {
							$(".numBox").val(minusNum);
							}
							});
						</script>
						</div>
					</td>
				</tr>
				<tr>
					<th>사용가능쿠폰</th>
					<td>0개</td>
				</tr>
				<tr>
					<th>옵션선택</th>
					<td><select>
							<option>기본</option>
					</select></td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>무료배송</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td class="total"><b>${view.goodsPrice}</b>원</td>
				</tr>
			</tbody>
		</table>
		<div class="img">
			<img src="${view.goodsImage}" alt=""> 
			<a class="on"><img src="${view.goodsImage}" alt="" class="product-view-img-thumb"></a>
		</div>
		<input type="hidden" class="goodsCode" name="goodsCode"
			value="${view.goodsCode}"> <input type="hidden"
			class="goodsName" name="goodsName" value="${view.goodsName}">
		<div class="btns">
			<a class="addCart_btn btn btn-default"
				style="background-color: grey; color: white; padding: 0px;">장바구니</a> 
			<a href="/shop/orderGood?n=${view.goodsName}" class="btn btn-default"
				style="background-color: blue; color: white; padding: 0px;">구매하기</a>
		</div>
	</div>
	<script>
	  $(".addCart_btn").click(function(){
	   var goodsCode = $(".goodsCode").val();
	   var goodsName = $(".goodsName").val();
	   var cartStock = $(".numBox").val();
	      
	   var data = {
	     goodsCode : goodsCode,
	     goodsName : goodsName,
	     cartStock : cartStock
	     };
	   
	   $.ajax({
	    url : "/shop/view/addCart",
	    type : "post",
	    data : data,
	    success : function(result){
	    	if(result == 1){
	     		alert("카트 담았습니다.");
	     		$(".numBox").val("1");
	    	}else{
	    		alert("회원만 사용할 수 있습니다");
	     		$(".numBox").val("1");
	    	}
	    },
	    error : function(){
	     alert("카트 담기 실패");
	    }
	   });
	  });
	</script>

	<div id="reply" style="margin-bottom: 350px;">

		<c:if test="${member == null}">
			<p class="reply-p">
				소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${member != null}">
			<section class="replyForm">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="goodsCode" value="${view.goodsCode}">
					<input type="hidden" name="goodsName" value="${view.goodsName}">
					<h2 class="review-header">리뷰 남기기</h2>
					<div class="review-textarea">
						<textarea name="replyData" id="replyData" class="form-control"
							rows="4" cols="50" maxlength="100" required="required"></textarea>
					</div>
					<div class='rating-stars text-center'>
						<ul id='stars'>
							<li class='star selected' data-value='1'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' data-value='2'><i class='fa fa-star fa-fw'></i></li>
							<li class='star' data-value='3'><i class='fa fa-star fa-fw'></i></li>
							<li class='star' data-value='4'><i class='fa fa-star fa-fw'></i></li>
							<li class='star' data-value='5'><i class='fa fa-star fa-fw'></i></li>
						</ul>
					</div>
					<input type="hidden" name="replyRating" id="replyRating" value="1">
					<div class="input_area">
						<button type="submit" id="reply_btn"
							class="btn btn-default review-button"
							style="padding-left: auto; padding-right: auto; background-color: #ff6766; color: white;">소감
							남기기</button>
					</div>

				</form>
			</section>
		</c:if>

		<section class="table-view">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 10%;">닉네임</th>
						<th style="width: 10%;">날짜</th>
						<th style="width: 30%;">평가</th>
						<th style="width: 40%;">내용</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reply}" var="reply">
						<tr>
							<td>${reply.username}</td>
							<td><fmt:formatDate value="${reply.replyDate}"
									pattern="yyyy-MM-dd" /></td>
							<c:set var="num" value="${5-reply.replyRating}" />

							<!--  이 루프 만큼 별 출력-->
							<td style="padding-bottom: 20px;">
								<div class='stars-idle-yellow text-center'>
									<ul id='stars'>
										<c:forEach var="i" begin="1" end="${reply.replyRating}">
											<li class='star'><i class='fa fa-star fa-fw'></i></li>
										</c:forEach>
									</ul>
								</div>
								<div class='stars-idle-grey text-center'>
									<ul id='stars'>
										<c:forEach var="i" begin="1" end="${num}">
											<li class='star'><i class='fa fa-star fa-fw'></i></li>
										</c:forEach>
									</ul>
								</div>
							</td>
							<td>${reply.replyData}</td>
							<td>
								<div style="float: right; display: block;">
									<c:if test="${member != null}">
										<form role="form" method="post">
											<button class="btn btn-danger" id="${reply.replyNumber}del">삭제</button>
										</form>
										<a class="btn btn-warning"
											href="javascript:popup${reply.replyNumber}()">수정</a>
									</c:if>
								</div>
							</td>
						</tr>

						<script>
					      function popup${reply.replyNumber}(){
					    		if("${member.email}" != "${reply.userid}"){
	  								alert("작성자 본인만 수정 할 수 있습니다.");
					    			return;
					    		}
					            var url = "/shop/modify?n=${reply.replyNumber}";
					            var name = "popup test";
					            var option = "width = 470, height = 400, top = 200, left = 200, toolbar=no, location=no, status=no, memubar=no, scrollbars=no, resizable=no"
					            window.open(url, name, option);
					        }
					       
							var formObj = $("form[role='form']");
							var member = "${member == null}";
					
							
							$("#" + "${reply.replyNumber}del").click(function(){  
		  						var con = confirm("정말로 삭제하시겠습니까?");
		  						if (con) {
		  							if("${member.email}" != "${reply.userid}"){
		  								alert("작성자 본인만 삭제 할 수 있습니다.");
			   							formObj.attr("action", "/shop/view/goback?n=${view.goodsName}");
			   							formObj.submit();
		  							}else{
		   							formObj.attr("action", "/shop/view/delete?s=${reply.replyNumber}");
		   							formObj.submit();
								} 
		  						}
		  					});
							
							$("#" + "${reply.replyNumber}modify").click(function(){  
		  						var con = confirm("정말로 수정하시겠습니까?");
		  						if (con) {
		  							if("${member.email}" != "${reply.userid}"){
		  								alert("작성자 본인만 수정 할 수 있습니다.");
			   							formObj.attr("action", "/shop/view/goback?n=${view.goodsName}");
			   							formObj.submit();
		  							}else{
								} 
		  					}
		  					});
							$("#" + "${reply.replyNumber}modify-confirm").click(function(){  
			   							formObj.attr("action", "/shop/view/modify?n=${reply.replyNumber}");
			   							formObj.submit();
		  					});
							
							</script>
					</c:forEach>
				</tbody>
			</table>

		</section>
	</div>
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
 									    /* console.log(ratingValue) */
 									   $('input[name=replyRating]').attr('value',ratingValue);
 									    
 									  });
 									  
 									});

 	</script>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>

