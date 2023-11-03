<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .innerOuter>img{width: 950px; height: 600px;}
    .Interact{
        width: 950px; 
        height: 30px;
        margin-top: 30px; 
        padding-left: 10px; 
        background-color: black; 
        color: white;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        font-size: 19px;
        font-weight: bolder;
    }
    .it-content{
        border: 1px solid black;
        width: 950px; 
        height: 70px;
        padding: 20px 20px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .it-content>a{margin-right: 10px;}
    .info{
        padding:4px 8px;
        height: 21px;
        margin-right: 10px;
        border: 1px solid black;
        border-radius: 5px;
        font-size: 17px;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 15%;" align="center">
            <h1>${wp.bgTitle}</h1>
            <br>
            <img src="${wp.img}">
            <div class="Interact" align="left">
                <div>Interact</div>
            </div>
            <div class="it-content" align="left">
                <a class="btn btn-dark btn-sm" id="downloadImage">배경화면</a>
                <a class="btn btn-dark btn-sm" id="downloadIPhone">아이폰</a>
                <a class="btn btn-dark btn-sm" id="downloadGalaxy">갤럭시</a>
            </div>
            <div class="Interact" align="left">
                <div>Stats/Info</div>
            </div>
            <div class="it-content" align="left">
                <span class="info btn-dark">admin</span>
                <span class="info btn-dark">👁️‍🗨️ ${wp.count}</span>
                <span class="info btn-dark downloads">📥 ${wp.download}</span>
                <c:if test="${wp.userNo eq loginMember.userNo}">
                    <a class="btn btn-dark btn-sm" style="float:right" href="wpDelete.wp?backNo=${wp.backNo}">삭제하기</a>
                </c:if>
            </div>
        </div>
    </div>
    <script>
        function downloadAndIncreaseCount(imageSrc, imageTitle, width, height) {
            $.ajax({
                type: 'GET',
                url: 'increaseDownload.wp',
                data: { backNo: ${wp.backNo} }, // 동적인 백엔드 데이터 사용
                success: function(data) {
                    if (data === 'success') {
                        // 카운트 증가 성공 후 파일 다운로드
                        var canvas = document.createElement("canvas");
                        canvas.width = width;
                        canvas.height = height;
                        var ctx = canvas.getContext("2d");

                        var image = new Image();
                        image.src = imageSrc;
                        image.onload = function() {
                            ctx.drawImage(image, 0, 0, width, height);

                            var downloadLink = document.createElement("a");
                            downloadLink.href = canvas.toDataURL("image/jpeg"); // 이미지를 JPEG 형식으로 다운로드합니다.
                            downloadLink.download = imageTitle; // 이미지 파일의 이름을 설정합니다.

                            // 링크를 클릭하여 이미지를 다운로드합니다.
                            downloadLink.click();
                        };
                    } else {
                        alert('다운로드 실패.');
                    }
                    $('.downloads').html('📥 ' + ${wp.download + 1});
                },
                error: function() {
                    alert('서버 오류.');
                }
            });
        }

        // 이미지 다운로드 이벤트 처리기 설정
        document.getElementById("downloadImage").addEventListener("click", function() {
            downloadAndIncreaseCount("${wp.img}", "${wp.bgTitle}", 950, 600);
        });

        document.getElementById("downloadIPhone").addEventListener("click", function() {
            downloadAndIncreaseCount("${wp.img}", "${wp.bgTitle}", 1284, 2778);
        });

        document.getElementById("downloadGalaxy").addEventListener("click", function() {
            downloadAndIncreaseCount("${wp.img}", "${wp.bgTitle}", 1440, 2560);
        });
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>