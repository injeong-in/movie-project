<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
			
			
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style2.css">
    <script src="../js/jquery-2.1.3.min.js">
    </script>
    <script src="../js/jquery.vide.min.js">
    </script>
    <script src="../js/jquery.scrollTo.min.js">
    </script>
    <script>
    $(document).ready(function(){
        $('nav a').click(function(e){
            $.scrollTo(this.hash||0, 280);
            e.preventDefault();
        });
    });
    
    $(function () {
            var trigger = $('#trigger');
            var menu = $('nav ul');
            $(trigger).on('click', function(e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function () {
                var w = $(window).width();
                if(w>320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    
    
    $(window).scroll(function(){
    	if ($(this).scrollTop() > 300){
    		$('.btn_gotop').show();
    	} else{
    		$('.btn_gotop').hide();
    	}
    });
    $('.btn_gotop').click(function(){
    	$('html, body').animate({scrollTop:0},400);
    	return false;
    });
    
    
    
    </script>
</head>



<body>
	<div id="container">
    <!-- 네비게이션 -->
    <nav class="clearfix">
        <ul class="clearfix">
            <li><a href="">HOME</a></li>
            <li><a href="">로그인</a></li>
            <li><a href="">회원가입</a></li>
            <li><a href="#1">MOVIE</a></li>
            <li><a href="#2">OST</a></li>
            <li><a href="#3">LOCATION</a></li>
            
        </ul>
        <a href="" id="trigger"></a>
    </nav>



    <!-- <div class="container">
        <div><a href="">HOME</a></div>
        <div><a href="">로그인</a></div>
        <div><a href="">회원가입</a></div>
    </div> -->
    
    <section data-vide-bg="stream">
    <h1 style="font-size: 25px; color: white; font-weight: bold;">The Best Movie</h1>
    <h1 style="font-size: 33px; color: white; font-weight: bold;">in the world</h1>
    </section>
    <section id="1" class="page1">
    </section>
    <section data-vide-bg="waterfall" id="2" class="page2" onclick="location.href='detailMovie.jsp'">
    <h1 style="font-size: 25px; color: white; font-weight: bold;">Listen to OST</h1>
    </section>
    <section id="3" class="page3">
    </section>
    <section id="4" class="page4">
    <h1 style="font-size: 100px; color: white; display: inline-block; ">FOOTER</h1>
    </section>
    
    <a href="" class="btn_gotop">
    <img src="../images/topbutton.png" style="width:80px; display: block; margin: 240px; "> 
  	<span class="glyphicon glyphicon-chevron-up">
  	</span>
	</a>
	</div>
</body>
</html>