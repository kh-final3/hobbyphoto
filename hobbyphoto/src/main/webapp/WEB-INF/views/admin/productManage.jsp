<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .dashboard {
            width: 80%;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            margin-top: 0px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-right: 5px;
        }

        button:hover {
            background-color: #45a049;
        }
  
        input[type="checkbox"] {
            margin-right: 5px;
        }

        .button-container {
            display: flex;
        }
        table {
            margin-left: auto;
            margin-right: auto;
        }

        .btn-area button{
            background-color: rgba(0, 0, 0, 0.6);
        }

        .btn-area button:hover{
            background-color: lightgray;
        }

    </style>

</head>
<body>
 <jsp:include page="adminAlert.jsp"/>
<div class="dashboard">
        <h2>상품 관리</h2>

        <a href="proenro.from">등록</a>  /

        <a href="alist.da">관리자 페이지</a>
        
		
        <table id="protable">
            <thead>
                <tr>
                    <th><input type="checkbox" name="" id=""></th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>재고수량</th>
                    <th>상품 관리</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="p" items="${ plist }">
            	
	                <tr>
	                	<input type="hidden" name="thumbnail" value="${ p.thumbnail}">
	                    <td><input type="checkbox" name="" id=""></td>
	                    <td>${ p.PNo }</td>
	                    <td>${ p.PName }</td>
	                    <td>${ p.amount }</td>
	                    <td class="button-container">
	                        <button onclick="selectProductdetail(${p.PNo})">상세</button>
	                        <button onclick="updateProduct(${p.PNo})">수정</button>
	                        <button onclick="admindedelete(${p.PNo} ,'${ p.thumbnail }')">삭제</button>
	                    </td>
	                </tr>
                </c:forEach>
                
            </tbody>
        </table>
		
		
        <div align="center" class="btn-area">
        
        	<c:choose>
        		<c:when test="${ pi.currentPage eq 1 }">
            		<a style="display: none;">이전</a>
            	</c:when>
            	<c:otherwise>
            		<a href="plist.pr?cpage=${pi.currentPage-1}">이전</a>
            	</c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            	<a href="plist.pr?cpage=${p}">${p}</a>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${ pi.currentPage eq pi.maxPage }">
            		<a style="display: none;">다음</a>
            	</c:when>
            	<c:otherwise>
            		<a href="plist.pr?cpage=${pi.currentPage+1}">다음</a>
            	</c:otherwise>
            </c:choose>
            
            
        </div>

    </div>
    <script>
    
    function selectProductdetail(pNo){
    	location.href="adminPro.de?pNo="+pNo;
    }
    function admindedelete(pNo, thumbnail){
        location.href="adminPro.delete?pNo="+pNo+"&thumbnail="+thumbnail;
    }
    function updateProduct(pNo){
    	location.href="adminPro.updateForm?pNo="+pNo;
    }
 
    </script>
    

</body>
</html>
