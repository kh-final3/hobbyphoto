<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
    <style>
        .outer_myMeet{
        /* border: 1px solid red; */
        width: 900px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        }

        .container_myMeet1{
            width: 600px;

            
        }
        .container_myMeet2{
            /* border: 1px solid red; */
            background-color: whitesmoke;
            width: 250px;
            height: 250px;
            margin: 110px 10px 10px 30px;
            padding-left: 20px;
            display: block;
        }

        .myMeet2_list li{
            padding: 0 0 0 20px;
            list-style-type: none;
            margin: 20px 0 0 -60px;

        }

        .myMeet2_list li a{
          color: black;
          text-decoration: none;
        }

        .myMeet2_list li:hover{
            cursor: pointer;
            background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
            background-size: 4px 100%;
            font-weight: 600;
            padding: 0 0 0 20px;
        }
        
        .gno{display: none;}
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer_myMeet">
        <div class="container_myMeet2">
            <ul class="myMeet2_list">
                <li><a href="myBookmarks.me">북마크</a></li>
                <li><a href="myBoard.me">게시글</a></li>
                <li><a href="myLike.me">좋아요</a></li>
                <li><a href="myGroup.me">모임</a></li>
                <li><a href="myBlock.me">차단회원</a></li>
            </ul>  
        </div>
        <div class="container_myMeet1">
            <h6 style="margin: 10px 0 0 10px; font-weight: 500;"><img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png"> 마이페이지</h6>
            <h1 style="font-weight: 700;">모임</h1>
            <hr>
            <h5>총 0 건</h5><br><br>
            <div class="container_myMeet0">
                <table class="table table-hover" style="text-align: center;">
                  <thead>
                    <tr>
                      <th>제목</th>
                      <th>모임장</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
	            		<c:when test="${ not empty list }">
	            			<c:forEach var="b" items="${ list }">
				              <tr>
				                <td><span class="gno">${ b.boardNo }</span>${ b.boardTitle }</td>
				                <td>${ b.boardWriter }</td>
				                <td>${ b.createDate }</td>
				              </tr>
	            			</c:forEach>
	            		</c:when>
	            		<c:otherwise>
	            			<tr>
				            	<td colspan="3" class="notFound">게시글이 존재하지 않습니다.</td>
				            </tr>
	            		</c:otherwise>
            		</c:choose>
                  </tbody>
                </table>
              </div>
        </div>
    </div>
    <div class="paging-area" align="center">
	    <c:choose>
			<c:when test="${ pi.currentPage eq 1 }">
				<button disabled> &lt; </button>
			</c:when>
			<c:otherwise>
				<button style="border: 1px solid lightgray; font-weight: bolder;" onclick="location.href='myBoard.me?cpage=${ pi.currentPage - 1 }'">Previous</button>
			</c:otherwise>
		</c:choose>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<button onclick="location.href='myBoard.me?cpage=${ p }'">${ p }</button>
		</c:forEach>
		<c:choose>
			<c:when test="${ pi.currentPage eq pi.maxPage }">
				<button disabled> &gt; </button>
			</c:when>
			<c:otherwise>
				<button onclick="location.href='myBoard.me?cpage=${ pi.currentPage + 1 }'"> &gt;</button>
			</c:otherwise>
		</c:choose>
	</div>
    <script>
    	$(()=>{
    		$(document).on("click", ".table>tbody>tr",function(){
    			location.href="togetherDetail.tg?gno="+ $(this).find(".gno").text();
    		})
    	})
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>