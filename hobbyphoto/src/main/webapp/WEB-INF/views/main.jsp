<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메인화면</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <!--제이쿼리-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

  <!-- Swiper's CSS -->
  <!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> -->

  <!-- Swiper's JS -->
  <!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->

  <style>
    .carousel-inner > .carousel-item > img{
      width: 640px;
      height: 720px;
    }

    .midd{
      border: 1px solid black;
      width: 1400px;
      height: 450px;
      margin: auto;
      margin-top: 30px;
      border: none;
    }

    .under{
      border: 1px solid black;
      width: 1400px;
      height: 500px;
      margin: auto;
      border: none;
    }

    /*중간*/
    .midd-content{
      border: 1px solid blue;
      width: 100%;
      height: 25%;
      border: none;
    }

    .under-content{
      border: 1px solid black;
      width: 100%;
      height: 16%;
      border: none;
    }

    .pick-area{
      border: 1px solid black;
      width: 95%;
      height: 60%;
      margin: auto;
      margin-top: 1%;
      border: none;
    }

    .pick1,.pick2,.pick3,.pick4{
      border: 1px solid rebeccapurple;
      width: 20%;
      height: 56%;
      float: left;
      margin-left: 4%;
      margin-top: 0%;
      border: none;
    }

    .pick-area img{
      border-radius: 10px;
      cursor: pointer;
    }

    .p-area{
      border: 1px solid red;
      width: 97%;
      height: 80%;
      margin: auto;
      margin-top: 10px;
      border: none;
    }

    /*하단*/
    #section {
      width:1035px;      /*전체 아코디언 메뉴의 넓이 설정*/
      margin:0 auto; 
    }
    #section > div {
      margin-bottom:150px;
    }
    #section .section {
      height:400px;      /*높이 설정*/ 
    }
    #section .section .cont {          /*각각의 메뉴박스 기본값 설정*/
      width:153px;       
      height:400px; 
      overflow:hidden; 
      float:left; 
      position:relative; 
      border-left:solid 1px #f0ede7;
    }
    #section .section .cont div:first-child {
      border-left:none;
    }
    #section .section .cont .bg {
      position:absolute; top:0; left:0;
    }
    #section .section .cont.on {        /*마우스 커서 올렸을 때 넓이 설정*/
      width:413px;
    }
    #section .section .cont.on .title_off {
      display:none;
    }
    #section .section .cont.on .title_on {
      display:block;
    }
    #section .section .cont.on .layer {       /*마우스 커서 올렸을 때 커버 레이어 감추기*/
      display:none
    }
    #section .section .cont .title_off, 
    #section .section .cont .title_on {
      position:relative;
      display:block;
      width:153px;
      text-align:center;
      z-index:9999;
      padding-top: 48%;
    }
    #section .section .cont .title_on {
      width:413px;
      display:none
    }
    #section .section .cont .layer {
      display:block; 
      width:413px; 
      height:600px; 
      position:absolute; 
      left:0; 
      top:0; 
      z-index:1; 
      background:#333333; 
      filter:alpha(opacity=90); 
      opacity:0.9;
    }

    .bg img,.title_on{
      cursor: pointer;
    }

    .title_on {
      text-decoration: none;
      color: white;
    }
  </style>
</head>
<body>
  <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
  </script>
  <jsp:include page="common/header.jsp"/>
<!-- <div class="container"> </div> -->
  <div id="demo" class="carousel slide" data-ride="carousel">

    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로(사진 변경은 여기서)-->
        <img class="d-block w-100" 
          src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
          alt="First slide">
          <div class="carousel-caption d-none d-md-block">
              <h5>TEST</h5>
              <p>테스트입니다.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
          alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
          alt="Third slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="resources/풍경2.JPG"
          alt="Third slide">
      </div>
    
    <!-- / 슬라이드 쇼 끝 -->

    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <!-- <span>Previous</span> -->
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <!-- <span>Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
      <li data-target="#demo" data-slide-to="3"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>

  <!--중간-->
  <div class="midd">
    <div class="midd-content">
      <h2 style="text-align: center; cursor: pointer;" >HobbyPhoto's Pick</h2>
      <p style="text-align: center;">hobby photo의 사진작가</p>
    </div>

    <div class="pick-area">
      <div class="pick1">
        <img src="resources/images/풍경1.jpg" alt="사진게시판 인기1" width="270" height="200">
        <p style="text-align: center;">닉네임</p>
      </div>
      <div class="pick2">
        <img src="resources/images/풍경2.jpg" alt="사진게시판 인기2" width="270" height="200">
        <p style="text-align: center;">닉네임</p>
      </div>
      <div class="pick3">
        <img src="resources/images/풍경3.jpg" alt="사진게시판 인기3" width="270" height="200">
        <p style="text-align: center;">닉네임</p>
      </div>
      <div class="pick4">
        <img src="resources/images/풍경4.jpg" alt="시진게시판 인기4" width="270" height="200">
        <p style="text-align: center;">닉네임</p>
      </div>
    </div>
  </div>

  <!--하단-->
  <div class="under">
    <div class="under-content">
      <h2 style="text-align: center; cursor: pointer;" >여기저기 콕콕!!</h2> 
      <p style="text-align: center;">hobby photo가 추천하는 명소</p>
    </div>

    <div class="p-area">

      <div id="section">								
  
        <div class="section">

          <div class="cont on">					
            <span class="bg"><img src="resources/images/풍경4.jpg" width="500" height="500" /></span>	
            <span class="title_off"><img src="resources/images/cont_title01_out.png" /></span>
            <span class="title_on">서울 특별시 동대문</span>
            <!-- <span class="layer"></span> -->
          </div>

          <div class="cont">					
            <span class="bg"><img src="resources/images/풍경2.jpg" width="500" height="500"/></span>	
            <!-- <span class="title_off"><img src="img/cont_title02_out.png" /></span>-->			
            <span class="title_on"><a href="#">서울 특별시 동대문</a></span> 
            <!-- <span class="layer"></span> -->
          </div>

          <div class="cont">					
            <span class="bg"><img src="resources/images/풍경3.jpg" width="500" height="500" /></span>	
            <!-- <span class="title_off"><img src="img/cont_title03_out.png" /></span>-->			
            <span class="title_on"><a href="#">서울 특별시 동대문</a></span> 
            <!-- <span class="layer"></span> -->
          </div>

          <div class="cont">					
            <span class="bg"><img src="resources/images/풍경4.jpg" width="500" height="500" /></span>	
            <!-- <span class="title_off"><img src="img/cont_title04_out.png" /></span>-->			
            <span class="title_on">서울 특별시 동대문</span> 
            <!-- <span class="layer"></span> -->
          </div>

          <div class="cont">					
            <span class="bg"><img src="resources/images/풍경1.jpg" width="500" height="500"/></span>	
            <!-- <span class="title_off"><img src="img/cont_title05_out.png" /></span>-->			
            <span class="title_on">서울 특별시 동대문</span> 
            <!-- <span class="layer"></span> -->
          </div>

        </div>
      </div>         
    </div>
  </div>

  <script>
    $(function() {

    $(".section .cont").mouseover(function() {					
        $(".section .cont").stop().animate({width:"153px"}, 900, 'easeOutCirc').removeClass("on");
        $(this).stop().animate({width:"413px"}, 900, 'easeOutCirc').addClass("on");	
    });

    });
  </script>
<jsp:include page="common/footer.jsp"/>
</body>
</html>