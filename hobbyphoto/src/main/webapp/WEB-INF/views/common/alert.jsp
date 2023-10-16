<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
<div class="container">
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      예시 버튼
    </button>
	    <!-- The Modal -->
	    <div class="modal" id="myModal">
	      <div class="modal-dialog">
	        <div class="modal-content">
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title">알림</h4>
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	          <!-- Modal body -->
	          <div class="modal-body">
	            <div id="alert1">
	                <img src="../../resources/images/picture.png" style="width: 30px; height: 30px; position: fixed; left: 645px;">
	                ***님의 댓글 : 안녕하세요 <br>
	                2023-10-11 01:11
	            </div><br>
	            <div id="alert2">
	                <hr>
	                <img src="../../resources/images/picture.png" style="width: 30px; height: 30px; position: fixed; left: 645px;">
	                ***님의 댓글 : 안녕하세요 <br>
	                2023-10-11 01:11
	            </div><br>
	            <div id="alert3">
	                <hr>
	                <img src="../../resources/images/picture.png" style="width: 30px; height: 30px; position: fixed; left: 645px;">
	                ***님의 댓글 : 안녕하세요 <br>
	                2023-10-11 01:11
	            </div><br>
	            <!-- 알람이 없을 경우 -->
	            <h6> 0개의 새 알림이 있습니다.</h6>
	          </div>
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	          </div>
	        </div>
	      </div>
	    </div>
  	  </div>
    </body>
</html>