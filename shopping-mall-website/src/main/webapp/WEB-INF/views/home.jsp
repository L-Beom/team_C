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

<style>
.carousel {
   width: 1200px;
   height: 640px;
   margin: 0 auto;
}

@media screen and (max-width: 850px) {
   .carousel {
      width: auto;
      height: auto;
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


   <section style="margin-bottom: 96px;">

      <div>
         <div id="carouselIndicators" class="carousel slide"
            data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#carouselIndicators" data-slide-to="0"
                  class="active"></li>
               <li data-target="#carouselIndicators" data-slide-to="1"></li>
               <li data-target="#carouselIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img class="d-block w-100"
                     src="../img/index/index_img1.png" alt="First slide">
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100"
                     src="../img/index/index_img2.png" alt="Second slide">
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100"
                     src="../img/index/index_img3.png" alt="Third slide">
               </div>
            </div>
            <a class="carousel-control-prev" href="#carouselIndicators"
               role="button" data-slide="prev"> <span
               class="carousel-control-prev-icon" aria-hidden="true"></span> <span
               class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#carouselIndicators"
               role="button" data-slide="next"> <span
               class="carousel-control-next-icon" aria-hidden="true"></span> <span
               class="sr-only">Next</span>
            </a>
         </div>
      </div>
   </section>
   <br>
   
   <footer>
      <div>
         <%@ include file="include/footer.jsp"%>
      </div>
   </footer>
   
</body>
</html>