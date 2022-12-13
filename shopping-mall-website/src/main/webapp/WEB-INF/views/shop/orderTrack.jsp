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



</head>
<body>
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>

	<!--  <section id='main_img2'></section>-->

	<c:if test="${member == null}">
		<section class="register_form" style="margin-top: 100px; margin-bottom:300px;">
			<h2 style="font-weight: bold;">주문번호로 검색</h2>
			<form role="form" method="post">
				<label for="email" style="margin-top: 20px;">주문번호<span>*</span></label>
				<input type="text" id="orderId" name="orderId" required="required"
					placeholder="주문번호" class="form-control">
				<button type="submit" class="btn btn-secondary btn-md"
					style="background-color: #ff6766; margin-top: 20px;">검색하기</button>
			</form>
		</section>
	</c:if>

	<c:if test="${fn:length(ordered) == 0 && member != null}">
		<h2 class="goods-title">주문내역</h2>
		<p style="text-align: center; font-weight: bold; font-size: 16px;">현재
			주문내역이 없습니다.</p>
	</c:if>
	<c:if test="${fn:length(ordered) > 0}">
		<h2 class="goods-title">주문내역</h2>
		<div class="clear"></div>

		<section class="table-view">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 5%;">주문번호</th>
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
							<td style="padding-top:35px;">${ordered.orderId}</td>
							<td><img src="${ordered.goodsThumbnailImage}"
								style="max-width: 50px;" /></td>
							<td style="padding-top:35px;"><a href="/shop/view?n=${ordered.goodsName}">${ordered.goodsName}</a></td>
							<td style="padding-top:35px;">${ordered.goodsPrice}</td>
							<td style="padding-top:35px;">${ordered.cartStock}</td>
							<td style="padding-top:35px;"><fmt:formatNumber pattern="###,###,###"
									value="${ordered.goodsPrice * ordered.cartStock}" /></td>
							<td style="padding-top:35px;">
							<c:if test="${ordered.orderStatus == 1}">
								주문완료
							</c:if>
								<c:if test="${ordered.orderStatus == 2}">
								배송중
							</c:if>
							</td>
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


	<footer style="margin-top: 100px;">
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>


</body>
</html>
