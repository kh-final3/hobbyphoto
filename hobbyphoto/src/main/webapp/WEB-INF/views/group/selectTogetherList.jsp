<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 게시판</title>
    <!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        .outer{
            width: 1200px;
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            width: 950px; 
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
            overflow: hidden;
            padding-bottom:150px;
        }
       
        .list>div{
            width: 32.8%;
            height: 250px;
            float: left;
            box-sizing: border-box;
            position: relative;
        }
        
        .together{
            /* border: 1px solid black; */
            width: 90%;
            height: 85%;
            position: absolute;
            top: 10; bottom: 0; left: 5; right: 0;
            margin: auto;
            background-color: rgba(202, 240, 248, 0.404);
            border-radius: 10px;
            margin-right: 5px;
            margin-top: 20px
        }

        .together>table{
            width: 100%;
            height: 100%;
            padding: 15px;
            padding-left: 25px;
            border-collapse: inherit;
        }
        tbody>tr{
            font-size: 15px;
            font-weight: bolder;
        }
        
        .together>.end{
            background-color: black;
            border-radius: 5px;
            color: white;
            width: 80px;
            height: 40px;
            line-height: 2.4;
            text-align: center;
            font-size: 18px;
            position: absolute;
            top: 155px;
            left: 200px;
        }
        #title {
            font-weight: bolder;
            letter-spacing: 5px;
            margin-top:100px;
            margin-bottom:60px;
        }
        
        #write-btn{
            width: 100px;
            height: 40px;
        }
    </style>
</head>
<jsp:include page="../common/header.jsp"/>
	<body>
	    <div class="outer">
	        <div class="wrap">
	            <h1 align="center" id="title">모임</h1>
	            <div align="center"><button type="submit" id="write-btn" class="btn btn-secondary">글 작성</button></div>
					<div class="list">
					    <c:forEach var="g" items="${ list }">
					        <div class="together">
					           <input type="hidden" class="gno" value="${ g.groupNo }">
					            <table>
					                <tbody>
					                    <tr height="30" style="font-size: 18px; font-weight: bolder;">
					                        <td>${ g.title }</td>
					                    </tr>
					                    <tr>
					                        <td>${ g.userNo }</td>
					                    </tr>
					                    <tr>
					                        <td>📍 ${ g.location }</td>
					                    </tr>
					                    <tr>
					                        <td>📅 ${ g.grDate }</td>
					                    </tr>
					                    <tr>
					                        <td>🕒 시간</td>
					                    </tr>
					                    <tr>
					                        <td>🙋 ?/${ g.meTotal }명</td>
					                    </tr>
					                </tbody>
					            </table>
					            <div class="end">마감</div>
					        </div>
					    </c:forEach>
					</div>
	        	</div>
	    	</div>
		</body>
	<jsp:include page="../common/footer.jsp"/>
	
	    <script>

        // 게시글 상세보기
	    $(".together").click(function(){
		    let gno = $(this).find(".gno").val();
		    location.href = "togetherDetail.tg?gno=" + gno;
		
	    })

        // 게시글 작성
        $("#write-btn").click(function(){
            location.href="enrollFormView.tg";
        })
    </script>
	
</html>