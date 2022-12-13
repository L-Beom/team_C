<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<style>
.box {
	width: 1320px;
	margin: 0 auto;
	/* border: solid 1px blue; */
}

#content_box {
	padding-top: 50px;
}

#content_box h3 {
	float: left;
	margin-left: 610px;
}

#content_box p {
	float: right;
	margin-right: 20px;
}

.items {
	width: 232px;
	/* border: solid 1px blue; */
	margin: 30px 0 0 25px;
	float: left;
}

.items li {
	font-family: "돋움";
	color: #666666;
}

.items .a {
	font-weight: bold;
	color: black;
	margin-top: 20px;
	padding-right: 45px;
	font-size: 14px;
}

.items .b {
	font-weight: bold;
	color: black;
	margin-top: 5px;
}

.items .b span {
	color: #a26f59;
}

.items .c {
	font-size: 12px;
	margin-top: 20px;
	/* padding-bottom:20px; */
}

.items .d {
	font-size: 12px;
	margin-top: 25px;
}

.items .d span {
	color: #a26f59;
}

* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

.clear {
	clear: both;
}

.goods-title {
	font-weight: bold;
	margin-bottom: 50px;
}

@media screen and (max-width: 600px) {
	.items {
		margin-right: 450px;
		margin-left: 80px;
		/* margin-bottom:30px; */
	}
	.category {
		display: none;
	}
	#content_box h3 {
		margin-left: 120px;
	}
}
</style>
</head>
<body>
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>


	<section id="content_box">
		<div class="box">
			<h3 class="goods-title">전체 상품</h3>
			<div class="clear"></div>

			<c:forEach items="${list}" var="list">
				<ul class="items">
					<li><img src="${list.goodsImage}" style="width: 203px; height: 300px"></li>
					<li class="a"><a href="/shop/view?n=${list.goodsName}">${list.goodsName}</a></li>
					<li class="b">${list.goodsPrice}<span> ${list.goodsDiscountRate}%</span></li>
					<c:set var="string1" value="${list.goodsDescription}" />
					<c:set var="string2" value="..." />
					<li class="c">&quot; <c:choose>
							<c:when test="${fn:length(string1) gt 40}">
								<c:out value="${fn:substring(string1, 0, 39)}${string2}">
								</c:out>
							</c:when>
							<c:otherwise>
								<c:out value="${string1}">
								</c:out>
							</c:otherwise>
						</c:choose>&quot;
					</li>
					<li class="d">리뷰 <span>${list.countReply}</span> 평점 · <span>
						<c:choose>
							<c:when test="${list.avgReplyRating == 0.0}">
        					평점 없음
    					</c:when>
							<c:otherwise>
							${list.avgReplyRating}/5
    						</c:otherwise>
						</c:choose>
					</span>
					</li>
				</ul>
			</c:forEach>
		</div>

		<div class="clear" style="margin-bottom: 100px;"></div>
	</section>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>


</body>
</html>
