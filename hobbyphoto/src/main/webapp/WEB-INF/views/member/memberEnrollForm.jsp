<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        .all{
            width: 1200px;
            height: 1000px;
            margin: auto;
            background-color: rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        .innerOuter{
            border: 1px solid black;
            width: 80%;
            height: 90%;
            margin: auto;
            background-color: white;
            border: none;
            border-radius: 50px;
        }

        .form-area{
            margin-left: 30%;
            margin-top: 20px;
        }

        .form-area input{
            width: 60%;
            height: 40px;
            margin-bottom: 20px;
            border-radius: 13px;
            background-color: lightgrey;
            border: none;
        }

        .form-area #Male{
            width: 15px;
            height: 15px;
        }

        .form-area #Female{
            width: 15px;
            height: 15px;
        }

        .form-area button{
            width: 70px;
            height: 40px;
        }

        .btn-area button{
            width: 95px;
            height: 30px;
            cursor: pointer;
            background-color: black;
            color: white;
            border-radius: 10px;
            border: none;
            font-weight: 600;
        }

        .btn-area button:hover{
            background-color: rgba(0, 0, 0, 0.6);
        }

        .form-area button{
            border-radius: 10px;
            border: none;
            background-color:black;
            cursor: pointer;
            color: white;
        }

        .form-area button:hover{
            background-color: rgba(0, 0, 0, 0.6);
        }

        
    </style>

</head>
<body>

	<div class="all">
        <br><br>
        <div class="innerOuter">
            <br>
            <h1 class="form-title" align="center">회원 가입</h1>
            <br>

            <form action="" method="post">
                <div class="form-area">
                    <label for="userId">* 아이디</label> <br>
                    <input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." required>
                    <button type="button">중복확인</button>
                
                    <br>
                    <label for="userPwd">* 비밀번호</label> <br>
                    <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요" required>

                    <br>
                    <label for="checkPwd">* 비밀번호 확인</label> <br>
                    <input type="password" id="checkPwd" placeholder="비밀번호를 입력해주세요." required>

                    <br>
                    <label for="userName">* 이름</label> <br>
                    <input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요." required>

                    <br>
                    <label for="nickName">* 닉네임</label> <br>
                    <input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요." required>

                    <br>
                    <label for="email">* 이메일</label> <br>
                    <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요." required>

                    <br>
                    <label for="phone">전화번호</label> <br>
                    <input type="text" name="phone" id="phone" placeholder="-없이 입력해주세요.">

                    <br>
                    <label for="">성별 : </label>
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label>
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label>
                </div>

                <br>
                <div align="center" class="btn-area">
                    <button id="enrollBtn" type="submit">회원가입</button>
                    <button type="reset">초기화</button>
                </div>

            </form>
        </div>

        
    </div>

</body>
</html>