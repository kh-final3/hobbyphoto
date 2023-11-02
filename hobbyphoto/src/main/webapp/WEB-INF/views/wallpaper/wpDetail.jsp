<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .innerOuter>img{width: 950px; height: 600px;}
    .Interact{
        width: 950px; 
        height: 30px;
        margin-top: 30px; 
        padding-left: 10px; 
        background-color: black; 
        color: white;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        font-size: 19px;
        font-weight: bolder;
    }
    .it-content{
        border: 1px solid black;
        width: 950px; 
        height: 70px;
        padding: 20px 20px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .it-content>a{margin-right: 10px;}
    .info{
        padding:4px 8px;
        height: 21px;
        margin-right: 10px;
        border: 1px solid black;
        border-radius: 5px;
        font-size: 17px;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 15%;" align="center">
            <h1>제목 들어갈 자리입니다</h1>
            <br>
            <img src="file.webp">
            <div class="Interact" align="left">
                <div>Interact</div>
            </div>
            <div class="it-content" align="left">
                <a class="btn btn-dark btn-sm">배경화면</a>
                <a class="btn btn-dark btn-sm">아이폰</a>
                <a class="btn btn-dark btn-sm">갤럭시</a>
                <a class="btn btn-dark btn-sm">👍 좋아요</a>
                <a class="btn btn-dark btn-sm">❤️ 찜</a>
            </div>
            <div class="Interact" align="left">
                <div>Stats/Info</div>
            </div>
            <div class="it-content" align="left">
                <span class="info btn-dark">admin</span>
                <span class="info btn-dark">👁️‍🗨️ 1</span>
                <span class="info btn-dark">📥 1</span>
                <span class="info btn-dark">👍 10</span>
                <span class="info btn-dark">❤️ 5</span>
                <a class="btn btn-dark btn-sm" style="float:right" href="#">삭제하기</a>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>