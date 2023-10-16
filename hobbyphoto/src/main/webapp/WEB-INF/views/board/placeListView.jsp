<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style>
         div * {box-sizing: border-box;}
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1200px;
            height: 1400px;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }

        .list-area{
            border: 1px solid white;
            width: 85%;
            height: 90%;
            margin: auto;
            margin-top: 5%;
            background-color: white;
            border-radius: 15px;
        }

        .list{
            border: 1px solid red;
            width: 100%;
            height: 94%;
            border: none;
        }

        .list li{
            list-style: none;
        }

        .ul-area{
            padding-left: 16px;
            margin-top: 10px;
        }

        .photo{
            border: 1px solid black;
            width: 250px;
            height: 150px;
            float: left;
            border-radius: 5%;
        }

        .photo img{
            border-radius: 5%;
        }

        .text{
            border: 1px solid blue;
            width: 650px;
            height: 150px;
            float: left;
            margin-left: 14px;
            border: none;
        }

        .text p{
            margin-top: 0px;
            margin-left: 2px;
            margin-bottom: 8px;
        }

        .li-area{
            cursor: pointer;
            height: 150px;
        }

        .btn-area{
            border: 1px solid black;
            height: 3%;
            width: 10%;
            float: right;
            border: none;
        }

        .btn-area button{
            float: right;
            width: 85px;
            height: 30px;
        }

        .page-btn button{
            width: 45px;
            height: 30px;
        }

        .ect{
            border: 1px solid black;
            height: 3%;
            width: 20%;
            float: left;
            border: none;
            margin-left: 15px;
        }
        
        a{
            text-decoration-line: none;
            color: black;
            font-size: medium;
        }
        
        .text h2{
            margin-top: 0;
            margin-bottom: 2px;
        }
    </style>
</head>
<body>
    <div class="warp">

        <div class="list-area">

            <div class="list">

                <!--관리자일때만 보이게 하기  -->
                <div class="btn-area">
                    <button>글쓰기</button>
                </div>
              
                <div class="ect">
                    <a href="">최신순</a> | <a href="">인기순</a>
                </div>

                <ul class="ul-area">
					<c:if test="${ not empty list }">
						<c:forEach var="p" items="${ list }">
							<hr width="98.5%">

		                    <li class="li-area">
		                        <div class="photo">
		                            <img src="resources/images/풍경1.JPG" alt="" width="250" height="150">
		                        </div>
		
		                        <div class="text">
		                            <h2 class="title">${ p.ptitle }</h2>
		                            <p class="location">${ p.plocation }</p>
		                            <p class="content">${ p.pcontent }</p>
		                            <p class="content-ect">조회수 : 5  &nbsp;&nbsp;&nbsp; 좋아요 : 1 &nbsp;&nbsp;&nbsp;&nbsp; 작성일 : 2023-10-10</p>
		                        </div>
		                    </li>
						</c:forEach>
					</c:if>
					

                    <hr width="98.5%">

                </ul>
            </div>
        </div>
        <div class="page-btn" align="center">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>&gt;</button>
        </div>
    </div>
</body>
</html>