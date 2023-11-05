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
            border: 1px solid black;
            width: 1400px;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .innerOuter {
            border: 1px solid red;
            margin-top: 20px;
            margin-bottom: 10px;
            height: 900px;
            margin: auto;
            position: relative; /* 추가: 부모 요소의 position을 relative로 설정 */
            width:297px;
        }

        .photo {
            border: 1px solid black;
            width: 100%;
            margin: auto;
            position: absolute; /* 추가: 자식 요소의 position을 absolute로 설정 */
        }

        .cut1 {
            border: 1px solid royalblue;
            width: 276px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 10px;
            /* 추가: z-index를 설정하여 cut1이 위에 표시되도록 함 */
            z-index: 1;
            border: none;
        }

        .cut2 {
            border: 1px solid royalblue;
            width: 276px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 205px;
            /* 추가: z-index를 설정하여 cut1이 위에 표시되도록 함 */
            z-index: 1;
            border: none;
        }

        .cut3 {
            border: 1px solid royalblue;
            width: 276px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 400px;
            /* 추가: z-index를 설정하여 cut1이 위에 표시되도록 함 */
            z-index: 1;
            border: none;
        }

        .cut4 {
            border: 1px solid royalblue;
            width: 276px;
            position: absolute;
            height: 183px;
            margin-left: 9.8px;
            margin-top: 595px;
            /* 추가: z-index를 설정하여 cut1이 위에 표시되도록 함 */
            z-index: 1;
            border: none;
        }

        #photo1 {
            width: 100%;
            height: 100%;
            opacity: 0.5;
        }

        #photo2 {
            width: 100%;
            height: 100%;
            opacity: 0.5;
        }

        #photo3 {
            width: 100%;
            height: 100%;
            opacity: 0.5;
        }

        #photo4 {
            width: 100%;
            height: 100%;
            opacity: 0.5;
        }


    </style>

</head>
<body>
<!-- 여기에 있는 정보 =>'t'에 있다: tNo,price,temName,pType,titleImg,temImg  --> 
	<div class="warp">
        <div class="innerOuter" id="innerOuter">
            <div class="photo">
                <img src="${ t.titleImg }" alt="" height="900">
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
        <div class="btn-area">
            <button type="button" onclick="partShot();">완료</button>
        </div>
        <div>
        	<button type="button" onclick="finish();">다음</button>
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
        //이미지 변경
   
        
        //function partShot() {
        //    html2canvas(document.getElementById("innerOuter"))
        //        .then(function (canvas) {
        //            var capturedImage = canvas.toDataURL('image/jpeg');
        //            console.log("캡처된 이미지 데이터 URL:", capturedImage);
        //            saveImageAsFile(capturedImage, "captured_image.jpg");
        //        })
        //        .catch(function (err) {
        //            console.log(err);
        //        });
        //}

        //function saveImageAsFile(dataURL, fileName) {
        //    var link = document.createElement("a");
        //    link.href = dataURL;
        //    link.download = fileName;
        //    link.click();
       // }
        
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
			//imageData는 canvas.toDataURL메서드 때문에 자동으로 생성 => 임의 변경 불가
		    // POST 요청을 사용하여 캡처한 이미지 데이터를 서버로 전송합니다.
            console.log(imageData)
		    $.ajax({
		    	type: "POST",
		        url: "save.photo", // 서버의 엔드포인트로 교체
		        data: { 
		        	imgs: imageData, 
					userNo:'${loginMember.userNo}'      	
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
			location.href="finish.tem"
		}
        
        
        
        

    </script>
</body>
</html>