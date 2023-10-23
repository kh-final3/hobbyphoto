<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content{
            width: 1300px;
            margin: auto;
            margin-top: 30px;
        }

        #boardList {
            text-align: center;
        }
        
        #boardList>tbody>tr:hover {
            cursor: pointer;
        }
        
        #pagingArea {
            width: fit-content;
            margin: auto;
        }
        
        #searchForm {
            width: 500px;
        }
        
        #searchForm>* {
            float: left;
            margin: 5px;
        }
        
        .select {
            width: 100px;
        }
        
        .text {
            width: 300px;
        }
        
        .searchBtn {
            Width: 60px;
        }
    </style>
</head>
<body>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <div align="center">
                <h2>장비 추천</h2>
                <h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
            </div>
            <br>
            <div align="right">
                <form id="searchForm" action="" method="get">
                    <div class="select">
                        <select class="custom-select" name="condition">
                            <option value="writer">작성자</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <div class="text">
                        <input type="text" class="form-control" name="keyword">
                    </div>
                    <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                </form>
            </div>  
            <br></br>
				<table id="boardList" class="table table-hover" align="center">
				    <thead>
				        <tr>
				            <th>글번호</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>조회수</th>
				            <th>작성일</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:set var="listSize" value="${fn:length(list)}" />
				        <c:forEach var="b" items="${list}" varStatus="status">
				            <c:set var="reverseIndex" value="${listSize - status.count + 1}" />
				            <tr class="clickable-row">
				                <td>${reverseIndex}</td>
				                <td>${b.boardTitle}</td>
				                <td>${b.boardWriter}</td>
				                <td>${b.count}</td>
				                <td>${b.createDate}</td>
				                <!-- Use reverseIndex here -->
				                <input type="hidden" class="phno" value="${reverseIndex}">
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
				<br><br>
				<script>
				    $(document).ready(function() {
				        $('#boardList tbody').on('click', 'tr', function() {
				            var phno = $(this).find('.phno').val();
				            window.location.href = 'rcDetail.bo?phno=' + phno;
				        });
				    });
				</script>

            	<a class="btn btn-secondary btn-sm" style="float:right" href="rcEnrollForm.bo">글쓰기</a>
			           <div id="pagingArea">
			               <ul class="pagination">
			                    <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
			                   	<li class="page-item"><a class="page-link" href="">1</a></li>
			                   	<li class="page-item"><a class="page-link" href="">2</a></li>
			                   	<li class="page-item"><a class="page-link" href="">3</a></li>
			                   	<li class="page-item"><a class="page-link" href="">4</a></li>
			                   	<li class="page-item"><a class="page-link" href="">5</a></li>
			                    <li class="page-item"><a class="page-link" href="">Next</a></li>
			               </ul>
			           </div>
            		<br clear="both"><br>
            	<br><br>
        	</div>
        <br><br>
    </div>
</body>
</html>