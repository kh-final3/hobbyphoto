<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="utf-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
 <link href="resources/css/styles.css" rel="stylesheet" />
 <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<title>게시글 관리</title>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        /* margin-top: 0; */
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        /* height: 115%; */
    }

    .dashboard {
        width: 80%;
        /* border: 1px solid red; */
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-height: 115%;
    }

    h2 {
        color: #333;
        margin-bottom: 25px;
        margin-top: 0px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        margin-top: 20px;
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
    
     #ad_navi{
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 100%;
        display: flex;
        background-color: #ddd;
        margin-top: 40px;

    }

    #ad_navi a:hover {
       font-weight: 1000;
       color: wheat;
       background-color: green;
    }
    
    #ad_navi li {
        float: left;
        text-align: center;
        width: 15%; 
        /* border: 1px solid red; */
        height: 100%;
        width: 100%;
    }

    #ad_navi a {
        text-decoration: none;
        color: rgb(50, 50, 50);
        font-weight: 1000;
        display: block;
        /* height: 100%; */
        line-height: 50px;
        cursor: pointer;
    }
    
        #pagingArea {
        width: fit-content;
        margin: auto;
    }

</style>
</head>
<body>
 <jsp:include page="adminAlert.jsp"/>
 
<div class="dashboard">
    <h2>게시물 관리</h2>
   <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item"><a href="alist.da">Dashboard</a></li>
      <li class="breadcrumb-item active">게시물 관리</li>
  </ol>
  <div class="card mb-4">
      <div class="card-body">
	사이트 내의 모든 게시물을 조회할 수 있는 화면입니다. <br>
		관리할 게시판을 해당 게시판 버튼을 통해 이동하세요.
      </div>
  </div>
            <div id="ad_nav">
                <ul id="ad_navi">
                    <li><a onclick="goFormSubmit(1);">사진게시판</a></li>
                    <li><a onclick="goFormSubmit(2);">장비추천 게시판</a></li>
                    <li><a onclick="goFormSubmit(3);">모임 게시판</a></li>
                    <li><a onclick="goFormSubmit(4);">배경 화면 게시판</a></li>
                </ul>
            </div>
                
    <table id="boardList">
        <thead>
            <tr>
                <th>순번</th>
                <th>게시판 유형</th>
                <th>게시물 제목</th>
                <th>작성자</th>                
                <th>작성일</th>                
                <th align="center">게시물 관리</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach var="b" items="${ list }">
            <tr>
                <td class="bno">${b.boardNo}</td>
                <td>사진게시판</td>
                <td>${b.boardTitle}</td>
                 <td>${b.boardWriter}</td>
                <td>${b.createDate}</td>
                <td class="button-container">
     				<form action="pdelete.bo" method="post">
	                	<input type="hidden" name="boardTitle" value="${ b.boardTitle }">
	                    <button type="submit">삭제</button>
                    </form>
                    <form action="phUpdateForm.bo?phno=${ b.boardNo }" method="post">
                    <input type="hidden" name="phno" value="${ b.boardNo }">
                    <button type="submit">수정</button>
                    
                    </form>
                </td>
            </tr>
            </c:forEach>
            
            <c:forEach var="b" items="${ list2 }">
            <tr>
              <td>${b.boardNo}</td>
              <td>장비추천 게시판</td>
              <td class="bno">${b.boardTitle}</td>
                 <td>${b.boardWriter}</td>
                <td>${b.createDate}</td>
              <td class="button-container">
               <form action="edelete.bo" method="post">
               	  <input type="hidden" name="boardTitle" value="${ b.boardTitle }">
                  <button onclick="submit">삭제</button>
               </form>  
                  <button onclick="">수정</button>
              </td>
            </tr>
            </c:forEach>
            
            <c:forEach var="g" items="${ list3 }">
            <tr>
              <td>${ g.groupNo }</td>
              <td>모임 게시판</td>
              <td class="gno">${g.title}</td>
              <td>${g.userNo}</td>
              <td>${g.createDate}</td>
              <td class="button-container">
               <form action="gdelete.bo" method="post">
               	  <input type="hidden" name="title" value="${ g.title }">
                  <button onclick="submit">삭제</button>
               </form>  
               <form action="phUpdateForm.bo?phno=" method="post">
               		<input type="hidden" name="title" value="${ g.title }">
                  <button onclick="submit">수정</button>
               </form>
              </td>
            </tr>
            </c:forEach>
            
            <c:forEach var="k" items="${ list4 }">
            <tr>
              <td>${k.backNo}</td>
              <td>배경 화면 게시판</td>
              <td class="kno">배경화면</td>
              <td>${k.nickname}</td>
              <td>${k.createDate}</td>
              <td class="button-container">
                  <button onclick="submit">삭제</button>
                  <button onclick="">수정</button>
              </td>
            </tr>
            </c:forEach>
            
        </tbody>
    </table>
            <div id="pagingArea">
                <ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						</c:when>
						<c:otherwise>
		                    <li class="page-item"><a class="page-link" href="plist.bo?cpage=${ pi.currentPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="plist.bo?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="plist.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
    
    <form id="postForm1" action="" method="post">
    	<input type="hidden" name="bno" value="${ b.boardNo }">
    </form>
    
   <form id="postForm2" action="" method="post">
   	    <input type="hidden" name="bno" value="${ b.boardNo }">
   </form>
   
   <form id="postForm3" action="" method="post">
   		<input type="hidden" name="gno" value="${ g.groupNo }">
   </form>
   
   <form id="postForm4" action="" method="post">
   	    <input type="hidden" name="kno" value="${ k.backNo }">
   </form>

	<script type="text/javascript">
	function goFormSubmit(num){
  		if(num == 1){
  			$("#postForm1").attr("action", "plist.bo").submit();
  		} else if(num == 2){
  			$("#postForm2").attr("action", "elist.bo").submit();
  		} else if(num == 3){
  			$("#postForm3").attr("action", "glist.bo").submit();
  		} else{ 
  			$("#postForm4").attr("action", "backlist.bo").submit();
  		}
  	}
	</script>

</div>

</body>
</html>