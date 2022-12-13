<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- chart.js 추가하기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<style>
.center-div {
	margin-left: 250px;
	margin-right: 200px;
}

.graph-div {
	margin-left: 70px;
}

@media screen and (max-width: 1620px) {
	.center-div {
		margin-left: 8%;
	}
	.graph-div {
		margin-left: 30px;
	}
}

@media screen and (max-width: 1330px) {
	.graph-div {
		margin-left: 0px;
	}
}
</style>
</head>
<body>
	<header>
		<div>
			<%@ include file="include/header.jsp"%>
		</div>
	</header>


	<section class="center-div" style="margin-top: 20px;">
		<div class="card">
			<div class="card-header"
				style="background-color: orangered; color: white; font-size: 16px;">
				웹사이트 현황</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center">
							<div class="panel-left">
								<i class="fa fa-bar-chart-o fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${totalIncome}</h3>
								<strong>총 수익</strong>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center">
							<div class="panel-left">
								<i class="fa fa-shopping-cart fa-5x"></i>
							</div>

							<div class="panel-right">
								<h3>${goodsTotal}</h3>
								<strong>상품갯수</strong>

							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center">
							<div class="panel-leftred">
								<i class="fa fa fa-comments fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${replyTotal}</h3>
								<strong>댓글 수 </strong>

							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center">
							<div class="panel-left">
								<i class="fa fa-users fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${userTotal}</h3>
								<strong>회원 수</strong>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="card" style="margin-top: 20px; margin-bottom: 20px;">
			<div class="card-header"
				style="background-color: orangered; color: white; font-size: 16px;">
				웹사이트 통계</div>
			<div class="card-body">
				<div class="container">
					<div class="row">
						<canvas id="myChart"></canvas>
						<canvas id="myChart2" width="500" height="400" class="graph-div"></canvas>
					</div>
				</div>

				<script>
					var ctx = document.getElementById('myChart');
					ctx.width = 500;
					ctx.height = 400;
					var myChart = new Chart(ctx, {
						type : 'bar',
						data : {
							labels : [ '남성의류', '여성의류', '가방', '신발', ],
							datasets : [ {
								label : '# 상품 갯수',
								data : [ ${best},${jacket},${top},${pants}],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)' ],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							responsive : false,
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});

					var ctx = document.getElementById('myChart2').getContext(
							'2d');
					var chart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : [ '2', '3', '4', '5', '6', '7', '8',
									'9', '10', '11', '12', '1' ],
							datasets : [ {
								label : '월별 총 수익',
								backgroundColor : 'transparent',
								borderColor : 'red',
								data : [ 0,0,0,0,0,0,0,0,0,0,0,${goodsTotalIncomeByMonth} ]
							} ]
						},
						options : {
							responsive : false
						}
					});
				</script>


			</div>
		</div>
	</section>

	<footer>
		<div>
			<%@ include file="include/footer.jsp"%>
		</div>
	</footer>


</body>
</html>
