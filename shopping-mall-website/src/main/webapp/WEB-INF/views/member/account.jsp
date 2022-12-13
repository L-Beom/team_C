<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>공대생 쇼핑몰</title>

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

	<script>
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=zipcode]").val(data.zonecode);
					$("[name=address1]").val(fullRoadAddr);

					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
					document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
		}
	</script>
	
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>

<!--  	<section id='main_img'></section>-->

	<section class="register_form" style="margin-top: 50px;">
		<h2 style="font-weight: bold;">회원정보 수정</h2>
		<br>
		<form role="form" method="post">
			<label for="email">이메일<span>*</span></label> <label for="email"
				style="display: block; font-weight: normal">${member.email}</label>
			<label for="email">닉네임<span>*</span></label> <input type="text"
				id="username" name="username" required="required"
				value="${member.username}" placeholder="Username"
				style="display: block;" class="form-control"> <label
				for="phone">연락처<span>*</span></label> <input type="text" id="phone"
				name="phone" required="required" value="${member.phone}"
				placeholder="Phone number" style="display: block;"
				class="form-control">
			<div style="display: inline;">
				<label for="zipcode" style="display: block;">우편번호<span>*</span></label>
				<input type="text" id="zipcode" value="${member.zipcode}"
					style="width: 150px; display: inline;" name="zipcode"
					required="required" placeholder="Zipcode" class="form-control">
				<button type="button"
					class="btn btn-secondary btn-md postcode_button"
					style="display: inline; margin-left: 3px;"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<label for="address1" style="display: block;">주소1<span>*</span></label>
			<input type="text" id="address1" value="${member.address1}"
				name="address1" required="required" placeholder="Address1"
				style="display: block;" class="form-control"> <label
				for="address2">주소2<span>*</span></label> <input type="text"
				value="${member.address2}" id="address2" name="address2"
				required="required" placeholder="Address2"
				style="display: block; margin-bottom: 10px;" class="form-control">
			<button type="submit" onclick="javascript:btn();"
				class="btn btn-secondary btn-md"
				style="margin-bottom: 100px; background-color: #ff6766; margin-top: 20px;">회원정보
				수정</button>
			<script>
				function btn() {
					alert('다시 로그인 해주세요.');
				}
			</script>

		</form>
	</section>



	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>


</body>
</html>
