<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1400px;
            height: 1600px;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }
        
        .outline{
            border: 1px solid white;
            width: 90%;
            height: 95%;
            margin: auto;
            margin-top: 45px;
            background-color: white;
            border-radius: 15px;
        }

        .content-area{
            border: 1px solid red;
            width: 100%;
            height: 80%;
            border: none;
        }

        .review-area{
            border: 1px solid blue;
            width: 100%;
            height: 20%;
            border: none;
        }

        .detail-area{
            border: 1px solid black;
            width: 100%;
            height: 20%;
            border: none;
        }

        .photo-area{
            border: 1px solid rebeccapurple;
            width: 100%;
            height: 40%;
            border: none;
        }

        .map-area{
            border: 1px solid purple;
            width: 100%;
            height: 35%;
            border: none;
        }

        .text-area{
            border: 1px solid black;
            width: 100%;
            height: 30%;
            border: none;
        }
        .text-area li{
            list-style: none;
        }

        .ul-area{
            border: 1px solid red;
            width: 100%;
            height: 90%;
            padding: 0;
            margin-top: 20px;
            border: none;
        }

        .li-area{
            border: 1px solid blue;
            width: 100%;
            height: 40%;
            border: none;
        }

        .li-area1{
            border: 1px solid blue;
            width: 100%;
            height: 37%;
            border: none;
        }

        .board-title{
            border: 1px solid black;
            width: 49%;
            height: 93%;
            float: left;
            border: none;
            font-size: larger;
            font-weight: 600;
        }

        .board-create{
            border: 1px solid black;
            width: 25%;
            height: 93%;
            float: left;
            border: none;
            margin-left: 30px;
            font-size: larger;
            font-weight: 400;
        }

        .board-writer{
            border: 1px solid black;
            width: 49%;
            height: 93%;
            float: left;
            border: none;
            font-size: larger;
            font-weight: 600;
        }

        .board-ect{
            border: 1px solid black;
            width: 49%;
            height: 93%;
            float: right;
            border: none;
            font-size: medium;
            font-weight: 300;
        }

        .writer-review{
            border: 1px solid black;
            width: 55%;
            height: 25%;
            margin: auto;
            margin-top: 10px;
        }

        .review-lo{
            margin-left: 230px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .propho{
            border: 1px solid black;
            width: 10%;
            height: 75%;
            margin-top: 8px;
            margin-left: 10px;
            float: left;
            /* border: none; */
        }

        .review{
            border: 1px solid black;
            width: 72%;
            height: 80%;
            margin-left: 10px;
            margin-top: 10px;
            border: none;
            float: left;
        }

        .review textarea{
            width: 520px;
            height: 50px;
            resize: none;
            /* float: left; */
        }

        .subtn{
            border: 1px solid black;
            width: 7%;
            height: 50%;
            float: left;
            margin-left: 30px;
            margin-top: 15px;
            border: none;
        }

        .subtn button{
            width: 65px;
            height: 45px;
            cursor: pointer;
        }

        .boare-ect{
            border: 1px solid black;
            width: 10%;
            height: 90%;
            float: left;
            border: none;
            margin-left: 130px;
        }

        .photo-area img{
            width: 300px;
            height: 350px;
            margin-left: 95px;
            margin-top: 60px;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <div class="outline">
        
            <div class="content-area">
                <div class="detail-area">
                    <div class="text-area">
                        <ul class="ul-area">
                            <li class="li-area">
                                <div class="board-title">&nbsp;&nbsp;제목 : ${ p.ptitle }</div>
                                
                                <div class="board-create">${ p.createDate }</div>

                                <div class="boare-ect">
                                <!-- 좋아요눌럿을때 -->
                                    <a href="">❤️</a> &nbsp;&nbsp;
                                <!-- 좋아요안눌럿을때 -->
                                    <a href="">🤍</a> &nbsp;&nbsp;
                                    <a href="">❗</a>
                                </div>
                            </li>
                            <hr>
                            <li class="li-area1">
                                <div class="board-writer">&nbsp;&nbsp;작성자 : user01</div>
                                <div class="board-ect">조회수 : ${ p.count } &nbsp;&nbsp;&nbsp; 추천수 : 3 &nbsp;&nbsp;&nbsp; 댓글 : 2</div>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <div class="list-content">
                        [주소] ${ p.paddress } <br>
                        [촬영 시기] 5월 중순 ~ 8월 중순 <br>
                        [추천 카메라] 24-70mm,... <br>
                        [특징] 동작대교에서 여의도 쌍둥이 빌딩 사이 일몰 촬영 및 야경 촬영을 할 수 있는 포인트 입니다.일몰은 시기에 따라 남단에서 북단응로 조금씩 위치 변화가 있으니 주의 바랍니다. 
                    </div>
                </div>

                <hr>
                <div>
                    <h2 style="text-align: center;">상세 사진</h2>
                </div>
                <div class="photo-area">
                    <img src="resources/images/풍경2.jpg" alt="사진 1">
                    <img src="resources/images/풍경3.jpg" alt="사진 2">
                    <img src="resources/images/풍경1.jpg" alt="사진 3">
                </div>

                <hr>

                <div class="map-area">
                    지도 api
                </div>
            </div>
           
           <a class="btn btn-secondary" style="float:right" href="list.pl">목록으로</a>
           <hr>
            
            <div class="review-area">
                <h3 class="review-lo">댓글(2)</h3>
                <div class="writer-review">
                    <div class="propho">
                        <img src="resources/풍경1.JPG" alt="프로필사진" width="70" height="59">
                    </div>
                    <div class="review">
                        <textarea name="" id="" placeholder="댓글을 입력해주세요"></textarea>
                    </div>
                    <div class="allr">
                        
                    </div>

                    <div class="subtn">
                        <button>등록</button>
                    </div>
                </div>
                <div class="all-review">

                </div>
                
            </div>
            
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>