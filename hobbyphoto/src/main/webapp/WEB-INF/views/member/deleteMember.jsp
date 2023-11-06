<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">


    <style>
        .wrap{width: 1200px;}
        #unregister{margin:auto; width: 500px;}
        #res{border-top: 1px solid rgb(160, 160, 160); padding: 20px 10px;}
        .delete_title{background-color: #303033; color: white; height: 130px; padding: 65px 20px 15px;}
        .delete_content{padding: 20px;}
        ul{padding: 0;}
        ul>li{margin-bottom: 3px; list-style-type: none;}
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<c:if test="${ not empty alertMsg }">
	      <script>
	         alert("${alertMsg}");
	      </script>
	      <c:remove var="alertMsg" scope="session"/>
	</c:if>
	<div class="warp">
        <div id="unregister">
            <br>
            <div class="delete_title">
           	 <h1>회원탈퇴</h1>
            </div>
            
            <div class="delete_content">
            <br>
            <h3>${ loginMember.userName }님</h3>
            <br>
            <h5><b>회원탈퇴 전 유의사항을 확인해주세요.</b></h5>
            <br>
            <ul>
                <li>탈퇴 시 회원님이 삭제하지 않은 게시물은 삭제되지 않습니다. </li>
                <li>한번 탈퇴한 아이디는 다시 사용이 불가합니다.</li> 
                <li>일부 정보에 대해서는 부정이용 방지 및 관계 법령의 규정에 <br> 의하여 1년간 보관합니다. </li>
            </ul>
            <br>
	            <h5><b>탈퇴 사유 선택</b></h5>
	            <br>
	            <div id="res">
	                <div>
	                    <input type="radio" name="reason" id="useoften" value="U" onclick='checkOnlyOne(this)'> <label for="useoften">사용 빈도가 낮거나 나에게 필요한 정보가 없어서</label><br>
	                    <input type="radio" name="reason" id="many" value="M" onclick='checkOnlyOne(this)'> <label for="many">가입한 사이트가 많아서</label><br>
	                    <input type="radio" name="reason" id="securityissue" value="S" onclick='checkOnlyOne(this)'> <label for="securityissue">개인정보 유출 방지 등 보안 상의 문제</label><br>
	                    <input type="radio" name="reason" id="other" value="O" onclick='checkOnlyOne(this)'> 기타<br>
	                    <pre><textarea cols="50" rows="5" style="resize: none;" placeholder="내용을 입력해주세요"></textarea></pre>
	                    <button type="button" class="btn btn-secondary" style="width: 425px; height: 50px;" id="btn1" data-toggle="modal" data-target="#deleteModal">탈퇴하기</button>
	                    <br><br>
	                </div>
	
	                <!-- 회원 탈퇴용 Modal -->
	                <div class="modal" id="deleteModal">
	                    <div class="modal-dialog">
	                        <div class="modal-content">
	            			
	                            <!-- Modal Header -->
	                            <div class="modal-header">
	                                <h4 class="modal-title">회원탈퇴</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                            </div>
	                    
	                            <!-- Modal body -->
	                            <div class="modal-body" align="center">	
	                                <form action="delete.me" method="post">
	                                <b >탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
	                        
	                                    <input type="hidden" name="userId" value="${ loginMember.userId }">
	                                    <span>
	                                        비밀번호 : <input type="password" name="userPwd" required style="width: 200px; height: 30px;"> <br><br>
	                                    </span>
	                                    <button type="submit" class="btn btn-sm btn-danger">탈퇴하기</button>
	                                </form>
	                            </div>
	                        </div>
	                    </div> 
	                </div>
	            </div>
	        </div>
        </div>    
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>