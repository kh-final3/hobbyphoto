<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style>
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1200px;
            height: 1400px;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }
        
        .innerOut{
            border: 1px solid white;
            width: 85%;
            height: 95%;
            margin: auto;
            margin-top: 28px;
            background-color: white;
            border-radius: 15px;
        }

        .text{
            border: 1px solid red;
            width: 80%;
            height: 40%;
            margin: auto;
            margin-top: 20px;
            border: none;
        }

        .photo{
            border: 1px solid black;
            width: 80%;
            height: 40%;
            margin: auto;
            margin-top: 10px;
            /* border: none; */
        }
        .text textarea{
            width: 600px;
            height: 400px;
            resize: none;
        }

        .text input{
            width: 500px;
            height: 30px;
        }
        .text-area{
            border: 1px solid black;
            width: 80%;
            height: 20%;
            margin: auto;
            margin-top: 5px;
            border: none;
        }
    </style>
</head>
<body>
    <div class="warp">
        <div class="innerOut">
            <div class="board-title">
                <h2 style="text-align: center;">출사 명소</h2> 
            </div>
            <div class="text">
                <div class="text-area">
                제목 : <input type="text" name="" id="" placeholder="제목을 입력해주세요." required> <br>
                작성자 : <input type="text" name="" id="" value="user01" style="border: none;"> <br>
                주소 : <input type="text" name="" id="" placeholder="주소를 입력해주세요." required> <br>
                <br>
                <textarea name="" id="" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
                </div>
            </div>

            <div class="photo">
                <div class="photo-area">
                    <img src="" alt="사진1">
                    <img src="" alt="사진2">
                    <img src="" alt="사진3">
                </div>
            </div>
            <br>
            <div class="brn-area" align="center">
                <button>작성하기</button>
                <button>목록으로 </button>
            </div>
        </div>
    </div>
</body>
</html>