<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer_profile{
        background-color: black;
        border-radius: 10px;
        width: 1200px;
        height: 900px;
        margin: auto;
        margin-top: 50px;
        }

        /* 마이페이지 제목 */
        #h_profile{
            font-weight: 600;
            
        }

        .info_profile{
          background-color: white;
          border-radius: 10px;
          width: 1180px;    
          height: 800px;
          margin: auto;
        }

        .info_profile1{
          width: 300px;
          height: 500px;
          float: left;
          top: 30%;
          margin: 20px 20px;
        }

        .info_profile2{
          padding-left : 16px;
          padding-top : 17px;
          border: 1px solid black;
          border-radius: 15px;
          width: 780px;
          float: right;
          margin: 32px 40px 10px 10px;
          height: 360px;
          
        }
        .info_profile3{
          background-color: gainsboro;
          font-weight: 700;
          width: 780px;
          height: 390px;
          float: right;
          margin: 32px 40px 10px 10px;
          padding: 20px 0 10px 0;
        }
        
        #profileImg_profile{
        	border-radius: 150px;
        }

        /* 프로필 div안의 버튼 */
        #btnall_profile{
            margin: 40px 74px;
        }

        #btn_profile1{
            width: 150px;
            height: 35px;
        }

        #btn_profile2{
            margin: 10px 0 0 0;
            width: 150px;
            height: 35px;
        }
        
        .profile-update{
        	padding: 0 30px;
        }
        

        #list_profile{
            background-color: white;
            margin: 5px;
            border-radius: 10px;
            height: 320px;
        }
        
		.profilePage-update{
			margin-right: 20px;
		}

        .name_text{
            font-size: 24px;
            font-weight: 700;
            line-height: 29px;
            letter-spacing: -.63px;
            margin-bottom: 5px;
        }

        .id_text{
        	padding-left:5px;
        	height: 24px;
            font-size: 19px;
            font-weight: 400;
            line-height: 16px;
            letter-spacing: normal;
            color: rgba(123,137,148,.8);
        }

        .info_area{
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(123,137,148,.8);
        }

        .nickName_text,.gender_text,.description_text{
        	font-size:20px;
        	font-weight:600;
            display: inline-block;
            vertical-align: middle;
        }

        .text_update_btn{
            float: right;
            background-color: white;
            border: 1px solid black;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
        }
        
        .update_btn{
            background-color: black;
            border: 1px solid black;
            color: white;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
            margin-top: 2px;
        }

        .cancle_btn{
            background-color: white;
            border: 1px solid black;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
            margin-top: 2px;
        }
        
        .board_text,.follower_text,.follow_text{
        	display: inline-block;
        	width: 100px;
        	font-size: 16px;
        	font-weight: 700;
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
	<div class="outer_profile">
        <br><br>
        

        <div class="info_profile">
            <div class="info_profile1">
                <img id="profileImg_profile" src="${ loginMember.profileImg }" style="width: 200px; height: 200px; margin: 50px;"></img><br>
                <div id="btnall_profile">
                </div>
            </div>
            <div class="info_profile2">
                <br>
                <h style="font-weight: 700; margin: 0 0 5px 10px; font-size: larger;">회원정보</h><br><br>
                <div class="profile-update">
	                    <div>
							<div class="info_area">
							    <div class="name_text">
							        ${ member.nickName }
								</div>
								<div class="id_text">
								    ${ member.userId }
							    </div>
							    <br>
							    <div class="board_text">게시물 ${ listCount }</div>
							    <div class="follower_text">팔로워 <span id="following">${ countFollower }</span></div>
							    <div class="follow_text">팔로우 <span id="follow">${ countFollowing }</span></div>
							</div>
							<div class="description_td">
							       <div class="description_text" >
							           ${ loginMember.description }
							    </div>
							</div>
	                    </div>
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
	       		<c:when test="${ countFollower eq 0 }">
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
	</script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>