<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
			
			
%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery-2.1.3.min.js">
    </script>
    <script src="../js/jquery.scrollTo.min.js">
    </script>
    <script>
    $(document).ready(function(){
        $('nav a').click(function(e){
            $.scrollTo(this.hash||0,1500);
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
    
    </script>
</head>



<body>

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

    <section id="1" class="page1">
        <h2>Flat Design</h2>
    </section>
    <section id="2" class="page2">
        <h2>Parallax Scrolling</h2>
    </section>
    <section id="3" class="page3">
        <h2>Fullscreen Background</h2>
    </section>
    <section id="4" class="page4">
        <h2>Typography</h2>
    </section>
</body>
</html>