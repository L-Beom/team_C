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
<link rel="stylesheet" href="../css/order.css">
<!-- Popper 자바스크립트 추가하기 -->
<script src="../js/popper.min.js"></script>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="../js/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="../js/bootstrap.min.js"></script>
<!-- 다음주소 API 추가하기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>
	
	<h2 class="goods-title">주문완료</h2>

	<div class="order_form">
		<p style="margin-top:40px;">가성비<span>몰</span>을 이용해 주셔서 감사합니다</p>
		<p class="confirm_p2">
			고객님, <span style="color: red;">주문이 완료</span>되었습니다
		</p>
		<p>고객님의 주문번호는</p>
		<p style="margin-bottom:40px;"><span>${orderId}</span>입니다.</p>
	</div>
	<c:if test="${fn:length(ordered) > 0}">
		<h2 class="goods-title">주문내역</h2>

		<div class="clear"></div>

		<section class="table-view">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 6%;">사진</th>
						<th style="width: 20%;">상품이름</th>
						<th style="width: 10%;">가격</th>
						<th style="width: 10%;">주문수량</th>
						<th style="width: 10%;">최종가격</th>
						<th style="width: 10%;">주문상태</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:forEach items="${ordered}" var="ordered">
						<tr>
							<td><img src="${ordered.goodsThumbnailImage}"
								style="max-width: 50px;" /></td>
							<td style="padding-top:35px;"><a href="/shop/view?n=${ordered.goodsName}">${ordered.goodsName}</a></td>
							<td style="padding-top:35px;">${ordered.goodsPrice}</td>
							<td style="padding-top:35px;">${ordered.cartStock}</td>
							<td style="padding-top:35px;"><fmt:formatNumber pattern="###,###,###"
									value="${ordered.goodsPrice * ordered.cartStock}" /></td>
							<td style="padding-top:35px;">주문완료</td>
						</tr>
						<c:set var="sum"
							value="${sum + (ordered.goodsPrice * ordered.cartStock)}" />
					</c:forEach>
				</tbody>
			</table>

		</section>
		<div class="order-amount-box">
			<p>
				총 주문금액:
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원 + 0 원 (배송비) =
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원
			</p>
		</div>
		
		<div class="clear" style="margin-bottom: 200px;"></div>

	</c:if>



	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>
