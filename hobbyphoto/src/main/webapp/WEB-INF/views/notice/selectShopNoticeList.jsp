<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .outer_myBoardList{
        /* border: 1px solid red; */
        width: 1200px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        }
        .container_myBoardList1{
          width: 900px;
        }
        .container_myBoardList2{
            /* border: 1px solid red; */
            background-color: whitesmoke;
            width: 250px;
            height: 250px;
            margin: 110px 10px 10px 15px;
            padding-left: 20px;
            display: block;
        }
        .myBoardList2_list li{
            padding: 0 0 0 20px;
            list-style-type: none;
            margin: 20px 0 0 -60px;
        }
        .myBoardList2_list li a{
          color: black;
          text-decoration: none;
        }
        .myBoardList2_list li:hover{
            cursor: pointer;
            background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
            background-size: 4px 100%;
            font-weight: 600;
            padding: 0 0 0 20px;
        }
        h6 img{
        	width:80px;
        	height:20px;
        }
    </style>
</head>
<jsp:include page="../common/shopHeader.jsp"/>
<body>
    <div class="outer_myBoardList">
      <div class="container_myBoardList2">
        <ul class="myBoardList2_list">
            <li><a href="#">전체</a></li>
            <li><a href="#">고객서비스</a></li>
            <li><a href="#">안전거래</a></li>
            <li><a href="#">위해상품</a></li>
            <li><a href="#">이벤트당첨</a></li>
        </ul>  
      </div>

      <div class="container_myBoardList1">
        <h6 style="margin: 10px 0 0 10px; font-weight: 500;"><img src="resources/images/logo.png"> 쇼핑몰</h6>
        <h1 style="font-weight: 700;">공지사항</h1>
        	<div style="width: 850px;" align="right">
        	<c:if test="${ loginMember.userNo eq 1 }">
	            <a href="shEnrollForm.no" class="btn btn-light" id="btn_th">글작성</a>
	        </c:if>    
	        </div>
        <hr>
        <h>총 ${ pi.listCount } 건</h>
        <br><br>
        <div class="container_myBoardList0">
          <table class="table table-hover" style="text-align: center;">
            <thead>
              <tr>
              	<th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody>
		        <c:set var="listSize" value="${fn:length(list)}" />
		        <c:forEach var="n" items="${list}" varStatus="status">
		            <c:set var="reverseIndex" value="${listSize - status.count + 1}" />
		            <tr class="clickable-row">
		                <td>${ reverseIndex }</td>
		                <td>${ n.noticeTitle }</td>
		                <td>${ n.noticeWriter }</td>
		                <td>${ n.count }</td>
		                <td>${ n.createDate }</td>
		               <input type="hidden" class="shno" value="${n.noticeNo}" />
		            </tr>
		        </c:forEach>
            </tbody>
          </table>
        </div>
            <script>
            	$(document).ready(function() {
            		$('.table-hover > tbody').on('click', 'tr', function() {
	                    var shno = $(this).find('.shno').val();
	                    window.location.href = 'shDetail.no?shno=' + shno;
	                });
	            });
            </script>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>