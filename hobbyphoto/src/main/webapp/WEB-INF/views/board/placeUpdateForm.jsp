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
            height: 100%;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }
        
        .outline{
            border: 1px solid white;
            width: 90%;
            height: 95%;
            margin: auto;
            margin-top: 15px;
            background-color: white;
            border-radius: 15px;
        }

        .content-area{
            border: 1px solid red;
            width: 100%;
            height: 80%;
            border: none;
        }

        .detail-area{
            border: 1px solid black;
            width: 100%;
            height: 35%;
            border: none;
        }

        .photo-area{
            border: 1px solid rebeccapurple;
            width: 100%;
            height: 50%;
            border: none;
        }

        .map-area{
            border: 1px solid purple;
            width: 100%;
            height: 20%;
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

        .propho{
            border: 1px solid black;
            width: 10%;
            height: 75%;
            margin-top: 8px;
            margin-left: 10px;
            float: left;
            /* border: none; */
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
            width: 22%;
            height: 350px;
            margin-left: 30px;
            margin-top: 25px;
        }

        .list{
            border: 1px solid black;
            width: 80%;
            height: 50%;
            margin: auto;
            border: none;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <form method="post" action="update.pl" enctype="multipart/form-data">
       
        <div class="outline">
            <div class="content-area">
                <div class="detail-area">
                    <div class="text-area">
                        <ul class="ul-area">
                            <li class="li-area">
                                <div class="board-title">
                                    &nbsp; 제목 : <input type="text" name="" id="" value="${ p.ptitle }" required>
                                </div>
                                
                                <div class="board-create">${ p.createDate }</div>

                                <div class="boare-ect">
                                    <a href=""><img src="resources/like.png" alt="좋아요" width="35"></a> &nbsp;&nbsp;
                                    <a href=""><img src="resources/report.png" alt="신고" width="35"></a>
                                </div>
                            </li>
                            <hr>
                            <li class="li-area1">
                                <div class="board-writer">&nbsp;&nbsp;작성자 : ${ p.pwriter }</div>
                                <div class="board-ect">조회수 : ${ p.count }  &nbsp;&nbsp;&nbsp; 추천수 : 3 &nbsp;&nbsp;&nbsp; 댓글 : 2</div>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <div class="list-content">
                        <div class="list">
                        [주소] <input type="text" name="" id="" value="${ p.plocation }" required> <br>
                        [촬영 시기] <input type="text" name="" id="" value="5월 중순 ~ 8월 중순"> <br>
                        [추천 카메라] <input type="text" name="" id="" value="24-70mm,..."> <br>
                        [특징] <br><textarea name="" id="" style="width: 1000px; height: 100px; resize: none;"></textarea>
                        </div>
                    </div>
                </div>

                <hr>
                <div>
                    <h2 style="text-align: center;">상세 사진</h2>
                </div>
                <div class="photo-area">
                    <img src="${ p.pimg1 }" alt="사진 1" id="titleImg" onclick="chooseFile(1);">
                    <img src="${ p.pimg2 }" alt="사진 2" id="contentImg1" onclick="chooseFile(2);">
                    <img src="${ p.pimg3 }" alt="사진 3" id="contentImg2" onclick="chooseFile(3);">
                    <img src="${ p.pimg4 }" alt="사진 4" id="contentImg3" onclick="chooseFile(4);">
                </div>
		 		<div id="file-area" style="display:none">
		            <input type="file" name="upfile" id="file1" onchange="loadImg(this, 1);" required>
		            <input type="file" name="upfile" id="file2" onchange="loadImg(this, 2);">
		            <input type="file" name="upfile" id="file3" onchange="loadImg(this, 3);">
		            <input type="file" name="upfile" id="file4" onchange="loadImg(this, 4);">
		        </div>
                <hr>

                <div class="map-area">
                    지도 api
                </div> 
            </div>
            
        </div>

        <div class="btn-area" align="center">
            <button type="submit">수정하기</button>
            <button type="button" class="golist">목록으로</button>
        </div>
    </form>
    </div>
    <script>
        function chooseFile(num){
            $("#file"+num).click();
        }	
        
        function loadImg(inputFile, num){

                                
            if(inputFile.files.length == 1){ 
                
               
                const reader = new FileReader();
            
              
                reader.readAsDataURL(inputFile.files[0]);
              
                reader.onload = function(e){
                    switch(num){
                        case 1: $("#titleImg").attr("src", e.target.result); break;
                        case 2: $("#contentImg1").attr("src", e.target.result); break;
                        case 3: $("#contentImg2").attr("src", e.target.result); break;
                        case 4: $("#contentImg3").attr("src", e.target.result); break;
                    }
                }
                
            }else{
                switch(num){
                case 1: $("#titleImg").attr("src", null); break;
                case 2: $("#contentImg1").attr("src", null); break;
                case 3: $("#contentImg2").attr("src", null); break;
                case 4: $("#contentImg3").attr("src", null); break;
            }
                
            }
            
        }
    $(function (){
        $(".golist").click(function(){
            location.href='list.pl';
        })
    })
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>