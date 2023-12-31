<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1200px;
            height: 1000px;
            margin: auto;
            background-color: rgba(0, 0,0,0.1);
            border-radius: 15px;
        }

        .innerOut{
            border: 1px solid white;
            width: 85%;
            height: 90%;
            margin: auto;
            margin-top: 50px;
            background-color: white;
            border-radius: 15px;
        }

        .form-area,.content-area{
            border: 1px solid red;
            width: 100%;
            height: 100%;
            border: none;
        }

        .photo-area{
            border: 1px solid purple;
            width: 59%;
            height: 100%;
            float: left;
            border: none;
        }

        .writer-area{
            border: 1px solid black;
            width: 39%;
            height: 60%;
            float: right;
            margin-top: 120px;
            margin-right:20px;
            border: none;
        }

        .btn-area{
            border: 1px solid blueviolet;
            width: 39%;
            height: 18%;
            float: right;
            margin-top: 3px;
            border: none;
        }

        .title-input{
            width: 300px;
            height: 30px;
            margin-top: 20px;
        }
        
        .text-area{
        	margin-left:33px;
            width: 318px;
            height: 400px;
            resize: none;
            margin-top: 10px;
        }

        .tag-input{
            height: 30px;
        }

        .btn-area button{
            width: 35%;
            height: 23%;
            cursor: pointer;
            padding-right: 5px;
        }

        .mainpho{
            border: 1px solid black;
            width: 83%;
            height: 45%;
            margin: auto;
            margin-top: 45px;
            border: none;
        }

        .pho{
            border: 1px solid rebeccapurple;
            width: 98%;
            height: 43%;
            border: none;
        }

        .pho img{
            float: left;
            margin-left: 50px;
            margin-top: 5px;
        }
        textarea::placeholder {
		  font-size: 14px;
		}

    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <div class="innerOut">
            <form action="phInsert.bo" enctype="multiPart/form-data" class="form-area" method="post">
                <div class="content-area">
                    <div class="photo-area">

                        <div class="mainpho">
                            <img src="resources/images/enrollImage.png" alt="" id="image1" width="450" height="400" onclick="chooseFile(1);">
                            <input type="file" name="upfiles" id="file1" onchange="loadImg(this, 1);" style="display: none;" required>
                        </div>
                        <div class="pho">
                            <div class="pho1">
                                <img src="resources/images/enrollImage.png" alt="" id="image2" width="200" height="200" onclick="chooseFile(2);">
                                <input type="file" name="upfiles" id="file2" onchange="loadImg(this, 2);" style="display: none;">
                            </div>
                            <div class="pho2">
                                <img src="resources/images/enrollImage.png" alt="" id="image3" width="200" height="200" onclick="chooseFile(3);">
                                <input type="file" name="upfiles" id="file3" onchange="loadImg(this, 3);" style="display: none;">
                            </div>
                            <div class="pho3">
                                <img src="resources/images/enrollImage.png" alt="" id="image4" width="200" height="200" onclick="chooseFile(4);">
                                <input type="file" name="upfiles" id="file4" onchange="loadImg(this, 4);" style="display: none;">
                            </div>
                            <div class="pho4">
                                <img src="resources/images/enrollImage.png" alt="" id="image5" width="200" height="200" onclick="chooseFile(5);">
                                <input type="file" name="upfiles" id="file5" onchange="loadImg(this, 5);" style="display: none;">
                            </div>
                        </div>
                    </div>

                    <script>
                    const defaultImage = "resources/images/enrollImage.png"
                        function chooseFile(num) {
                            $("#file" + num).click();
                        }
                        
                        function loadImg(inputFile, num) {
                            // 예:(this, 1)
                            // inputFile : (==this)현재 변화가 생긴 input type = 그 "file" 요소 객체
                            // num : 몇번째 input 요소인지 확인 후 해당 그 영역에 미리보기 하기 위해 전달받는 숫자
                            
                            // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨 있음
                                        //=> inputFile.files.length 또한 1이 될것임
                            if(inputFile.files.length == 1) { // 1 반환했다는 것은 파일이 선택된 경우라는 것 => 파일 읽어들여서 '미리보기'
                              
                                // => 있다면, 1)해당파일에 고유한url 부여해주고, 2)해당num일때 src를 고유한url넣어서 선택한파일 띄움 
                                
                                // 1)파일을 읽어들일 FileReader 객체 생성
                                const reader = new FileReader();
                                
                                // 1)파일을 읽어들이는 메소드 호출
                                // 해당 파일을 읽어들이는 순간, inputFile.files[0]에 담긴 이 파일만의 '고유한 url'(겁나긴거) 부여해주는 코드
                                reader.readAsDataURL(inputFile.files[0]);
                                
                                // 2)파일 읽어들이기가 완료(onload) 됐을 때, 실행할 함수 정의해두기
                                reader.onload = function(e) {
                                    
                                    // (event)는 기본적으로 항상 있는 존재.. 우린 부여받은 '고유한 url' 필요하니까 e로 받고, (script에서 매개변수의 자료형은 필요x)
                                    // e.target.result == 읽어들인 파일의 '고유한 url'(겁나긴거) 들어있음
                                    switch(num) {
                                        case 1: $("#image1").attr("src", e.target.result); break;
                                        case 2: $("#image2").attr("src", e.target.result); break;
                                        case 3: $("#image3").attr("src", e.target.result); break;
                                        case 4: $("#image4").attr("src", e.target.result); break;
                                        case 5: $("#image5").attr("src", e.target.result); break;
                                    }
                                }
                                
                            }else { // 선택된 파일이 취소된 경우(뺌) => 미리보기 한것도 사라지도록
                                switch(num) {
                                    case 1: $("#image1").attr("src", defaultImage); break;
                                    case 2: $("#image2").attr("src", defaultImage); break;
                                    case 3: $("#image3").attr("src", defaultImage); break;
                                    case 4: $("#image4").attr("src", defaultImage); break;
                                    case 5: $("#image5").attr("src", defaultImage); break;
                                }
                            }

                        }

                    </script>

                    <div class="writer-area">
                        제목 <input type="hidden" id="boardWriter" value="${ loginMember.userNo }" name="boardWriter">
                        <input type="text" name="boardTitle" id="boardTitle" class="title-input" style="width: 317px;" placeholder="제목을 입력해주세요."   required> <br>
                        <textarea name="boardContent" id="boardContent" class="text-area" placeholder="내용을 입력해주세요." required></textarea> <br>
                        해시태그 <input style="margin-right:20px; width:290px;"type="text" name="hashTag" id="hashTag" class="tag-input" style="width: 290px;" placeholder="해시태그를 입력해주세요.">
                    </div>
                    <div class="btn-area">
                        <button type="button" onclick="" class="btn btn-primary" style="margin-left: 35px;">목록가기</button>
                        <button type="submit" class="btn btn-secondary">등록하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>