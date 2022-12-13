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

</head>

<body>
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>

	<section class="register_form">
		<h2 style="font-weight: bold; margin-top: 40px;">상품등록</h2>
		<form role="form" method="post" enctype="multipart/form-data">
			<label for="text">1차 세분화 상품 종류<span>*</span></label> <select
				class="select form-control" style="display: block; width: 150px;"
				id="firstClassification" name="firstClassification">
				<option value="best">Best</option>
				<option value="jacket">Jacket</option>
				<option value="top">Top</option>
				<option value="pants">Pants</option>
			</select> <label for="secondClassification">2차 세분화 상품 종류<span>*</span></label>
			<input type="text" id="secondClassification" class="form-control"
				name="secondClassification" required="required"
				placeholder="2차 세분화 상품 종류"> <label for="goodsCode">상품코드<span>*</span></label>
			<input type="text" id="goodsCode" class="form-control"
				name="goodsCode" required="required" placeholder="상품코드"> <label
				for="goodsName">상품이름<span>*</span></label> <input type="text"
				id="goodsName" class="form-control" name="goodsName"
				required="required" placeholder="상품이름"> <label for="brand">브랜드<span></span></label>
			<input type="text" id="brand" class="form-control" name="brand"
				placeholder="브랜드"> <label for="goodsPrice">상품가격<span>*</span></label>
			<input type="text" id="goodsPrice" class="form-control"
				name="goodsPrice" required="required" placeholder="상품가격"> <label
				for="goodsStock">상품재고<span>*</span></label> <input type="text"
				id="goodsStock" class="form-control" name="goodsStock"
				required="required" placeholder="상품재고"> <label
				for="goodsDiscountRate">상품 할인율<span>*</span></label> <input type="text"
				id="goodsDiscountRate" class="form-control" name="goodsDiscountRate"
				required="required" placeholder="상품 할인율"> <label
				for="goodsDescription" style="display: block;">상품소개<span>*</span></label>
			<textarea class="form-control" rows="5" cols="50"
				id="goodsDescription" name="goodsDescription"></textarea>
			<div class="inputArea">
				<label for="goodsImage">이미지</label>
				<div class="custom-file">
					<input type="file" id="goodsImage" name="file"
						class="custom-file-input" /> <label
						class="custom-file-label custom_file" for="customFile">Choose
						file</label>
				</div>
				<div class="select_img img_upload" id="image_preview"
					style="margin-top: 50px; margin-bottom: 20px;">
					<img src="" class="img_upload" />
				</div>
			</div>
			<button type="submit" class="btn btn-secondary btn-md"
				style="margin-bottom: 100px; S margin-top: 20px;">상품추가</button>
		</form>
	</section>

	<script>
		// 파일이름 표시
		$(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				});
	</script>

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
