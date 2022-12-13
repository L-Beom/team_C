<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>가성비몰</title>
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
<body>

	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>
	<!-- <section id='main_img'></section> -->

	<section class="register_form" style="margin-top: 50px;">
		<h2 style="font-weight: bold;">로그인</h2>
		<form role="form" method="post">
			<label for="email" style="margin-top: 20px;">이메일<span>*</span></label>
			<input type="text" id="email" name="email" required="required"
				placeholder="Email" class="form-control"> <label
				for="password">비밀번호<span>*</span></label> <input type="password"
				id="password" name="password" required="required"
				placeholder="Password" class="form-control">
			<button type="submit" class="btn btn-secondary btn-md"
				style="background-color: #ff6766; margin-top: 20px;">Login</button>
			<p style="margin-bottom: 300px; margin-top: 10px;">
				<a href="/member/signup">회원가입</a>
			</p>
		</form>
		<c:if test="${msg == false}">
			<script>
				alert("이메일과 비밀번호를 확인해주세요");
			</script>
		</c:if>
	</section>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>
