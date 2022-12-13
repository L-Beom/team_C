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
	text-align: center;
	margin-top: 50px;
}

.final_sum {
	margin-bottom: 200px;
	text-align: center;
	font-weight: bold;
}

.final_sum h3 {
	font-weight: bold;
	margin-bottom: 30px;
}

.sum {
	margin-bottom: 20px;
}

.box{
	margin-left: 300px;
    margin-right: 300px;
}

.top_del_btn{
	margin-bottom: 10px;
}

.order-amount-box {
	background: #ffca94;
	margin-left: 300px;
	margin-right: 300px;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 24px;
	padding-top: 30px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 100px;
}

.table-view thead{
	text-align: center;
}

.table-view tbody{
	text-align: center;
}

@media screen and (max-width: 1500px) {
	.box{
		margin-left: 10%;
    	margin-right: 10%;
	}
	.order-amount-box {
		margin-left: 10%;
    	margin-right: 10%;
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

	<!--  <section id='main_img'></section>-->

	<c:if test="${fn:length(cartList) == 0}">
		<div style="margin-bottom: 300px; margin-top: 50px;">
			<h3 class="goods-title">전체 카트 상품</h3>
			<p style="text-align: center; font-weight: bold; font-size: 16px;">현재
				카트에 상품이 없습니다.</p>
		</div>
	</c:if>
	<c:if test="${fn:length(cartList) > 0}">
		<div class="box">
			<h3 class="goods-title">전체 카트 상품</h3>
		<div class="top_del_btn">
			<div class="allCheck">
				<input type="checkbox" name="allCheck" id="allCheck" /><label
					for="allCheck">모두 선택</label>
				<script>
					$("#allCheck").click(function() {
						var chk = $("#allCheck").prop("checked");
						if (chk) {
							$(".chBox").prop("checked", true);
						} else {
							$(".chBox").prop("checked", false);
						}
					});
				</script>
			</div>
			<div class="delBtn">
				<button type="button" class="selectDelete_btn btn btn-default"
					style="background-color: #ff6766; color: white;">선택 삭제</button>

				<script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();

							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-cartNum"));
							});

							$.ajax({
								url : "/shop/deleteCart",
								type : "post",
								data : {
									chbox : checkArr
								},
								success : function(result) {
									if (result == 1) {
										location.href = "/shop/cartList";
									} else {
										alert("삭제 실패");
									}
								}
							});
						}
					});
				</script>
			</div>
		</div>
			<div class="clear"></div>
			<c:set var="sum" value="0" />
			<c:set var="listSize" value="${fn:length(cartList)}" />
			
			<section class="table-view">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 3%;"></th>
							<th style="width: 5%;">사진</th>
							<th style="width: 20%;">상품이름</th>
							<th style="width: 10%;">할인된 가격</th>
							<th style="width: 10%;">주문수량</th>
							<th style="width: 10%;">최종가격</th>
							<th style="width: 5%;"></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0" />
						<c:forEach items="${cartList}" var="cartList">
							<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-cartNum="${cartList.cartNumber}" />
										<script>
											$(".chBox").click(function() {
												$("#allCheck").prop("checked", false);
											});
										</script>
									</div>

								</td>
								<td><img src="${cartList.goodsThumbnailImage}"
									style="max-width: 50px;" /></td>
								<td style="padding-top:35px;"><a href="/shop/view?n=${cartList.goodsName}">${cartList.goodsName}</a></td>
								<td style="padding-top:35px;">${cartList.goodsPrice}</td>
								<td style="padding-top:35px;">${cartList.cartStock}</td>
								<td style="padding-top:35px;"><fmt:formatNumber pattern="###,###,###"
										value="${cartList.goodsPrice * cartList.cartStock}" /></td>
								<td>
									<div class="delete">
										<button type="button"
											class="delete_${cartList.cartNumber}_btn btn btn-default"
											data-cartNumber="${cartList.cartNumber}"
											style="margin-top: 17px; background-color: #ff6766; color: white;">삭제</button>

										<script>
									$(".delete_${cartList.cartNumber}_btn").click(
										function() {
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										if (confirm_val) {
										var checkArr = new Array();
										checkArr.push($(this).attr("data-cartNumber"));
											$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : {chbox : checkArr},
													    success : function(result) {
														if (result == 1) {
															location.href = "/shop/cartList";
														} else {
															alert("삭제 실패");
															   }
																				}
												});
											}
										});
									</script>
									</div>
								</td>
							</tr>
								<c:set var="sum" value="${sum + (cartList.goodsPrice * cartList.cartStock)}" />
						</c:forEach>
					</tbody>
				</table>
			</section>


		</div>

		<div class="clear" style="margin-bottom: 100px;"></div>

	<%-- 	<div class="final_sum" style="margin-bottom: 200px;">
			<h3>총 상품 가격</h3>
			<div class="sum">
				총 합계 :
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원
			</div>
			<a href="/shop/orderCart" class="btn
					btn-default"
				style="background-color: #ff6766; color: white;">주문 하기</a>
		</div> --%>
		
			<div class="order-amount-box">
			<p style="display: inline; margin-right: 30px; ">
				총 주문금액:
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원 + 0 원 (배송비) =
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원
			</p>
				<a href="/shop/orderCart" class="btn
					btn-default"
				style="background-color: #ff6766; color: white;">주문 하기</a>
		</div>
	</c:if>



	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>
