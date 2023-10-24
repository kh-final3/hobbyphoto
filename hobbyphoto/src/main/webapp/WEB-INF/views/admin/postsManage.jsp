<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>게시글 관리</title>

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

</style>
</head>
<body>
<div class="dashboard">
    <h2>게시물 관리</h2>
            <div id="ad_nav">
                <ul id="ad_navi">
                    <li><a onclick="goFormSubmit(1);">사진게시판</a></li>
                    <li><a onclick="goFormSubmit(2);">장비추천 게시판</a></li>
                    <li><a onclick="goFormSubmit(3);">모임 게시판</a></li>
                    <li><a onclick="goFormSubmit(4);">배경 화면 게시판</a></li>
                </ul>
            </div>
                
    <table id="">
        <thead>
            <tr>
                <th><input type="checkbox" name="" id=""></th>
                <th>게시판 유형</th>
                <th>게시물 제목</th>
                <th>작성자</th>                
                <th>작성일</th>                
                <th align="center">게시물 관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" name="" id="pmPhoto"></td>
                <td>사진게시판</td>
                <td>게시물 1</td>
                <td>게시물 1</td>
                <td>게시물 1</td>
                <td class="button-container">
                    <button onclick="">관리</button>
                    <button onclick="">삭제</button>
                    <button onclick="">수정</button>
                </td>
            </tr>
            <tr>
              <td><input type="checkbox" name="" id="pmEquip"></td>
              <td>장비추천 게시판</td>
              <td>게시물 2</td>
              <td>게시물 2</td>
              <td>게시물 2</td>
              <td class="button-container">
                  <button onclick="">관리</button>
                  <button onclick="">삭제</button>
                  <button onclick="">수정</button>
              </td>
            </tr>
            <tr>
              <td><input type="checkbox" name="" id="pmGetter"></td>
              <td>모임 게시판</td>
              <td>게시물 3</td>
              <td>게시물 3</td>
              <td>게시물 3</td>
              <td class="button-container">
                  <button onclick="">관리</button>
                  <button onclick="">삭제</button>
                  <button onclick="">수정</button>
              </td>
            </tr>
            <tr>
              <td><input type="checkbox" name="" id="pmback"></td>
              <td>배경 화면 게시판</td>
              <td>게시물 4</td>
              <td>게시물 4</td>
              <td>게시물 4</td>
              <td class="button-container">
                  <button onclick="">관리</button>
                  <button onclick="">삭제</button>
                  <button onclick="">수정</button>
              </td>
            </tr>
        </tbody>
    </table>

    <div align="center" class="btn-area">
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
    </div>
    
    <form id="postForm1" action="" method="post">
    	<input type="hidden" name="bno" value="${ b.boardNo }">
    </form>
    
   <form id="postForm2" action="" method="post">
   	    <input type="hidden" name="bno" value="${ b.boardNo }">
   </form>
   
   <form id="postForm3" action="" method="post">
   		<input type="hidden" name="bno" value="${ b.boardNo }">
   </form>
   
   <form id="postForm4" action="" method="post">
   	    <input type="hidden" name="bno" value="${ b.boardNo }">
   </form>

	<script type="text/javascript">
	$(function(){
		$(document).on("click", "#pmPhoto>tbody>tr", function(){
			location.href="myPage.me?mno=" + $(this).children().eq(0).text();
		})
	})
	
	function goFormSubmit(num){
            		
  		if(num == 1){
  			$("#postForm1").attr("action", "#pmPhoto").submit();
  		} else if(num == 2){
  			$("#postForm2").attr("action", "#pmEquip").submit();
  		} else if(num == 3){
  			$("#postForm3").attr("action", "#pmGetter").submit();
  		} else{ 
  			$("#postForm4").attr("action", "#pmback").submit();
  		}
  	}
	
	
	</script>

</div>

</body>
</html>
