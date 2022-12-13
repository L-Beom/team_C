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
      <div class="right-head-nav right-last-element">
         <c:if test="${member != null}">
            <li><a class="right-div-visible" href="/member/account">나의계정</a></li>
         </c:if>
         <%-- <c:if test="${member.verify != 9}"> --%>
         <li><a class="right-div-visible" href="/shop/cartList">장바구니</a></li>
         <%--  </c:if> --%>
         <c:if test="${member == null}">
            <li><a class="right-div-visible" href="/member/signin">로그인</a></li>
            <li><a class="right-div-visible" href="/member/signup">회원가입</a></li>
         </c:if>
         <c:if test="${member != null}">
            <li><a class="right-div-visible" href="/shop/orderTrack">주문목록</a></li>
            <c:if test="${member.verify == 9}">
               <li><a class="right-div" href="/admin/index">관리자 화면</a></li>
            </c:if>
            <li><a class="right-div" href="">${member.username}님환영합니다.</a></li>
            <li><a class="right-div-visible" href="/member/signout">로그아웃</a></li>
         </c:if>
      </div>
   </ul>
   <div class="logo-div">
      <div class="logo-div-div">
         <a href="/" style="text-decoration: none;">
            <p class="logo-div-p">
               공대생쇼핑몰<strong class="logo-div-p-strong"></strong> <span
                  class="logo-div-p-subtitle">옷 잘 입는 공대생들의 쇼핑몰</span>
            </p>
         </a>
      </div>
   </div>


   <div class="topnav" id="myTopnav">
      <a href="/" style="display: block;">Home</a> 
      <a href="/shop/list?c=best">BEST</a> 
      <a href="/shop/list?c=jacket">아우터</a>
      <a href="/shop/list?c=top">상의</a>
      <a href="/shop/list?c=pants">하의</a> 
      <a href="/shop/orderTrack">주문내역</a> 
         <a href="javascript:void(0);" class="icon"
         onclick="myFunction()"> <i class="fa fa-bars"></i>
      </a>
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