<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<style>
	    #ff1{font-family: 'NanumBarunGothicExtraLight';}
	    #ff2{font-family: 'NanumBarunGothicLight';}
	    #ff3{font-family: 'NanumBarunGothic';}
	    #ff4{font-family: 'NanumBarunGothicBold';}
	
	    #write{
	        width: 1200px;
	        margin: auto;
	        margin-bottom: 100px;
	        margin-top:100px;
	    }
	
	    #write1, #write2, #write3, #write4, 
	    #write5, #write6, #write7, #write8, 
	    #write9, #write10, #write11, #write12{
	        width: 650px;
	        margin: 0 auto;
	    }
	
	    #searchimg{
	            position: absolute;
	            right: 460px;
	            /* float: right; */
	            margin: 12px 0 0 0;
	            width: 15px;
	            height: 15px;
	            cursor: pointer;
	        }
	
	    #mtinput{
	       float: right;
	    }
	
	    #top{width: 50px; height: 50px;}
	
	    #dateIn{
	        width: 650px;
	    }
	
	    input[type="number"]{
	        width: 50px;
	    }
	
		#ttl {
            font-weight: bolder;
            letter-spacing: 5px;
            margin-top:100px;
            margin-bottom:60px;
	    }
	    .uploadimg {
	    	width: 650px;
	    }
	</style>
</head>
<jsp:include page="../common/header.jsp"/>
	<body>
	    <div id="write">
	    	 <h1 align="center" id="ttl">모임 작성</h1>
	        <form action="tgInsert.tg" method="post" enctype="multipart/form-data">
	        	<input type="hidden" name="userNo" value="${ loginMember.userNo }">
	            	<div id="write1">
	                	<p id="ff4">모임홍보사진 <em style="color: red;">*</em></p>
	                	<div class="uploadimg">
	                    	<img id="titleImg" width="650" height="170" onclick="chooseFile(1);">
	                    	<div id="file-area" style="display:none">
	                        	<input type="file" name="upfile" id="file1" onchange="loadImg(this, 1);" required>
	                    	</div>
	                	</div>
	            		<br>
	            	<div id="write2">
	                	<label id="ff4">제목</label><em style="color: red;">*</em><br><input type="text" name="title" style="width: 645px; margin: 5px 0 0 0;" maxlength="18" required>
	            	</div>
	            	<br>
		            <div id="write3">
		                <label id="ff4">내용</label><em style="color: red;">*</em><br><textarea name="content" cols="71" rows="8" style="resize: none;" required></textarea>
		                <br>
		            </div>
		            <br>
		            <div id="write4">
		                <hr>
		                <span id="ff4">모집인원<em style="color: red;">*</em></span>
		                <br>
		                <select name="meTotal" required>
		                    <option value="100">제한없음</option>
		                    <option value="2">2명</option>
		                    <option value="3">3명</option>
		                    <option value="5" selected>5명</option>
		                    <option value="7">7명</option>
		                    <option value="10">10명</option>
		                </select>
		            </div>
		            <div id="write5">
		                <hr>
		                <span id="ff4">📍 장소<em style="color: red;">*</em></span>
		                <br><input type="text" name="location" style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 한강" required>
		            </div>
		            <br>
		            <div id="write7">
		                <hr>
		                <span id="ff4">📅 날짜<em style="color: red;">*</em></span><br>
		                <input type="date" name="grDate" id="dateIn" required>
		                <hr>
		            </div>
		                <div id="write8">
		                    <span id="ff4">🕒 시간<em style="color: red;">*</em></span><br><br>
		                    <input type="radio" name="ampm" id="time1" value="오전" required><label for="time1">오전</label><br>
		                    <input type="radio" name="ampm" id="time2" value = "오후"><label for="time2">오후</label>
		                    <br><input type="number" name="time" min="1" max="12" required> 시<br><br>
		                    <hr>
		                </div>
		            <br>
		            <div align="right" id="write12">
		                <button type="reset" class="btn btn-light" id="ff4">취소</button>
		                <button type="submit" class="btn btn-primary" id="ff4">등록</button>
		            </div>
		            <div id="topbtn">
		                <a style="display:scroll; position:fixed; bottom:10px; right:5px;" href="#" title="top">
		                    <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top" alt="">
		                </a> 
		            </div>
	        	</form>
	   		</div>
	    <script>
	        function chooseFile(num) {
	                    $("#file" + num).click();
	                }
	                function loadImg(inputFile, num) {
	                    if (inputFile.files.length == 1) {
	                        const reader = new FileReader();
	                        reader.readAsDataURL(inputFile.files[0]);
	                        reader.onload = function (e) {
	                            switch (num) {
	                                case 1: $("#titleImg").attr("src", e.target.result); break;
	                            }
	                        }
	                    } else {
	                        switch (num) {
	                            case 1: $("#titleImg").attr("src", null); break;
	                        }
	                    }
	                }
	    </script>
	</body>
<jsp:include page="../common/footer.jsp"/>
</html>