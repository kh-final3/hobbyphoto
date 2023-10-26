<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
         div * {box-sizing: border-box;}
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1200px;
            height: 1400px;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }

        .list-area{
            border: 1px solid white;
            width: 85%;
            height: 90%;
            margin: auto;
            margin-top: 5%;
            background-color: white;
            border-radius: 15px;
        }

        .list{
            border: 1px solid red;
            width: 100%;
            height: 94%;
            border: none;
        }

        .list li{
            list-style: none;
        }

        .ul-area{
            padding-left: 16px;
            margin-top: 10px;
        }

        .photo{
            border: 1px solid black;
            width: 250px;
            height: 150px;
            float: left;
            border-radius: 5%;
        }

        .photo img{
            border-radius: 5%;
        }

        .text{
            border: 1px solid blue;
            width: 650px;
            height: 150px;
            float: left;
            margin-left: 14px;
            border: none;
        }

        .text p{
            margin-top: 0px;
            margin-left: 2px;
            margin-bottom: 8px;
        }

        .li-area{
            cursor: pointer;
            height: 150px;
        }

        .btn-area{
            border: 1px solid black;
            height: 3%;
            width: 10%;
            float: right;
            border: none;
        }

        .btn-area button{
            float: right;
            width: 85px;
            height: 30px;
        }

        .page-btn button{
            width: 45px;
            height: 30px;
        }

        .ect{
            border: 1px solid black;
            height: 3%;
            width: 20%;
            float: left;
            border: none;
            margin-left: 15px;
        }
        
        a{
            text-decoration-line: none;
            color: black;
            font-size: medium;
        }
        
        .text h2{
            margin-top: 0;
            margin-bottom: 2px;
        }
        
        #pagingArea {
            width: fit-content;
            margin: auto;
        }
        
        .pno{
        	display: none;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">

        <div class="list-area">

            <div class="list">

                <!--관리자일때만 보이게 하기  -->
                <div class="btn-area">
                    <button>글쓰기</button>
                </div>
              
                <div class="ect">
                    <a href="sortPlace.pl?keyword=date">최신순</a> | <a href="sortPlace.pl?keyword=best">인기순</a>
                </div>

                <ul class="ul-area">
					<c:if test="${ not empty list }">
						<c:forEach var="p" items="${ list }">
							<hr width="1000px">

		                    <li class="li-area">
		                        <div class="photo">
		                            <img src="${p.pimg1}" alt="" width="250" height="150">
		                        </div>
		
		                        <div class="text">
		                        	<p class="pno">${ p.pno }</p>
		                            <h2 class="title">${ p.ptitle }</h2>
		                            <p class="location">${ p.plocation }</p>
		                            <p class="content">${ p.pcontent }</p>
		                            <p class="content-ect">조회수 : ${ p.count }  &nbsp;&nbsp;&nbsp; 좋아요 : 1 &nbsp;&nbsp;&nbsp;&nbsp; 작성일 : ${ p.createDate }</p>
		                        </div>
		                    </li>
						</c:forEach>
					</c:if>
					

                    <hr width="1000px">

                </ul>
            </div>
        </div>

        <div id="pagingArea">
            <div class="page-btn" align="center">   
                <c:choose>
                    <c:when test="${ pi.currentPage ne 1 }">
                        <button onclick="location.href='list.pl?cpage=${ pi.currentPage - 1 }';"> &lt; </button>
                    </c:when>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <button onclick="location.href='list.pl?cpage=${p}';">${p}</button>
                </c:forEach>
                
                <c:choose>
                    <c:when test="${ pi.currentPage ne pi.maxPage }">
                        <button onclick="location.href='list.pl?cpage=${ pi.currentPage + 1 }';"> &gt; </button>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
     <script>
        $(function(){
        		$(".ul-area>.li-area>.text").click(function(){
            		location.href = 'detail.pl?pno='+ $(this).children(".pno").text();
            		console.log($(this).children(".pno").text());
        		})
        		
        			$(".btn-area").click(function(){
            		location.href = 'enrollForm.pl';
        		})
        	})
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>