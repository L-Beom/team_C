<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/css/admin-list.css">
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

	<div class="search-div">

		<select class="select form-control"
			style="display: inline; width: 150px;" id="selectBox">
			<option value="1">상품번호</option>
			<option value="2">상품이름</option>
		</select> <input type="text" id="myInput" onkeyup="searchFunction()"
			placeholder="Search" title="Type in a name">
	</div>

	<div class="table-view">
		<table class="table table-striped" id="myTable">
			<thead class="thead-dark">
				<tr>
					<th style="width: 10%;">댓글번호</th>
					<th style="width: 10%;">상품번호</th>
					<th style="width: 20%;">상품이름</th>
					<th style="width: 10%;">유저이메일</th>
					<th style="width: 40%;">댓글</th>
					<th style="width: 10%;">선호도</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.replyNumber}</td>
						<td>${list.goodsCode}</td>
						<td><a href="/admin/goods/view?n=${list.goodsCode}">${list.goodsName}</a>
						</td>
						<td>${list.userid}</td>
						<td>${list.replyData}</td>
						<td>${list.replyRating}/5</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script>
		function searchFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");

			var target = document.getElementById("selectBox");
			var targetIndex = target.options[target.selectedIndex].value;

			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[targetIndex];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

	<footer>
		<div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>



</body>
</html>
