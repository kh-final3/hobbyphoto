<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
        .all{
            width: 1400px;
            height: 1000px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
            margin: auto;
        }

        .innerOuter{
            width: 35%;
            height: 70%; 
            background-color: white;
            border: none;
            border-radius: 35px;   
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; 
            margin: auto;
        }

        .login_id {
            margin-top: 20px;
            width: 100%;
        }

        .login-input{
            width: 351px;
            height: 50px;
            border-radius: 10px;
            margin-top: 10px;
            padding: 0px 20px;
            border: 1px solid lightgray;
            outline: none;
        }

        .login_pw {
            margin-top: 20px;
            width: 100%;
        }

        .login_etc {
            padding: 10px;
            width: 96%;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
        }
        
        .login-form{
        	width: 390px;
        	margin: 0 auto 0;
        }
        
        .login_btn{
            width: 400px;
            height: 40px;
            background-color: black;
            color: white;
            border-radius: 10px;
            border: 1px solid black;
            cursor: pointer;
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 10px;
        }
        
        .enroll_btn{
        	width: 400px;
            height: 40px;
            background-color: white;
            border-radius: 10px;
            border: 1px solid black;
            cursor: pointer;
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .btn button:hover{
            background-color: rgba(0, 0, 0, 0.6);
        }

        .sns-login li{
            list-style: none;
        }

        .sns-login {
        	width: 390px;
        	margin: auto;
        	padding-right: 36px;
        }

        .sns-login li {
  	    	padding: 0px 15px;
        }

        .sns-logins a {
	        width: 50px;
	        height: 50px;
	        display: flex;
	        align-items: center;
	        justify-content: center;
	        padding: 10px;
	        border-radius: 50px;
	        background: white;
	        font-size: 20px;
	        box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
        }
       
        .sns-login img{
        	width: 440px;
        	height: 60px;
        }
    </style>
</head>
<body>
<div class="all">
	<c:if test="${ not empty alertMsg }">
      <script>
         alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session"/>
    </c:if>
	<div class="innerOuter">
            <h1>Hobby Photo <br>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;Login</span>
            </h1>
                <div class="login-form">
		            <form action="login.me" method="post">

                    <div class="login_id">
                        <h4>아이디</h4>
                        <input class="login-input" type="text" name="userId" value="${ cookie }" required placeholder="아이디를 입력해주세요.">
                    </div>

                    <div class="login_pw">
                        <h4>비밀번호</h4>
                        <input class="login-input" type="password" name="userPwd" required" placeholder="비밀번호를 입력해주세요.">
                    </div>

                    <div class="login_etc">

                        <div class="checkbox">
                            <input type="checkbox" name="cookie" id="cookie"> 아이디 저장
                        </div>

                        <div class="forgot_pw">
                            <a href="findId.me">아이디 찾기</a> |
                            <a href="findPwd.me">비밀번호 찾기</a>
                        </div>

                    </div>

                    <br>

                    <div class="btn" align="center">
                        <button class="login_btn" type="submit">로그인</button>
                    </div>
                    <div class="btn" align="center">
                        <button class="enroll_btn" type="button" onclick="location.href='memberEnrollForm.me'">회원가입</button>
                    </div>
		            </form>
                </div>

            <div class="sns-login">
	            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=5f1f7536e194f12469c7a86ac6bdb30f&redirect_uri=http://localhost:8006/hobbyphoto/login">
				 	<img src="resources/images/kakao_login.png">
				</a>
				<br>
				<a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=860686382085-sag7ri1m1cuu3t9csh56c9c0t8touqei.apps.googleusercontent.com&redirect_uri=http://localhost:8006/hobbyphoto/google&response_type=code&scope=email%20profile%20openid&access_type=offline">
					<img src="resources/images/google_login.png">
				</a>
            </div>
            <br>
        </div> 
    </div>
    <script>
    	$(()=>{
    		$("#cookie").change(()=>{
    			if(!$("#cookie").hasClass("cookie")){
    				$("#cookie").addClass("cookie");
    				$("#cookie").val("cookie")
    				$.ajax({
    					url:"addCookie.me",
    					data:{userId:$("input[name=userId]").val(),cookie:$("#cookie").val()},
    					success:()=>{
    						
    					},
    					error:()=>{
    						console.log("아이디 저장 ajax 실패")
    					}
    				})
    			}else{
    				$("#cookie").removeClass("cookie");
    				$("#cookie").val("");
    				$.ajax({
    					url:"addCookie.me",
    					data:{userId:$("input[name=userId]").val(),cookie:$("#cookie").val()},
    					success:(data)=>{
    						console.log(data)
    					},
    					error:()=>{
    						console.log("아이디 저장 ajax 실패")
    					}
    				})
    			}
    		})
    	})
    </script>
