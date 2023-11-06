<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        ol, ul {
            list-style: none;
        }

        body {
            font-family: 'NanumSquare', sans-serif;
            overflow-x: hidden;
        }

        body.fixed {
            overflow: hidden;
        }

        .container {
            width: 1400px;
            margin: 0 auto;
        }

        img {
            vertical-align: middle;
        }

        .desc_txt {
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 0;
            line-height: 0;
            overflow: hidden;
            visibility: hidden;
            font-size: 0;
        }

        select {
            -moz-appearance: none;
            -webkit-appearance: none;
            appearance: none;
        }

        select::-ms-expand {
            display: none
        }

        .font_spoqa {
            font-family: 'SpoqaHanSansNeo';
        }

        #wrap {
            overflow-x: hidden;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul {
            display: flex;
            padding: 0;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li {
            width: 50%;
            border-top: 1px solid #dadada;
            border-right: 1px solid #dadada;
            border-bottom: 1px solid #7989d9;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li a {
            display: block;
            width: 100%;
            height: 60px;
            line-height: 60px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            color: #666;
            font-family: 'SpoqaHanSansNeo';
            background: #f6f6f6;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li.on {
            border-left: 1px solid #7989d9;
            border-top: 1px solid #7989d9;
            border-bottom: 1px solid #fff;
            border-right: 1px solid #7989d9;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li.on a {
            background: #fff;
            color: #7989d9;
        }
        body {
            font-family: 'NanumBarunGothic', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 50px 0;
        }

        .pf_list_box {
            margin: auto;
            display: flex;
            width: 1110px;
            border: 1px solid #dadada;
            margin-bottom: 20px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .imgbox {
            width: 200px;
            height: 230px;
            border-right: 1px solid #dadada;
            background-size: cover;
            background-position: center;
        }

        .imgbox img{
            width: 200px;
            height: 230px;
        }

        .txtbox {
            display: flex;
            flex-direction: column;
            padding: 20px;
            border-radius: 5px;
            flex-grow: 1;
        }

        .txtbox h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .txtbox ul {
            list-style: none;
            padding: 0;
        }

        .txtbox li {
            font-size: 15px;
            margin-bottom: 5px;
        }

        .pf_btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .view_btn {
            border: 1px solid #dadada;
            color: black;
            padding: 5px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s; 
        }

        .view_btn:hover {
            font-weight: bold;
           /*  border: 1px solid #000; */
            background-color: #dadada;
            text-decoration: none;
        }

        .pf_list_box:hover, .card:hover {
            box-shadow: 0 0 20px rgba(25, 27, 79, 0.5);
            transition: all 0.3s;
        }

        .card-img-top {
            height: 300px;
        }
        
        .enrollForm{
        float: right;
        }

	    /* 페이징바 */
	    .paging-area>button{
	            border: none;
	            background-color: white;
	            width: 35px;
	            height: 35px;
	            margin-top: 20px;
	    }
	    a:hover {
		    text-decoration: none;
		    border:none;
		}
	    

    </style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <br>
        <h2 align="center">축제</h2>
        <br>
        <div class="content">
            <div class="performance_wrap">
                <div class="container">
                    <div class="pf_schedule">
                        <div class="pf_sche_tab">
                            <ul class="tab_ul">
                                <li class="on"><a style="text-decoration: none;" href="festivalList.fs">축제</a></li>
                                <li><a style="text-decoration: none;" href="exhibitList.fs">전시</a></li>
                            </ul>
                        </div>
                    </div>
                    <c:if test="${ loginMember.userNo eq 1}">
                        <a class="enrollForm btn btn-secondary" href="cultureEnrollForm.fs">글작성</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="containers">
    <c:if test="${ not empty list }">
		<c:forEach var="fe" items="${ list }">
	    	<div class="pf_list_box">
	            <div class="imgbox">
                    <img src="${ fe.timg }">
	            </div>
	            <div class="txtbox">
	                <h3>${ fe.feTitle }</h3>
	                <ul>
	                    <li><b>기 간</b> ${ fe.feDate }</li>
	                    <li><b>장 소</b> ${ fe.feLocation }</li>
	                  
	                    <c:choose>
                       		<c:when test="${ not empty fe.cash }">
                            	  <li><b>가 격</b> ${ fe.cash }</li>
                       		</c:when>
                       		<c:otherwise>
                            	  <li><b>가 격</b> 프로그램별 상이</li>
                       		</c:otherwise>
                       	</c:choose>
                       	<li><b>이용대상</b> ${ fe.age }</li>
	                </ul>
	                <div class="pf_btn">
	                    <br>
	                    <a href="cultureDetail.fs?feNo=${ fe.feNo }" seq="2221" class="view_btn">상세보기</a>
	                </div>
	            </div>
	        </div>
    	</c:forEach>
    </c:if>
    </div>
            <!--festivalList.fs-->
            <div class="paging-area" align="center">   
                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                        <button disabled> &lt; </button>
                    </c:when>
                    <c:otherwise>
                        <button style="width:70px" onclick="location.href='festivalList.fs?cpage=${ pi.currentPage - 1 }'"> &lt; </button>
                    </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <button onclick="location.href='festivalList.fs?cpage=${ p }'">${ p }</button>
                </c:forEach>
                
                <button onclick="location.href='festivalList.fs?cpage=${ p }'">${ p }</button>
                
                   <c:choose>
                       <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <button disabled>&gt;</button>
                       </c:when>
                     <c:otherwise>
                         <button onclick="location.href='festivalList.fs?cpage=${ pi.currentPage + 1 }'">&gt;</button>
                       </c:otherwise>
                </c:choose>
            </div>
    <script>
    
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>
