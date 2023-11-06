<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
        .all{
            width: 1200px;
            height: 800px;
            margin: auto;

        }

        .innerOuter{
            width: 80%;
            height: 90%;
            margin: auto;
        }

        .form-area{
            margin-left: 20%;
        }

        .form-area input{
            width: 80%;
            height: 40px;
            border: none;
            border-bottom: 1px solid black;
        }

        .form-area #Male{
            width: 15px;
            height: 15px;
        }

        .form-area #Female{
            width: 15px;
            height: 15px;
        }

        /* .form-area button{
            width: 70px;
            height: 40px;
        } */

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
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="all">
        <br><br>
        <div class="innerOuter">
            <br>
            <h1 class="form-title" align="center">회원 가입</h1>
            <br>

            <form action="Enroll.me" method="post">
                <div class="form-area">
                    <div class="form-floating">
                        <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력해주세요." required>
                        <label for="userId">아이디</label> <br>
                        <div id="checkId" style="font-size:0.8em; display:none"></div>
                        <!-- <button type="button">중복확인</button> -->
                    </div>                    

                    <div class="form-floating">
                        <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요" required>
                        <label for="userPwd">비밀번호</label> <br>
                    </div>

                    <div class="form-floating">    
                        <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호를 입력해주세요." required>
                        <label for="checkPwd">비밀번호 확인</label> <br>
                    </div>

                    <div class="form-floating">    
                        <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력해주세요." required>
                        <label for="userName">이름</label> <br>
                    </div>    

                    <div class="form-floating">    
                        <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요." required>
                        <label for="nickName">닉네임</label> <br>
                    </div>     
                    <div class="form-floating">  
                        <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요." required>
                        <label for="email">이메일</label> <br>
                    </div>      
                    <div class="form-floating">  
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="-없이 입력해주세요.">
                        <label for="phone">전화번호</label> <br>
                    </div>  
                    &nbsp;&nbsp;&nbsp;<label for="">성별 : &nbsp;</label>
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label>
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label>
                </div>
  			    <br>
                <div align="center" class="btn-area" style="margin:auto;">
                    <button id="enrollBtn" type="submit">회원가입</button>
                    <button type="reset">초기화</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        $(function() {
            $("#userId").keyup(function() {
                checkUserIdAvailability();
            });
        });
        
        function checkUserIdAvailability() {
            var userId = $("#userId").val();
        
            // AJAX 요청을 보내서 아이디 중복 확인을 수행
            $.ajax({
                url: "idCheck.me", // 서버의 URL로 변경해야 합니다.
                method: "POST",
                data: { userId: userId },
                success: function(response) {
                    if (response === "success") {
                        $("#checkId").html("사용 가능한 아이디입니다.").css("color", "green");
                    } else if (response === "fail") {
                        $("#checkId").html("이미 사용 중인 아이디입니다.").css("color", "red");
                    }
                    $("#checkId").show();
                },
                error: function() {
                    console.log("아이디 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }
    </script>

        
      	<jsp:include page="../common/footer.jsp" />  
</body>
</html>