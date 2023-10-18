<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>

	<Style>
	    #banner{
	        width: 1400px;
	        height: 450px;
	        border: 1px solid black;
	        margin: auto;
	        background-image: url(bg_cat_camera.jpg);
	        background-size: 1400px;
	        color: white;
	    }
	
	    #category{
	        width: 1400px;
	        height: 60px;
	        border: 1px solid black;
	        margin: auto;
	        margin-top: 10px;
	        background-color: black;
	        color: white;
	    }
	
	    .list{
	        width: 1300px;
	        margin: auto;
	        margin-top: 20px;
	        cursor: pointer;
	    }
	
	    .product{
	        width: 310px;
	        height: 380px;
	        border: 1px solid lightgray;
	        border-radius: 20px;
	        padding: 20px;
	        margin: 70px 36px 0px;
	        float: left;
	    }
	
	    .img{
	        width: 310px;
	        height: 310px;
	    }
	    .img>img{
	        width: 310px;
	        height: 310px;
	    }
	    .text{
	        border-top: 1px solid lightgray;
	        padding-top: 20px;
	        font-size: 20px;
	        font-weight: bolder;
	    }
	</Style>

</head>
<body>

	<jsp:include page="../common/shopHeader.jsp"/>

		<div id="banner" align="center">
		        여기는 배너입니다.
		    </div>
		    <div id="category" align="center">
		        여기는 카테고리입니다.
		    </div>
		
		    <div class="list">
		    
		    	<c:forEach var="p" items="${ list }">
		        <div class="product" id="clickpro">
		            <input type="hidden" name="pNo" class="pNo" value="${ p.PNo }">
		            <div class="img">
		                <img src="${ p.thumbnail }">
		            </div>
		            <div class="text">
		                ${ p.PName }
		            </div>
		        </div>
		        
		        </c:forEach>
		        
		        
		    </div>
		    
		    <script>
		    	$(function(){
		    		$(".product").click(function(){
		    			location.href='detail.pro?pno='+$(this).children(".pNo").val();
		    		})
		    	})
		    </script>

</body>
</html>