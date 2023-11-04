<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
        .outer_my{
        /* border: 1px solid red; */
        background-color: gainsboro;
        width: 1200px;
        height: 900px;
        margin: auto;
        margin-top: 50px;
        }

        /* 마이페이지 제목 */
        #h_my{
            font-weight: 600;
            
        }

        .info_my{
          background-color: white;
          width: 1180px;    
          height: 800px;
          margin: auto;
        }

        .info_my1{
          background-color: gainsboro;
          width: 300px;
          height: 500px;
          float: left;
          top: 30%;
          margin: 32px 20px;
        }

        .info_my2{
          background-color: gainsboro;
          width: 780px;
          float: right;
          margin: 32px 40px 10px 10px;
          height: 260px;
          
        }
        .info_my3{
          /* border: 1px solid red; */
          background-color: gainsboro;
          font-weight: 700;
          width: 780px;
          height: 390px;
          float: right;
          margin: 32px 40px 10px 10px;
          padding: 20px 0 10px 0;
        }

        /* 프로필 div안의 버튼 */
        #btnall_my{
            /* border: 1px solid red; */
            margin: 40px 74px;
        }

        #btn_my1{
            width: 150px;
            height: 35px;
        }

        #btn_my2{
            margin: 10px 0 0 0;
            width: 150px;
            height: 35px;
        }
        
        /* 나의 활동 */
        .info_my3 ul li{
            /* border: 1px solid red; */
            border-radius: 10px;
            background-color: whitesmoke;
            display: inline-block;
            height: 110px;
            width: 130px;
            cursor: pointer;
            margin: 30px 30px 10px 55px;
            padding-top: 5px;
        }
        
        .info_my3 ul li span{
            display: block;
            font-size: 18px;
            letter-spacing: -0.8px;
            text-align: center;
            margin-top: 10px;
        }

        .info_my3 ul li a{
            margin: 10px 5px 5px 40px;
        }

        #list_my{
            background-color: white;
            margin: 5px;
            border-radius: 10px;
            height: 320px;
        }

        .info_my2 tr{
            font-size: larger;
            font-weight: 600;
            /* text-align: left; */
        }

        .info_my2 td{
            font-size: medium;
            padding: 0 0 5px 15px;
            font-weight: 500;
        }
		
		.myPage-update{
			margin-right: 20px;
		}
		
		#follow,#following:hover{
			cursor: pointer;
		}
		
		.followProfile img{
            vertical-align: bottom;
			width: 50px;
			height: 50px;
		}
		
		.follow{
			width: 450px;
			height: 65px;
			padding: 8px 16px;
		}
		.followInfo{width: 275px;}
		
		.follow>div{display: inline-block;}
		.follow div{box-sizing: border-box;}
		.followId{font-size: 16px; font-weight: 700;}
		.followNick{font-size: 14px; color: gray;}
		.btnF{
			background-color: black;
			color:white;
			border-radius: 12px;
			width: 80px; 
			height: 40px;
			vertical-align: bottom;
			font-size: 13px;
			font-weight: 700;
		}
		
		.noFollow{
			font-size: 16px;
			font-weight: 700;
		}
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer_my">
        <br><br>
        <h4 id="h_my" style="margin-left: 30px;"> 마이페이지</h4>

        <div class="info_my">
            <div class="info_my1">
                <img id="profileImg_my" src="resources/images/picture.png" style="width: 200px; height: 200px; margin: 50px;"></img><br>
                <h6 style="font-weight: 600; text-align: center;">반가워요!</h6>
                <h6 style="text-align: center;">${ loginMember.nickName }님</h6>
                <div id="btnall_my">
                    <button type="submit" class="btn btn-sm btn-primary" id="btn_my1" onclick="location.href='logout.me'">로그아웃</button><br>                    
                    <button type="submit" class="btn btn-sm btn-primary" id="btn_my2" onclick ="location.href='updateForm.me'">정보수정</button>
                </div>
            </div>
            <div class="info_my2">
                <br>
                <h style="font-weight: 700; margin: 0 0 5px 10px; font-size: larger;">나의정보</h><br><br>
                <div style="text-align: center;">
                    <table align="center">
                        <tr>
                            <th>닉네임</th>
                            <td>${ loginMember.nickName }</td>
                        </tr>
                        <tr>
                            <th>한줄소개</th>
                            <td>${ loginMember.description }</td>
                        </tr>
                        <tr>
                            <th>팔로우</th>
                            <td><span id="follow">${ countFollow }</span></td>
                        </tr>
                        <tr>
                            <th>팔로워</th>
                            <td><span id="following">${ countFollower }</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="info_my3">
                <h style="font-weight: 700; margin: 0 0 15px 10px; font-size: larger;">나의 활동</h>
                <div id="list_my">
                    <ul>
                        <li onclick="myActivity(1);">
                            <a class="icon1"><img src="resources/images/bookmark-white.png" style="width: 50px; height: 50px;"></a>
                            <span>북마크</span>
                        </li>
                        <li onclick="myActivity(2);">
                            <a class="icon2"><img src="resources/images/noticeboard.png" style="width: 50px; height: 50px;"></a>
                            <span>게시글</span>
                        </li>
                        <li onclick="myActivity(3);">
                            <a class="icon3"><img src="resources/images/coment.png" style="width: 50px; height: 50px;"></a>
                            <span>좋아요</span>
                        </li>
	                    <li onclick="myActivity(4);">
	                        <a class="icon4"><img src="resources/images/interview.png" style="width: 50px; height: 50px;"></a>
	                        <span>모임</span>
	                    </li>
	                    <li onclick="myActivity(5);">
	                        <a class="icon5"><img src="resources/images/block-user.png" style="width: 50px; height: 50px;"></a>
	                        <span>차단 회원</span>
	                    </li>
	                </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
	<div class="modal fade" id="followModal" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">팔로우</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	       	<c:choose>
	       		<c:when test="${ countFollowing eq 0 }">
	       			<br>
	       			<div class="noFollow">팔로우 중인 회원이 없습니다.</div>
	       			<br>
	       		</c:when>
	       		<c:otherwise>
			    	<c:forEach var="a" items="${ follow }">
			    		<div class="follow">
			    			<div class="followProfile">
                                <img src="${a.profileImg}">
                            </div>
                            <div class="followInfo">
                                <div class="followId">${a.followId}</div>
                                <div class="followNick">${a.nickname}</div>
                            </div>
                            <div class="followBtn">
                            	<button type="button" class="btnF">팔로우</button>
                            </div>
			    		</div>
			       	</c:forEach>
	       		</c:otherwise>
	       	</c:choose>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="followingModal" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">팔로워</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	      	<c:choose>
	       		<c:when test="${ countFollow eq 0 }">
	       			<br>
	       			<div class="noFollow">팔로우 중인 회원이 없습니다.</div>
	       			<br>
	       		</c:when>
	       		<c:otherwise>
			    	<c:forEach var="b" items="${ follower }">
			    		<div class="follow">
			    			<div class="followProfile">
                                <img src="${b.profileImg}">
                            </div>
                            <div class="followInfo">
                                <div class="followId">${b.userId}</div>
                                <div class="followNick">${b.nickname}</div>
                            </div>
                            <div class="followBtn">
                            	<button type="button" class="btnF">팔로우</button>
                            </div>
			    		</div>
			       	</c:forEach>
	       		</c:otherwise>
	       	</c:choose>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(document).ready(function(){
			  $("#follow").click(function(){
			    $("#followModal").modal({backdrop: true});
			  });
		});
		
		$(document).ready(function(){
			  $("#following").click(function(){
			    $("#followingModal").modal({backdrop: true});
			  });
		});
		
		$(()=>{
    		$(document).on("click", ".modal-body .follow",function(){
    			location.href="profile.me?userId=" + $(this).find(".followId").text();
            })
    	})
    	
    	function myActivity(num) {
			switch (num) {
			case 1:
				location.href="myBookmarks.me?cpage=1";
				break;
			case 2:
				location.href="myBoard.me?cpage=1";
				break;
			case 3:
				location.href="myLike.me?cpage=1";
				break;
			case 4:
				location.href="myGroup.me?cpage=1";
				break;
			case 5:
				location.href="myBlock.me?cpage=1";
				break;
			}
		}
	</script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>