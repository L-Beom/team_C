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

</head>
<body>
	<header>
		<div>
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>


	<h2 class="goods-title">주문서 작성</h2>

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
				</tr>
			</thead>
			<tbody>
				<c:set var="sum" value="0" />
				<tr>
					<td><img src="${view.goodsThumbnailImage}"
						style="max-width: 50px;" /></td>
					<td><a href="/shop/view?n=${view.goodsName}">${view.goodsName}</a></td>
					<td>${view.goodsPrice}</td>
					<td>1</td>
					<td><fmt:formatNumber pattern="###,###,###"
							value="${view.goodsPrice * 1}" /></td>
				</tr>
				<c:set var="sum" value="${sum + (view.goodsPrice * 1)}" />
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

	<section class="order_form" style="margin-top: 50px;">
		<h3 style="font-weight: bold; text-align: center; margin-top: 30px;">주문하시는
			분</h3>
		<br>
		<form role="form" method="post">
			<label for="email">이메일<span>*</span></label> <input type="text"
				id="userId" name="userId" required="required" placeholder="이메일"
				style="display: block;" value="${member.email}" class="form-control">
			<label for="orderRecipient">수령인<span>*</span></label> <input
				type="text" id="orderRecipient" name="orderRecipient"
				required="required" placeholder="수령인" style="display: block;"
				class="form-control"> <label for="phone">연락처<span>*</span></label>
			<input type="text" id="phone" name="phone" required="required"
				placeholder="연락처" style="display: block;" value="${member.phone}"
				class="form-control">
			<div style="display: inline;">
				<label for="zipcode" style="display: block;">우편번호<span>*</span></label>
				<input type="text" id="zipcode"
					style="width: 150px; display: inline;" name="zipcode"
					required="required" placeholder="우편번호" value="${member.zipcode}"
					class="form-control">
				<button type="button"
					class="btn btn-secondary btn-md postcode_button"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<label for="address1" style="display: block;">주소1<span>*</span></label>
			<input type="text" id="address1" name="address1" required="required"
				placeholder="주소1" style="display: block;" value="${member.address1}"
				class="form-control"> <label for="address2">주소2<span>*</span></label>
			<input type="text" id="address2" name="address2" required="required"
				placeholder="주소2" style="display: block; margin-bottom: 10px;"
				value="${member.address2}" class="form-control"> <input
				type="hidden" class="goodsCode" name="goodsCode"
				value="${view.goodsCode}"> <input type="hidden" id="amount"
				name="amount" value="${sum}">
			<button type="submit" class="btn btn-secondary btn-md pay_button"
				style="background-color: #ff6766;" onclick="order()">결제하기</button>
		</form>
	</section>

	<div class="clear" style="margin-bottom: 200px;"></div>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
	
	<script>
		function order() {
			var id = $('#userId').val();
			var name = $('#orderRecipient').val();
			var phone = $('#phone').val();
			var zipcode = $('#zipcode').val();
			var address1 = $('#address1').val();
			var address2 = $('#address2').val();

			if (id && name && phone && zipcode && address1 && address2) {
				alert('주문이 완료되었습니다.');
			}else{
				alert('빈 곳을 채워주세요!');
			}
		}
	</script>
</body>
</html>
