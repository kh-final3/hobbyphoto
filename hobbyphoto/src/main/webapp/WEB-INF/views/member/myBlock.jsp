<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
        .outer_myBoardList{
        width: 1200px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        }

        .container_myBoardList1{
          width: 900px;

            
        }
        .container_myBoardList2{
            background-color: whitesmoke;
            width: 250px;
            height: 250px;
            margin: 110px 10px 10px 15px;
            padding-left: 20px;
            display: block;
        }

        .myBoardList2_list li{
            padding: 0 0 0 20px;
            list-style-type: none;
            margin: 20px 0 0 -60px;

        }

        .myBoardList2_list li a{
          color: black;
          text-decoration: none;
        }

        .myBoardList2_list li:hover{
            cursor: pointer;
            background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
            background-size: 4px 100%;
            font-weight: 600;
            padding: 0 0 0 20px;
        }
</style>	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer_myMeet">
        <div class="container_myMeet2">
            <ul class="myMeet2_list">
                <li><a href="#">북마크</a></li>
                <li><a href="#">게시글</a></li>
                <li><a href="#">댓글</a></li>
                <li><a href="#">모임</a></li>
                <li><a href="#">차단회원</a></li>
            </ul>  
        </div>
        <div class="container_myMeet1">

            <h6 style="margin: 10px 0 0 10px; font-weight: 500;"><img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png"> 마이페이지</h6>
            <h1 style="font-weight: 700;">모임</h1>
            <hr>
            <h5>총 0 건</h5><br><br>
            <div class="container_myMeet0">
                <table class="table table-hover" style="text-align: center;">
                  <thead>
                    <tr>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>날씨(●'◡'●)가 좋아 올리는 사진</td>
                      <td>admin</td>
                      <td>2023-10-11</td>
                    </tr>
                    <tr>
                      <td>햇살이 좋아 올리는 글☀️</td>
                      <td>user01</td>
                      <td>2023-10-11</td>
                    </tr>
                    <tr>
                      <td>따듯해서 공유하는 공원🚵‍♂️ 출사 사진</td>
                      <td>user02</td>
                      <td>2023-10-11</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>