<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문조회</title>

<style>

        html, body, div, span, object, iframe, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, menu, nav, output, ruby, section, summary, time, mark, audio, video, input, textarea, button, select {
            margin: 0;
            padding: 0;
        }

        *, *::before, *::after {
            box-sizing: border-box;
        }
        .warp{
            /* border: 1px solid red; */
            width: 1400px;
            /* height: 1500px; */
            margin: auto;
            margin-top: 10px;
            border: none;
        }

        .ord{
            /* border: 1px solid blue; */
            width: 100%;
            height: 5%;
            border: none;
        }

        a{
            text-decoration: none;
            outline: none;
        }

        ol, ul, li{
            list-style: none;
        }

        .css-16ulwnk {
            border-top: 2px solid black;
            width: 1400px;
            margin: auto;
        }
        .css-15hsq6m {
            display: flex;
            padding: 16px 0px;
            border-bottom: 1px solid rgb(228, 228, 228);
        }

        .css-1s7xwmf {
            margin-top: 10px;
        }

        .css-1xbvn6u {
            display: flex;
            border-top: 4px solid black;
        }

        .css-70mbag {
            font-size: 22px;
            color: #000000;
            line-height: 1.5;
            font-weight: 500;
        }

        .css-1up9mh2 {
            padding: 20px;
            font-size: 18px;
            font-weight: 700;
            text-align: center;
            flex: 1 1 0%;
        }

        /* 제목: 배송비*/
        .css-j6y405 {
            padding: 20px;
            font-weight: 700;
            text-align: center;
            width: min(30%, 650px);
            font-size: 18px;
        }

        .css-h62w2d {
            padding: 20px;
            font-size: 18px;
            font-weight: 700;
            text-align: center;
            width: min(20%, 210px);
        }

        .css-17w2nu7 {
            padding: 20px;
            font-size: 18px;
            font-weight: 700;
            text-align: center;
            width: 80px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .css-1afa6oj {
            position: relative;
            color: rgb(0, 0, 0);
            font-weight: bold;
            margin-right: 20px;
        }

        .css-xvv623 {
            font-weight: normal;
        }

        .css-1n8cmho {
            display: flex;
            color: rgb(48, 48, 51);
        }

        .css-1ux6db {
            width: 110px;
            height: 110px;
            margin-right: 20px;
            background-color: rgb(228, 228, 228);
        }

        .css-1ux6db img {
            object-fit: contain;
            width: 100%;
            height: 100%;
        }

        .css-1t02r7v {
            padding: 30px 0px;
            border-bottom: 1px solid black;
        }

        .css-2zqz7m {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
        }

        .css-1pwvd6w {
            font-size: 12px;
            font-weight: bold;
        }

        .css-xl3rnq {
            flex: 1 1 0%;
            word-break: break-all;
            padding-top: 0px;
            width: 700px;
        }

        .css-1k4liyy {
            font-size: 16px;
            font-weight: bold;
            margin-top: 4px;
        }

        .css-78pcur {
            margin-top: 10px;
            font-size: 12px;
        }

        .css-1hq4sz7 {
            margin-top: 10px;
            font-size: 13px;
        }

        .css-r6mp3u {
            width: min(15%, 150px);
        }

        .css-nov509 {
            width: min(20%, 230px);
            font-size: 13px;
            color: rgb(48, 48, 51);
        }

        .css-1ezkxtw {
            font-size: 21px;
            font-weight: bold;
        }

        .css-ltezg3 {
            margin-top: 10px;
            display: inline-block;
        }

        /* 진행 상태  */
        .css-11krjga {
            margin-top: 10px;
            text-decoration: none;
            font-size: 13px;
            color: rgb(93, 93, 93);
            text-align: left;
        }

        button {
            border: 0;
            background: transparent;
            cursor: pointer;
            outline: none;
        }

        .css-1ipxrmg {
            color: rgb(55, 95, 255);
            text-decoration: underline;
        }
        
        .css-z0bnmd {
            width: 80px;
            position: relative;
        }

        .css-15eu6zt {
            flex-direction: column;
            align-items: flex-end;
            position: relative;
            display: flex;
            gap: 5px;
        }

        .css-17afpzj {
            position: relative;
            display: block;
            width: 76px;
            height: 34px;
            font-size: 11px;
            text-align: center;
            line-height: 32px;
            border: 1px solid rgb(48, 48, 51);
            border-radius: 2px;
            color: rgb(255, 255, 255);
            background-color: rgb(48, 48, 51);
        }

        .css-kps8nz {
            position: relative;
            display: block;
            width: 76px;
            height: 34px;
            font-size: 11px;
            text-align: center;
            line-height: 32px;
            border: 1px solid rgb(228, 228, 228);
            color: rgb(93, 93, 93);
            border-radius: 2px;
        }

        .css-k3bvyc {
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            min-width: 40px;
            min-height: 25px;
            position: relative;
            display: block;
            width: 76px;
            height: 34px;
            font-size: 11px;
            text-align: center;
            line-height: 32px;
            border: 1px solid rgb(228, 228, 228);
            color: rgb(93, 93, 93);
            border-radius: 2px;
        }

        .css-1n8i0z9 {
            position: relative;
            display: block;
            width: 76px;
            height: 34px;
            font-size: 11px;
            text-align: center;
            line-height: 32px;
            border: 1px solid rgb(228, 228, 228);
            color: rgb(93, 93, 93);
            border-radius: 2px;
        }

        .css-1nfy9my:first-of-type > .e83jho10 {
            height: 100%;
        }

        .css-y1wkxo {
            width: min(15%, 150px);
            font-size: 14px;
            bottom: 0px;
            right: calc(80px + min(20%, 230px));
            height: calc(100% - 20px);
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
        }

        .css-eftj8f {
            display: none;
            margin-right: 4px;
        }

        .css-1p5eo0s {
            margin-top: 90px;
        }

        article, aside, details, figcaption, figure, footer, header, main, menu, nav, section, summary {
            display: block;
        }

        /* 주문상태 및 취소기간 안내*/
        .css-19disaw {
            font-size: 22px;
            color: #000000;
            line-height: 1.5;
            font-weight: 500;
            padding-bottom: 8px;
            border-bottom: 4px solid #000000;
            width: 1400px;
            margin: auto;
        }

        /* 배송 단계 원*/
        .css-11e07or {
            margin-top: 45px;
            display: flex;
            text-align: center;
            width: 1400px;
            margin: 40px 0 10px 180px;

        }

        .css-14ezdg3 {
            position: relative;
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
            width: 13%;
            margin-right: 4.4%;
        }

        .css-ll140k {
            display: block;
            box-sizing: border-box;
            padding-top: 40%;
            position: relative;
            border-radius: 50%;
            background-color: #000000;
            color: #ffffff;
            font-size: 16px;
            font-weight: normal;
            line-height: 30%;
            width: 120px;
        }

        .css-1lmk1sd{
            /* background-color: #000000; */
            position: absolute;
            left: 0;
            top: 50%;
            width: 100%;
        }
 
        .css-102i0lo {
            margin-top: 10px;
            font-size: 14px;
            line-height: 1.4;
            padding: 0 165px 0 0;

        }
        
        .css-1wcba0h {
            display: flex;
            margin-top: 20px;
        }

        .css-89eo9z {
            flex: 1;
            position: relative;
            padding-top: 25px;
            border-top: 1px solid #303033;
            border-width: 50%;
            font-size: 16px;
            font-weight: 700;
            text-align: center;
            margin-right: 4.4%;
            margin-left: 4.4%;
        }

        .css-yswhfb {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            border: 0;
        }

        .css-9uujfj {
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
            position: relative;
            padding-top: 25px;
            border-top: 1px solid #303033;
            font-size: 16px;
            font-weight: 700;
            text-align: center;
            box-sizing: border-box;
            margin-right: 4.4%;
            margin-bottom: 10px;
        }

        .css-yswhfb {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0,0,0,0);
            white-space: nowrap;
            border: 0;
        }

        .css-1uiii0x {
            position: relative;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding: 35px 0px;
        }
    </style>

</head>
<body>
<!-- olist => 주문번호, 회원번호, 수취인 이름, 수취인 전화번호, 주문날짜, 주문 금액, 상태 ,상품 및 배송 메시지, 주문날짜  -->

<jsp:include page="../common/shopHeader.jsp"/>
	<div class="warp">
        <div class="ord">
            <h1 class="css-70mbag e15zzy280" align="center">주문조회</h1>
        </div>
        
        <selection class="e14xlfu82 css-1s7xwmf eqrs5a00">
            <selection class="css-1xbvn6u eqrs5a01">
                <div class="css-1up9mh2 eqrs5a02">상품정보</div>
                <div class="css-j6y405 eqrs5a03">배송비</div>
                <div class="css-h62w2d eqrs5a04">진행상태</div>
                <div class="css-17w2nu7 eqrs5a05"></div>
            </selection>
            <ol class="eqrs5a06 css-u60zkf e1yx3arz0">
                
                
                
                
                
                
           <c:forEach var="p" items="${ olist }">  
           <c:if test="${p.oorderNo != prevOrderNo}">
           		
           		  
           		
           		
              <input type="hidden" value="${ p.oorderNo }">
                <li class="css-16ulwnk e1c6si9n0">

                   
	                    <div class="css-15hsq6m e1c6si9n1">
	                        <a href="" class="css-1afa6oj e1c6si9n2">
	                            <span class="css-xvv623 e1c6si9n3">주문일자</span>
	                            ${ p.orderDate } <!-- 주문일자 들어가는 자리-->
	                        </a>
	
	                        <a href="" class="css-1afa6oj e1c6si9n2">
	                            <span class="css-xvv623 e1c6si9n3">주문번호</span>
	                            ORD<fmt:parseDate value="${ p.orderDate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${orderDate}" pattern="yyyyMMdd"/>-6400521${ p.oorderNo } <!-- 주문번호 들어가는 자리 -->
	                        </a>
	                    </div>


                    <ul class="e1c6si9n4 css-1t02r7v e13cop140">
                        <li class="css-1nfy9my e83jho12">
                            <ul class="css-0 e3pp3ol0" >

                                <li class="e3pp3ol1 css-2zqz7m e15inpgb0">
                                    <a href="" class="e15inpgb1 css-upe1zs e1gwa9iy0">

                                        <div class="css-1n8cmho e1gwa9iy1">
                                            <div class="css-1ux6db e1gwa9iy2">
                                                <img src="" alt="제품사진자리" loading="lazy">
                                            </div>
                                            <div class="css-xl3rnq e1gwa9iy3">
                                            <p class="css-1pwvd6w e1gwa9iy4">브랜드명</p>
                                            <p class="css-1k4liyy e1gwa9iy5">${ p.PName }</p>
                                            <ul class="css-78pcur e5gez6t0">
                                                <li class="css-1mfx2ad e5gez6t1">[사이즈]ONE SIZE</li>
                                            </ul>
                                            <p class="css-1hq4sz7 e1gwa9iy6">
                                                금액
                                                ${ p.totalPrice }원 / 수량 1개
                                            </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="css-y1wkxo e83jho10">
                                        <span class="css-eftj8f e83jho11">배송비 :</span>
                                        ${ p.totalPrice >= 50000 ? 0 : 3000 }원
                                    </div>
                                        <div class="css-r6mp3u e15inpgb2"></div>
                                        <div class="e15inpgb3 css-nov509 ejqsfj40">
                                            <div class="css-1nzfn4d ejqsfj41">
                                                <p class="css-1ezkxtw ejqsfj42">${ p.ostatus }</p>
                                                <p class="ejqsfj43 css-ltezg3 e1bnten30">2023.10.30</p>
                                            </div>
                                            <button class="css-11krjga ejungq0">
                                                CJ대한통운
                                                <span class="css-1ipxrmg ejungq1">111122223333</span>
                                            </button>
                                        </div>
                                        <div class="e15inpgb4 css-z0bnmd ejlfgoo0">
                                            <div class="css-15eu6zt ejlfgoo1">
                                                <button class="css-17afpzj ejlfgoo2">취소접수</button>
                                                <button type="button" class="css-kps8nz e1289cw30">반품접수</button>
                                                <button class="e12l8ih10 css-k3bvyc e10q62zt1" type="button">교환접수</button>
                                                <a href="" class="css-1n8i0z9 ejlfgoo2">1:1문의</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <c:set var="prevOrderNo" value="${p.oorderNo}" />
							</c:if>


                                
                            </ul>


                    </ul>                    
                </li>
            
               </c:forEach>

            </ol>
        </selection>
    </div>

    <div class="e14xlfu83 css-1uiii0x e1ofwyuu0">
        <ul class="css-16vmvyd e1ofwyuu1">
            <li aria-current="true" class="css-12l5i6f e1ofwyuu2">
            	<c:choose>
        		<c:when test="${ pi.currentPage eq 1 }">
            		<a style="display: none;">이전</a>
            	</c:when>
            	<c:otherwise>
            		<a href="shop.order?cpage=${pi.currentPage-1}">이전</a>
            	</c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            	<a href="shop.order?cpage=${p}">${p}</a>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${ pi.currentPage eq pi.maxPage }">
            		<a style="display: none;">다음</a>
            	</c:when>
            	<c:otherwise>
            		<a href="shop.order?cpage=${pi.currentPage+1}">다음</a>
            	</c:otherwise>
            </c:choose>
            
            </li>
        </ul>
    </div>

    <section class="e15zzy281 css-1p5eo0s e7c1pv50">
        <h4 class="css-19disaw e7c1pv51">주문상태 및 취소기간 안내</h4>
        <ol class="css-11e07or e7c1pv52">
            
            <li class="css-14ezdg3 e7c1pv53">
                <strong class="css-ll140k e7c1pv54">
                    <span class="css-1lmk1sd e7c1pv55">결제완료</span>
                </strong>
                <p class="css-102i0lo e7c1pv56">입금(결제) 확인이 완료되었습니다</p>
            </li>
            
            <li class="css-14ezdg3 e7c1pv53">
                <strong class="css-ll140k e7c1pv54">
                    <span class="css-1lmk1sd e7c1pv55">상품준비중</span>
                </strong>
                <p class="css-102i0lo e7c1pv56">주문하신 상품을 발송할 예정입니다</p>
            </li>          
            <li class="css-14ezdg3 e7c1pv53">
                <strong class="css-ll140k e7c1pv54">
                    <span class="css-1lmk1sd e7c1pv55">배송중</span>
                </strong>
                <p class="css-102i0lo e7c1pv56">상품이 고객님께 배송중입니다</p>
            </li>
            <li class="css-14ezdg3 e7c1pv53">
                <strong class="css-ll140k e7c1pv54">
                    <span class="css-1lmk1sd e7c1pv55">배송완료</span>
                </strong>
                <p class="css-102i0lo e7c1pv56">상품이 주문자에게 전달완료 되었습니다</p>
            </li>
        </ol>
        <section class="css-1wcba0h e7c1pv58">
            <p class="css-89eo9z e7c1pv59">
                <span class="css-yswhfb e7c1pv510">입금대기, 결제완료 일 경우</span>
                    직접취소가능<!-- -->
            </p>
            <p class="css-9uujfj e7c1pv59">
                <span class="css-yswhfb e7c1pv510">상품준비중, 배송시작, 배송중, 배송완료 일 경우</span>
                    취소불가<!-- -->
            </p>
        </section>
    </section>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>