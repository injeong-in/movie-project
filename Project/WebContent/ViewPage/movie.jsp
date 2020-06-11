<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/swiper.min.css" />
<link type="text/css" rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../js/swiper.min.js"></script>                
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
</head>
<body>
	<!-- Swiper -->
  <div class="swiper-container gallery-top">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
      <div class="swiper-slide" style="background-image:url()"></div>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next swiper-button-white"></div>
    <div class="swiper-button-prev swiper-button-white"></div>
  </div>
  <div class="swiper-container gallery-thumbs">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
      <div class="swiper-slide" style="background-image:url(../images/greenteck.jpg)"></div>
    </div>
  </div>
	
	<script>
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      loop: true,
      freeMode: true,
      loopedSlides: 5, //looped slides should be the same
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      loop:true,
      loopedSlides: 5, //looped slides should be the same
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs,
      },
    });
  </script>
</body>
</html>