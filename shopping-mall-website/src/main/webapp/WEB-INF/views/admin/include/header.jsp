<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공대생쇼핑몰</title>

</head>
<body>
   
    <ul class="ul-top-nav">
        <li class="left-head-nav"><a style="text-decoration: none;" class="left-div"><span class="fa fa-phone"></span>
                1588-1588</a></li>

        <div class="right-head-nav right-last-element">
            <li><a class="right-div-visible">관리자 ${member.username}님</a></li>
            <li><a class="right-div" href="/">일반화면</a></li>
            <li><a class="right-div" href="/member/signout">로그아웃</a></li>
        </div>
    </ul>
    <div class="logo-div">
        <div class="logo-div-div"> <a href="/" style="text-decoration: none; ">
                <p class="logo-div-p">공대생쇼핑몰<strong class="logo-div-p-strong"></strong> <span
                        class="logo-div-p-subtitle">최고의
                        가성비를 보장합니다</span>
                </p>
            </a>
        </div>
   
    </div>


    <div class="topnav" id="myTopnav">
       <a href="/admin/index">초기화면</a>
        <a href="/admin/goods/register">상품 등록</a>
        <a href="/admin/goods/list">상품 목록</a>
        <a href="/admin/goods/replyList">상품 소감</a>
        <a href="/admin/goods/orderList">배송관리</a>
   <!--      <a href="javascript:void(0);" class="icon" onclick="myFunction()">
            <i class="fa fa-bars"></i>
        </a> -->
    </div>
    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
</body>
</html>