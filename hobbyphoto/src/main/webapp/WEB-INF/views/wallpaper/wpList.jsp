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
    .list{
        width: 1300px;
        margin: auto;
        margin-top: 20px;
    }

    .wallpaper{
        width: 400px;
        height: 380px;
        margin: 20px 10px 0px;
        float: left;
        border: 1px solid lightgray;
        border-radius: 10px;
        padding: 8px;
    }

    .img{width: 390px; height: 332px;}
    .img>img{width: 380px; height: 332px; }
    .title{
        width: 380px;
        background-color: black;
        color: white;
        font-size: 20px;
        font-weight: bolder;
        margin-bottom: 5px;
    }
    .wp-content>div{display: block; float: left; display: none;}

    .count{font-size: 14px;}    

    #pagingArea {width: fit-content; margin: auto;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content">
    <br><br>
    <div class="innerOuter" style="padding:5% 15%;">
        <div align="center">
            <h2>배경 화면 공유</h2>
            <h6 style="color: gray;">예쁘고 다양한 배경화면 공유하기!</h6>
        </div>
        <br>
        <c:if test="${ not empty loginMember }">
        	<a href="enrollForm.wp">글쓰기</a>
        </c:if>
            <div class="list">
                <div class="wallpaper">
                    <div class="img">
                        <img src="file.webp">
                    </div>
                    <div class="title" align="center">  
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content" >
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
                <div class="wallpaper">
                    <div class="img">
                        <img src="">
                    </div>
                    <div class="title" align="center">
                        배경화면 제목
                    </div>
                    <div class="wp-content">
                        <div style="width: 240px;">아이디</div>
                        <div class="count">10</div>
                    </div>
                </div>
            </div>
            <br clear="both"><br>
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
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>