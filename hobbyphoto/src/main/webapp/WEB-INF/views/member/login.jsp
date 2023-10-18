<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .all{
            width: 1400px;
            height: 1000px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
            margin-left: 130px;
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
        }

        .login_id {
            margin-top: 20px;
            width: 100%;
        }

        .login_id input {
            width: 100%;
            height: 50px;
            border-radius: 30px;
            margin-top: 10px;
            padding: 0px 20px;
            border: 1px solid lightgray;
            outline: none;
        }

        .login_pw {
            margin-top: 20px;
            width: 100%;
        }

        .login_pw input {
            width: 100%;
            height: 50px;
            border-radius: 30px;
            margin-top: 10px;
            padding: 0px 20px;
            border: 1px solid lightgray;
            outline: none;
        }

        .login_etc {
            padding: 10px;
            width: 108%;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
        }

        .btn button{
            width: 200px;
            height: 40px;
            background-color: black;
            color: white;
            border-radius: 10px;
            border: none;
            cursor: pointer;
        }

        .btn button:hover{
            background-color: rgba(0, 0, 0, 0.6);
        }

        .sns-login li{
            list-style: none;
        }

        .sns-login {
        padding: 20px;
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
       
       
    </style>
</head>
<body>
<div class="all">
	<div class="innerOuter">
            <h2>Hobby Photo <br>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;LogoIn</span>
            </h2>
            <form action="login.me" method="post">
                <div class="login-form">

                    <div class="login_id">
                        <h4>아이디</h4>
                        <input type="text" name="userId" placeholder="아이디를 입력해주세요.">
                    </div>

                    <div class="login_pw">
                        <h4>비밀번호</h4>
                        <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요.">
                    </div>

                    <div class="login_etc">

                        <div class="checkbox">
                            <input type="checkbox" name="" id=""> 아이디 저장
                        </div>

                        <div class="forgot_pw">
                            <a href="findId.me">아이디 찾기</a> |
                            <a href="">비밀번호 찾기</a>
                        </div>

                    </div>

                    <br>

                    <div class="btn" align="center">
                        <button type="submit">로그인</button>
                    </div>
                </div>
            </form>

            <br>
           
            <div class="sns-login">
                
                <li><a href=""><img src="resources/kakao_login_medium_narrow.png" alt="카카오" width="250" height="50"></a></li>
                <!-- <li><a href=""><img src="" alt="카카오"></a></li> -->
                
            </div>

            <br>

            <div>
                
            </div>
        </div> 
    </div>
</body>
</html>