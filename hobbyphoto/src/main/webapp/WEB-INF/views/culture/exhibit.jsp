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
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
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
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 50px 0;
        }

        body.fixed {
            overflow: hidden;
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
        
        .pf_list_box {
            display: flex;
            border: 1px solid #dadada;
            margin-bottom: 20px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .imgbox {
            width: 230px;
            border-right: 1px solid #dadada;
            background-size: cover;
            background-position: center;
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
            border: 1px solid #000;
            background-color: #dadada;
        }

        .pf_list_box:hover, .card:hover {
            box-shadow: 0 0 20px rgba(25, 27, 79, 0.5);
            transition: all 0.3s;
        }

        .card-img-top {
            height: 300px;
        }

        .exhibit {
            width: 1460px;    
            display: flex;
            flex-wrap: wrap; 
            justify-content: center; 
            align-items: flex-start; 
            margin: auto;
        }

        .card {
            margin: 4px;
            width: 25%; 
            height: 510px;
            box-sizing: border-box;
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
       
    </style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>

    <div class="wrap">
            <br>
            <h2 align="center">전시</h2>
            <br>
        <div class="content">
            <div class="performance_wrap">
                <div class="container">
                    <div class="pf_schedule">
                        <div class="pf_sche_tab">
                            <ul class="tab_ul">
                                <li><a href="festivalList.fs">축제</a></li>
                                <li class="on"><a href="exhibitList.fs">전시</a></li>
                            </ul>
                        </div>
                    </div>
                    <a class="enrollForm btn btn-secondary" href="cultureEnrollForm.fs">글쓰기</a>
                </div>
            </div>
        </div>
    </div>

    <div class="exhibit">
     <c:if test="${ not empty list }">
			<c:forEach var="fe" items="${ list }">
	        <div class="card">
		            <img class="card-img-top"
		                src="${ fe.timg }" alt="Card image">
		            <div class="card-body">
		                <h4 class="card-title">${ fe.feTitle }</h4>
		                <p class="card-text">기 간${ fe.feDate }</p>
		                <a href="cultureDetail.fs?feNo=${ fe.feNo}" class="btn btn-primary">자세히보기</a>
		            </div>
		        </div>
        	</c:forEach>
    	</c:if>
    </div>
		            <div class="paging-area" align="center">
		            	<c:choose>
		            		<c:when test="${ pi.currentPage eq 1 }">
		                		<button disabled> &lt; </button>
		                	</c:when>
		                	<c:otherwise>
		                		<button style="width:70px" onclick="location.href='exhibitList.fs?cpage=${ pi.currentPage - 1 }'">Previous</button>
		                	</c:otherwise>
		                </c:choose>
		                
		                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <button onclick="location.href='exhibitList.fs?cpage=${ p }'">${ p }</button>
		                </c:forEach>
		                
		                <button onclick="location.href='exhibitList.fs?cpage=${ p }'">${ p }</button>
		                
		               	<c:choose>
		                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<button onclick="location.href=''" disabled>Next</button>
		                   	</c:when>
		                     <c:otherwise>
		                     	<button style="width:40px;" onclick="location.href='exhibitList.fs?cpage=${ pi.currentPage + 1 }'">Next</button>
		                   	</c:otherwise>
		                </c:choose>
		                
		                <button> &gt; </button>
            		</div>
     <script>
      
    </script>

<jsp:include page="../common/footer.jsp"/>
    
</body>

</html>
