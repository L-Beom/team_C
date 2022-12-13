<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>공대생쇼핑몰</title>

<!-- font awesome 추가하기 -->
<link rel="stylesheet" href="/css/font-awesome.min.css">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="/css/custom.css">
<!-- Popper 자바스크립트 추가하기 -->
<script src="/js/popper.min.js"></script>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/js/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/js/bootstrap.min.js"></script>

<style>
.form-responsive {
	margin-right: 800px;
}

@media screen and (max-width: 1900px) {
	.form-responsive {
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

	<section class="register_form goods_view">
		<h2 style="font-weight: bold; margin-top: 40px; margin-bottom: 40px;">상품조회</h2>
		<form role="form" method="post" autocomplete="off"
			class="form-responsive">
			<input type="hidden" name="n" value="${goods.goodsCode}" /> <label
				for="text" style="display: block;">1차 세분화 상품 종류<span>*</span></label>
			<span>${goods.firstClassification}</span> <label
				for="secondClassification" style="display: block;">2차 세분화 상품
				종류<span>*</span>
			</label> <span>${goods.secondClassification}</span> <label for="goodsCode"
				style="display: block;">상품코드<span>*</span></label> <span>${goods.goodsCode}</span>
			<label for="goodsName" style="display: block;">상품이름<span>*</span></label>
			<span>${goods.goodsName}</span> <label for="brand"
				style="display: block;">브랜드<span></span></label> <span><c:if
					test="${goods.brand eq ''}">없음</c:if>${goods.brand}</span> <label
				for="goodsPrice" style="display: block;">상품가격<span>*</span></label>
			<span>${goods.goodsPrice}</span> <label for="goodsStock"
				style="display: block;">상품재고<span>*</span></label> <span>${goods.goodsStock}</span>
			<label for="goodsDiscountRate" style="display: block;">상품 할인율<span>*</span></label>
			<span>${goods.goodsDiscountRate}%</span> <label
				for="goodsDescription" style="display: block;">상품소개<span>*</span></label>
			<span>${goods.goodsDescription}</span> <label for="goodsImage"
				style="display: block;">상품 이미지<span>*</span></label> <span><img
				src="${goods.goodsImage}" class="img_upload" /></span>
			<div
				style="margin-bottom: 130px; margin-top: 30px; margin-top: 40px;">
				<button type="button" id="modify_btn" class="btn btn-warning">수정</button>
				<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
			</div>

			<script>
				var formObj = $("form[role='form']");

				$("#modify_btn").click(function() {
					formObj.attr("action", "/admin/goods/modify");
					formObj.attr("method", "get")
					formObj.submit();
				});

				$("#delete_btn").click(function() {
					var con = confirm("정말로 삭제하시겠습니까?");
					if (con) {
						formObj.attr("action", "/admin/goods/delete");
						formObj.submit();
					}
				});
			</script>
		</form>
	</section>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>


	<script>
		$("#goodsImage")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
	</script>


</body>
</html>
