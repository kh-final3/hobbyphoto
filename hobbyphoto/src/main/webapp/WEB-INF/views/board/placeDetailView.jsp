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
            height: 2000px;
            margin: auto;
            /* background-color: rgba(0, 0,0,0.1); */
            border-radius: 15px;
            margin-top: 20px;
        }
        
        .outline{
            border: 1px solid white;
            width: 90%;
            /* height: 1100px; */
            margin: auto;
            margin-top: 45px;
            background-color: white;
            border-radius: 15px;
        }

        .content-area{
            border: 1px solid red;
            width: 100%;
            height: 1,360px;
            border: none;
        }

        .review-area{
            border: 1px solid blue;
            width: 100%;
            height: 20%;
            border: none;
        }

        .detail-area{
            width: 100%;
            height: 300px;
            border: none;
        }

        .photo-area {
            width: 100%;    
            display: flex;
            flex-wrap: wrap; 
            justify-content: center; 
            align-items: flex-start; 
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
            height: 30px;
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
            height: 30px;
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
            width: 22%;
            height: 350px;
            margin-left: 30px;
            margin-top: 25px;
        }
        .overlay_info {
            border-radius: 6px;
            margin-bottom: 12px;
            float: left;
            position: relative;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            background-color: #fff;
        }

        .overlay_info:nth-of-type(n) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .overlay_info a {
            display: block;
            background: #d95050;
            background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
            text-decoration: none;
            color: #fff;
            padding: 12px 36px 12px 14px;
            font-size: 14px;
            border-radius: 6px 6px 0 0;
        }

        .overlay_info a strong {
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat;
            padding-left: 27px;
        }

        .overlay_info .desc {
            padding: 14px;
            position: relative;
            min-width: 190px;
            height: 100%;
        }

        .overlay_info img {
            vertical-align: top;
        }

        .overlay_info .address {
            font-size: 12px;
            color: #333;
            position: absolute;
            left: 80px;
            right: 14px;
            top: 24px;
            white-space: normal;
        }

        .overlay_info:after {
            content: '';
            position: absolute;
            margin-left: -11px;
            left: 50%;
            bottom: -12px;
            width: 22px;
            height: 12px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;
        }
        .list-content{
            height: 100%;
        }
        .bookmark{
            text-align: right;
        }

        #bookmark1,
        #bookmark2 {
            background-color: white;
            border: white;
            width: 48px;
            height: 48px;
            text-align: center;
        }

        #bookmark1 img,
        #bookmark2 img{

            width: 100%;
            margin: auto;
            display: block;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <br><br>
        <h2 align="center">출사명소</h2>
        <br>
        <div class="outline">
        
            <div class="content-area">
                <div class="detail-area">
                    <div class="text-area">
                        <ul class="ul-area">
                            <li class="li-area">
                                <div class="board-title">&nbsp;&nbsp;제목 : ${ p.ptitle }</div>                               
                                <div class="board-create">${ p.createDate }</div>
                                <br><br>
                                    <div class="bookmark">
                                        <button id="bookmark1" onclick="insertBook();">
                                            <img src="resources/images/bookmark_blank.png">
                                        </button>
                                        <button id="bookmark2" onclick="deleteBook();" style="display: none;">
                                            <img src="resources/images/bookmark.png">
                                        </button>
                                    </div>
                                
                            </li>
                            <hr>
                            <li class="li-area1">
                                <div class="board-writer">&nbsp;&nbsp;작성자 : ${ p.pwriter }</div>
                                <div class="board-ect">조회수 : ${ p.count } &nbsp;&nbsp;&nbsp; 추천수 : 3 &nbsp;&nbsp;&nbsp; 댓글 : 2</div>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <div class="list-content">[주소] ${ p.paddress } <br> [내용] ${p.pcontent}<br>
                      
                    </div>
                </div>

                <hr>
                <div>
                    <h2 style="text-align: center; margin-top: 30px;">상세 사진</h2>
                </div>
                <div class="photo-area">
                    <img src="${ p.pimg1 }" >
                    <c:if test="${ not empty p.pimg2}" >
                        <img src="${ p.pimg2 }" >
                    </c:if>
                    <c:if test="${ not empty p.pimg3}" >
                        <img src="${ p.pimg3 }" >
                    </c:if>
                    <c:if test="${ not empty p.pimg4}" >
                        <img src="${ p.pimg4 }" >
                    </c:if>
                </div>
                <hr>
                <div class="map-area">
                    <div id="map" style="width:100%;height:350px;"></div>
                    <div id="roadview" style="width:100%;height:300px"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9a2f35856f46bd082d1ef297c29d5fc&libraries=services"></script>
                <script>
					var mapContainer = document.getElementById('map'); // 지도를 표시할 div
					var mapCenter; // 변수 to store the map's center coordinates
					var mapOption = {
					    center: new kakao.maps.LatLng(33.450701, 126.570667), // Default center coordinates
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('${p.paddress}', function(result, status) {
					    // 정상적으로 검색이 완료됐으면
					    if (status === kakao.maps.services.Status.OK) {
					        mapCenter = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: mapCenter
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">${ p.ptitle }</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(mapCenter);
					
					        // Initialize Roadview
					        var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
					        var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
					        var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper 객체
					        // Get the nearest panoId for Roadview from the map's center
                            

                                rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
                                    if(panoId == null) {
                                        $("#roadview").css('display', 'none');
                                    return;
                                    }else 
                                    rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
                                    console.log(rv.getPanoId())
                                    
                                });
                            
        
                                kakao.maps.event.addListener(rv, 'init', function() {
                                    // 커스텀 오버레이를 생성합니다
                                    var rvCustomOverlay = new kakao.maps.CustomOverlay({
                                        position: mapCenter,
                                        content: '<div class="overlay_info">' +
                                            '    <a href="https://place.map.kakao.com/17600274" target="_blank">${ p.ptitle }</a>' +
                                            '    <div class="desc">' +
                                            '        <img src="${p.pimg1}" width="56px" height="56px">' +
                                            '        <span class="address">${ p.paddress }</span>' +
                                            '    </div>' +
                                            '</div>',
                                        xAnchor: 0.5,
                                        yAnchor: 0.5
                                    });
                                    
                                        rvCustomOverlay.setMap(rv);

                                });
                            
					    }
					});
					</script>
                </div>
            </div>
            <div class="btn-area" style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
                <button type="button" class="golist btn btn-primary">목록가기</button>
                <button type="button" class="update btn btn-warning">수정하기</button>
                <button type="button" class="delete btn btn-danger">삭제하기</button>
            </div>
            
            
        </div>
        
    </div>
    <script>
        $(function(){
            $(".update").click(function(){
                location.href = 'updateForm.pl?pno='+ ${p.pno}
            })

            $(".golist").click(function(){
                location.href = 'list.pl'
            })
            
            $(".delete").click(function(){
                location.href = 'delete.pl?pno='+ ${p.pno}
            })
        })
        
    </script>

<div class="modal" id="reportBoard">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><b>신고하기</b></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          <form action="reportBoard.bo" method="post">
            <p>작성자 : ${ p.pwriter}</p>
            <p>글 제목 : ${p.ptitle}</p>
            
            <input name="refBno" type="hidden" value="${ p.pno}">
            <input name="reportedUno" type="hidden" value="${ loginMember.userNo} ">
           
            <input name="reportUno" type="hidden" value="2">
          
            <hr>
            
                <input type="radio" id="r1" name="guilty" value="영리목적/홍보성">
                <label for="r1">영리목적/홍보성</label><br>
                <input type="radio" id="r2" name="guilty" value="욕설/인신공격">
                <label for="r2">욕설/인신공격</label> <br>
                <input type="radio" id="r3" name="guilty" value="도배">
                <label for="r3">같은 내용 반복(도배)</label> <br>
                <input type="radio" id="r4" name="guilty" value="개인정보노출">
                <label for="r4">개인정보노출</label> <br>
                <input type="radio" id="r5" name="guilty" value="불법정보">
                <label for="r5">불법정보</label><br>
                <input type="radio" id="r6" name="guilty" value="음란성/선정성">
                <label for="r6">음란성/선정성</label> <br>
    
            <textarea name="rpContent" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요." cols="50" rows="3" style="margin: 20px;"></textarea>
            <br><button type="submit" class="btn btn-secondary" id="rpt_btn" style="width: 100%; height: 40px; margin-top: 15px;">신고</button>
          </form>
        </div>

     </div>
        
    </div>
</div>

<script>
    if (${ loginMember.userNo } !== null) {
        userNo = ${ loginMember.userNo };

        function insertBook() {
            $.ajax({
                url: "book.bo",
                data: {
                boardNo: ${ p.pno },
                boardWriter: userNo,
                boardType: 6
            },
                success: function (result) {
                    if (result === 'Y') {
                        $("#bookmark1").css("display", "none");
                        $("#bookmark2").css("display", "");						
                    }
                },
                error: function () {
                }
            });
        }

        function deleteBook() {
            $.ajax({
                url: "deleteBook.bo",
                data: {
                    boardNo: ${ p.pno },
                    boardWriter: userNo,
                    boardType: 6
                    },
                success: function (result) {
                    if(result == 'Y'){
                        $("#bookmark1").css("display", "");
                        $("#bookmark2").css("display", "none");
                    }
                },
                error: function () {
                }
            });
        }
                $(function () {
                    $.ajax({
                        url: "bookCheck.bo",
                        data: {
                            boardNo: ${ p.pno },
                            boardWriter: userNo,
                            boardType: 6
                            },
                    success: function (result) {
                        if(result == 'Y'){
                            $("#bookmark2").css("display", "");
                            $("#bookmark1").css("display", "none");
                        }else{
                            $("#bookmark2").css("display", "none");
                            $("#bookmark1").css("display", "");                    	
                        }
                    },
                    error: function (result) {
                    }
                });
        })
    }
</script>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>