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
    
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <div class="innerOut">
            <div class="board-title">
                <h2 style="text-align: center;">출사 명소</h2> 
            </div>
            <form id="enrollForm" method="post" action="insert.pl" enctype="multipart/form-data">
                
                <div class="text">
                <div class="text-area">
                제목 : <input type="text" name="ptitle" id="ptitle" placeholder="제목을 입력해주세요." required> <br>
                작성자 : <input type="text" name="pwriter" id="pwriter" value="user01" style="border: none;"> <br>
                상세주소 : <input type="text" name="paddress" id="paddress" placeholder="주소를 입력해주세요. ex) 서울 강남구 테헤란로14길 6" required> <br><br>
                위치 : <input type="text" name="plocation" id="plocation" placeholder="위치를 입력해주세요. ex) 서울시 강북구" required> <br><br>
                <br>
                <textarea name="pcontent" id="pcontent" cols="30" rows="10" placeholder="내용을 입력해주세요." required></textarea>
            </div>
        </div>
        
        <div class="photo">
            <div class="photo-area">
                <img src="" alt="사진1"  id="titleImg"  width="150" height="120"onclick="chooseFile(1);" >
                <img src="" alt="사진2" id="contentImg1" width="150" height="120" onclick="chooseFile(2);">
                <img src="" alt="사진3" id="contentImg2" width="150" height="120" onclick="chooseFile(3);">
                <img src="" alt="사진4" id="contentImg3"  width="150" height="120" onclick="chooseFile(4);">
                </div>
            </div>
            <div id="file-area" style="display:none">
                <input type="file" name="upfile" id="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="upfile" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="upfile" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="upfile" id="file4" onchange="loadImg(this, 4);">
            </div>
            <br>
            <div class="brn-area" align="center">
                <button type="submit">작성하기</button>
                <button type="reset">취소하기</button>
                <button type="button" class="golist">목록으로 </button>
            </div>
        </form>
        </div>
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