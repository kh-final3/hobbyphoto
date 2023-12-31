<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- 웹소켓 -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.notosanskr * { 
	font-family: 'Noto Sans KR', sans-serif;
	}
    div{/*box-sizing: border-box; border: 1px solid;*/ font-family: 'Noto Sans KR';}
        .mb_outer{
            height: 120px;
            margin-top: 10px;
            margin: auto;
            margin-left: 140px;
            display: flex;
            justify-content: space-between;
            align-items: center; 
        }

        .mb_outer>div{height: 100%; float: left;}
        .mb_menu-area{
            width: 70%; 
            height: auto;
            /* border: 1px solid blue;  */
        }
        .mb_login-area{
            width: 30%;
            margin-left: 20px; 
            /* border: 1px solid red; */
        }

        .mb_menu-area>div{height: 100%; float: left;}
        #mb_logo{width: 15%; height: 100%;}
        #mb_nav{width: 80%; margin-left: 30px;}
        #mb_logo>img{
            display: block; 
            width: 100%; 
            height: 40%; 
            margin: auto;
            margin-top: 35px;
        } 
        #mb_logo>img:hover{
            cursor: pointer;
        }

        #mb_navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
            display: flex
        }

        #mb_navi a:hover {
           font-weight: 1000;
        }

        .mb_search-area, .mb_login-area {
            display: flex;
            align-items: center;
        }

        .mb_login-area>div{
            height: 70%;
            float: right;
            margin-top: 20px;
            /* border: 1px solid black; */
        }
        #mb_user_1{
            margin-top: 5px;
        }

        #mb_search {
            margin-right: 10px;
        }

        #mb_navi li {
            float: left;
            text-align: center;
            width: 15%; 
            /* border: 1px solid red; */
            height: 100%;
        }

        #mb_navi a {
            text-decoration: none;
            color: rgb(50, 50, 50);
            font-size: 18px;
            font-weight: 500;
            display: block;
            height: 100%;
            width: 100%;
            line-height: 120px;
            cursor: pointer;
        }

        #mb_navi li:nth-child(7) {
            margin-left: auto;
        }
    
        .mb_search-area {
            width: 150px;
        }
        
        #sh_text {
            margin-left: -30px;
            margin-top: 5px;
            width: 185px;
            border: none; 
            border-bottom: 1px solid #aeaeae6b; 
        }
        #search_text {
        	display: flex;
        }

        #search {
            width: 25px;
            height: 25px;
            float: left;
            margin-top: 5px;
        }
        
        .login-area {
            margin-left: 90px; /* 테이블 간격 늘리기 */
        }
        
        #member_menu img{
        	border-radius: 100px;
        }
        
        .false{
        	display: none;
        }

        .member--visible{
            display: "";
        }

        .header .member--visible:before {
            content: "";
            position: absolute;
            left: 50%;
            top: 0;
            border: 8px solid transparent;
            border-bottom-color: #fff;
            transform: translate(-50%,calc(-100% + 1px))
        }
    
        .member_inner{
        	width: 130px;
        	height: 150px;
            background-color: white;
        	position: absolute;
        	top: 100px;
            right: 265px;
        	border: 1px solid black;
        	z-index: 120;
            text-align: center;
            padding: 10px 15px;
        }
        
        .alarm_inner{
        	width: 250px;
        	height: 200px;
        	background-color: white;
        	position: absolute;
        	top: 100px;
            right: 205px;
        	border: 1px solid black;
        	z-index: 120;
            text-align: center;
            padding: 10px 15px;
        }
        

        .btn_login{
            color: #5865f5;
            font-weight: bolder;
            box-sizing: border-box;
            /* border: 1px solid red; */
            width: 100px;
            
        }

        .btn_login:hover{
            color: #5865f5;
        }
        
        .btn:active, .btn:focus { 
        	border: 1px solid white; box-shadow: none; 
        }
        
		        
        .member_menu_mypage{
        	list-style-type: none;
            padding-top: 14px;
        }
        
        .first_menu{
        	border-top: 1px solid #f1f1f1;
        }
        
        .member_menu_mypage a{
			color: black;
            font-weight: bolder;
        }
        
        input::placeholder{
          font-size: 14px;
        }
        
        .alarmArea{
        	width: 100%;
        	height: 90%;
        	overflow: auto;
        }
        
        .alarmClose{
        	border-top: 1px solid #f1f1f1;
        	color: rgb(120, 118, 118);
        	font-size: 14px;
        	font-weight: 700;
        }
        
        .bno,.type{
        	display: none;
        }
        
  </style>
</head>
	<script>
	var socket = null;
	$(document).ready(function(){
		if(${loginMember != null}){
			connectWs();
		}
	})
	
	
	//소켓
	
	
	function connectWs(){
		var ws = new SockJS("echo");
		socket = ws;
		
		ws.onopen = function() {
	 		console.log('open');
	 	};
	
		ws.onmessage = function(event) {
			let $socketAlert = $('.alarmArea');
			$socketAlert.prepend(event.data);
			let count = Number($("#alarmCount").text())
			$("#alarmCount").text(count+1);
		};
	
		ws.onclose = function() {
		    console.log('close');
		 };
	};
	</script>
	
	<c:if test="${ not empty alertMsg }">
      <script>
         alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session"/>
    </c:if>
	<body>
	    <div class="mb_outer">
	        <div class="mb_menu-area">
	            <div id="mb_logo">
	                <img src="resources/images/logo.png" alt="로고" onclick="location.href='/hobbyphoto'">
	            </div> 
	            <div id="mb_nav">
	                <ul id="mb_navi">
	                    <li><a href="phBoardList.bo">사진게시판</a></li>
	                    <li><a href="rcBoardList.bo">장비추천</a></li>
	                    <li><a href="festivalList.fs">축제 · 전시</a></li>
	                    <li><a href="list.pl">출사명소</a></li>
	                   	<li><a href="list.wp">배경화면</a></li>
	                    <li><a href="togetherList.tg">모임</a></li>
	                    <li><a href="list.no">공지사항</a></li>
	                </ul>
	            </div>
	        </div>
	       
	        <div class="mb_login-area">
                <div id="mb_user_1">
                    <table class="login-area" align="center">
                        <tr height="75">
                            <td width="70"><a href="pro.list"><img width="60" src="resources/images/shopping-cart.png" alt=""></a></td>
                            <c:choose>
                            	<c:when test="${ empty loginMember }">
                            		<td width="70" id="member_menu"><img width="60" height="60" src="resources/images/profile.png"></td>
                            	</c:when>
                            	<c:otherwise>
		                            <td width="70" id="member_menu"><img width="60" height="60" src="${loginMember.profileImg }"></td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                    </table>
                </div>
                <div class="heder_inner">
                	<c:choose>
                		<c:when test="${ empty loginMember }">
		                	<div class="member false">
		                		<div class="member_inner">
		                			<button type="button" class="btn btn_login" onclick="login()">로그인</button>
		                			<div class="member_menu">
		                				<ul style="padding: 0px;">
		                					<li class="member_menu_mypage" align="center">
		                						<a href="memberEnrollForm.me">회원가입</a>
		                					</li>
		                				</ul>
		                			</div>
		                		</div>
		                	</div>
                		</c:when>
                		<c:otherwise>
                			<div class="member false">
		                		<div class="member_inner">
		                			<button type="button" class="btn btn_login" onclick="logout()">로그아웃</button>
		                			<div class="member_menu">
		                				<ul style="padding: 0px;">
		                					<li class="member_menu_mypage first_menu" align="center">
		                						<a href="myPage.me">마이페이지</a>
		                					</li>
		                					<li class="member_menu_mypage" align="center">
			                					<c:choose>
				                					<c:when test="${ loginMember.userNo == 1 }">

					                					<a href="alist.da">관리자페이지</a>

				                					</c:when>
				                					<c:otherwise>
				                						<a id="alarmText">알림(<span id="alarmCount">0</span>)</a>
				                					</c:otherwise>
			                					</c:choose>
		                					</li>
		                				</ul>
		                			</div>
		                		</div>
		                	</div>
                		</c:otherwise>
                	</c:choose>
                	<div class="alarm false">
                		<div class="alarm_inner">
                			<div class="alarmArea">
                			</div>
	                		<div class="alarmClose">
	                			닫기
	                		</div>
                		</div>
		            </div>
                </div>
	        </div>
	    </div>
	</body>

    <script>
        $(()=>{
        	$("#member_menu").click(()=>{
                $(".member").before();
        		if($(".member").hasClass("false")){
	        		$(".member").removeClass("false")
	        		$(".member").addClass("member--visible")
        		}else{
        			$(".member").removeClass("member--visible")
	        		$(".member").addClass("false")
        		}
        	})
        	
        	$("#alarmText").click(()=>{
                $(".alarm").before();
        		if($(".alarm").hasClass("false")){
	        		$(".alarm").removeClass("false")
	        		$(".alarm").addClass("member--visible")
        		}
        	})
        	
        	$(".alarmClose").click(()=>{
        		$(".alarm").removeClass("member--visible")
        		$(".alarm").addClass("false")
        		$(".member").removeClass("member--visible")
	        	$(".member").addClass("false")
        	})
        })
        
        function login() {
			location.href="loginForm.me"
		}
        
        function logout() {
			location.href="logout.me"
		}
    
	    $(".gomain").click(function(){
	    	location.href='/hobbyphoto'
	    })
	    
	    $(()=>{
	    	if(${loginMember != null}){
		    	$.ajax({
		    		url:"alramCount",
		    		data:{fromId:"${loginMember.userId}"},
		    		success:data=>{
		    			$("#alarmCount").text(data)
		    		},
		    		error:()=>{
			    		console.log("알림 카운트 수 로딩 실패")	
		    		}
		    	})
		    	
		    	$.ajax({
		    		url:"alramList",
		    		data:{fromId:"${loginMember.userId}"},
		    		success:data=>{
		    			let value = "";
		                for(let i in data){
		                	if(data[i].cmd == "reply"){
			                   value += "<div class='alarmMsg'><span class='bno'>"+data[i].bno+"</span>"
			                   		  + "<span class='type'>"+data[i].type+"</span>"
			                   		  + "<span class='sendId'>" +data[i].sendId + "</span>"
				                   	  + "님이 "+ data[i].title +" 에 댓글을 달았습니다!</div>";
			                   		 
		                	}
		                	
		                	if(data[i].cmd == "like"){
				                   value += "<div class='alarmMsg'><span class='bno'>"+data[i].bno+"</span>"
				                   		  + "<span class='type'>"+data[i].type+"</span>"
				                   		  + "<span class='sendId'>" +data[i].sendId + "</span>"
					                   	  + "님이 "+ data[i].title +" 에 좋아요를 눌렀습니다!</div>";
				                   		 
			                }
		                	
		                	if(data[i].cmd == "follow"){
				                   value += "<div class='alarmMsg'><span class='bno'>"+data[i].bno+"</span>"
				                   		  + "<span class='sendId'>" +data[i].sendId + "</span>"
					                   	  + "님이 팔로우했습니다.!</div>";
			                }
		                }
		                
		                $(".alarmArea").html(value);
		    		},
		    		error:()=>{
			    		console.log("알림 카운트 수 로딩 실패")	
		    		}
		    	})
		    	
		    	 $(document).on("click", ".alarmMsg", function(){
		    		 let type = $(this).find(".type").text();
						// 사진게시판
						if(type==1){
				    		$.ajax({
				    			url:"alramClick",
				    			data:{bno:$(this).find(".bno").text(),sendId:$(this).find(".sendId").text(),type:$(this).find(".type").text()},
				    			type:"post",
				    			success:data=>{
				    				location.href="phDetail.bo?phno="+data
				    			},
				    			error:()=>{
				    				console.log("알림 삭제 실패")
				    			}
				    		})
						}
		    		 
		    		 	// 추천게시판
		    		 	if(type==2){
		    		 		$.ajax({
				    			url:"alramClick",
				    			data:{bno:$(this).find(".bno").text(),sendId:$(this).find(".sendId").text(),type:$(this).find(".type").text()},
				    			type:"post",
				    			success:data=>{
				    				location.href="rcDetail.bo?phno="+data
				    			},
				    			error:()=>{
				    				console.log("알림 삭제 실패")
				    			}
				    		})
		    		 	}
		    		 	
		    		 // 팔로우
		    		 	if(type==3){
		    		 		$.ajax({
				    			url:"alramFollow",
				    			data:{bno:$(this).find(".bno").text(),sendId:$(this).find(".sendId").text(),type:$(this).find(".type").text()},
				    			type:"post",
				    			success:data=>{
				    				location.href="profile.me?userId="+data
				    			},
				    			error:()=>{
				    				console.log("알림 삭제 실패")
				    			}
				    		})
		    		 	}
		    	})
	    	}
	    })
	    
	    
    </script>
</html>