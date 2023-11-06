<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<style>
        .warp {
            width: 1400px;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .innerOuter {
            margin-top: 20px;
            margin-bottom: 10px;
            height: 900px;
            margin: auto;
            position: relative; /* 추가: 부모 요소의 position을 relative로 설정 */
            width:297px;
        }

        .photo {
            width: 100%;
            height: 100%;
            margin: auto;
            position: absolute; /* 추가: 자식 요소의 position을 absolute로 설정 */
            top:1px;
            left:1px;
            z-index: 1;
            pointer-events: none; 
        }
        
        .photo img{
        	width: 100%;
        	height: 100%;
        }

        .cut1 {
            border: 1px solid royalblue;
            width: 278px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 10px;
            border: none;
        }

        .cut2 {
            border: 1px solid royalblue;
            width: 278px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 205px;
            border: none;
        }

        .cut3 {
            border: 1px solid royalblue;
            width: 278px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 400px;
            border: none;
        }

        .cut4 {
            border: 1px solid royalblue;
            width: 278px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 595px;
            border: none;
        }

        #photo1 {
            width: 100%;
            height: 100%;
            z-index: 10;
        }

        #photo2 {
            width: 100%;
            height: 100%;
            z-index: 10;
        }

        #photo3 {
            width: 100%;
            height: 100%;
            z-index: 10;
        }

        #photo4 {
            width: 100%;
            height: 100%;
            z-index: 10;
        }
        
        .btn-area{
        	width: 300px;
        	margin: auto;
        }
        
        .btn{
        	width: 300px;
        	margin-bottom: 10px;
        }


    </style>

</head>
<body>
<!-- 여기에 있는 정보 =>'t'에 있다: tNo,price,temName,pType,titleImg,temImg  --> 
<!-- po에 있는 정보 => pNo,tNo,userNo,count -->
	<jsp:include page="../common/header.jsp"/>
	<div class="warp">
        <div class="innerOuter" id="innerOuter">
            <div class="photo">
                <img src="${ t.titleImg }" height="900">
            </div>
            <div class="cut1">
                <img src="" alt="" id="photo1" onclick="chooseFile(1)">
                <input type="file" name="upfiles" id="file1" style="display: none;" onchange="loadImg(this,1);">
            </div>
            <div class="cut2">
                <img src="" alt="" id="photo2" onclick="chooseFile(2)">
                <input type="file" name="upfiles" id="file2" style="display: none;" onchange="loadImg(this,2);">
            </div>
            <div class="cut3">
                <img src="" alt="" id="photo3" onclick="chooseFile(3)">
                <input type="file" name="upfiles" id="file3" style="display: none;" onchange="loadImg(this,3);">
            </div>
            <div class="cut4">
                <img src="" alt="" id="photo4" onclick="chooseFile(4)">
                <input type="file" name="upfiles" id="file4" style="display: none;" onchange="loadImg(this,4);">
            </div>
        </div>
        <br>
        <div class="btn-area">
            <button type="button" class="btn btn-dark btn" onclick="partShot();">완료</button>
            <br>
        	<button type="button" class="btn btn-dark" onclick="finish();">다음</button>
        </div>
        
    </div>


    <script>
        function chooseFile(num) {
            $("#file" + num).click();
        }

        function loadImg(input, num) {
            var image = document.getElementById("photo" + num); // 수정: id를 "photo" + num으로 변경
            var file = input.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    image.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
        
        function partShot() {
		    html2canvas(document.getElementById("innerOuter"))
		        .then(function (canvas) {
		            var capturedImage = canvas.toDataURL();
                    $.ajax({
                        type: 'POST',
                        url: "base64.wp",
                        data: {
                            pngData: capturedImage
                        },
                    }).done(function (data) {
                        console.log(data);
                        saveImageOnServer(data);
                    });
		            console.log("캡처된 이미지 데이터 URL:", data);
		        })
		        .catch(function (err) {
		            console.log(err);
		        });
		}
		function saveImageOnServer(imageData) {
            console.log(imageData)
		    $.ajax({
		    	type: "POST",
		        url: "save.photo", // 서버의 엔드포인트로 교체
		        data: { 
		        	imgs: imageData, 
					userNo:'${loginMember.userNo}',
					tNo:${t.TNo}
		        	},
		        success: function (response) {
		            console.log("서버에 이미지 저장됨:", response);
		        },
		        error: function (err) {
		            console.error("서버에 이미지 저장 중 오류 발생:", err);
		        }
		    });
		}
        
		
		function finish(){
			location.href="finish.tem?pNo="+${po.PNo}+"&tNo="+${t.TNo}
		}

    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>