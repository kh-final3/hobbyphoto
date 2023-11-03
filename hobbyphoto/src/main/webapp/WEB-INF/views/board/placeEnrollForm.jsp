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
            /* background-color: rgba(0, 0,0,0.1); */
            border-radius: 15px;
            margin-top: 50px;
            margin-left: 160px;
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

        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:700px;height:500px; margin: auto;}
        #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{text-align: center;}
        #menu_wrap .option p {margin:10px 0;}  
        #menu_wrap .option button {margin-left:5px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .item .info{padding:10px 0 10px 55px;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_1 {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>
</head>
<body>
    
	<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <div class="innerOut">
            <div class="board-title">
                <h2 style="text-align: center;">출사 명소</h2> 
            </div>
            <div class="map_wrap">
                <div id="map" style="width:90%;height:100%;position:relative;overflow:hidden;margin-left: 10px;"></div>
            
                <div id="menu_wrap" class="bg_white">
                    <div class="option">
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                키워드 : <input type="text" value="서울" id="keyword" size="15"> 
                                <button type="submit">검색하기</button> 
                            </form>
                        </div>
                    </div>
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
            <form id="enrollForm" method="post" action="insert.pl" enctype="multipart/form-data">
                
                <div class="text">
                <div class="text-area">
                제목 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ptitle" id="ptitle" placeholder="제목을 입력해주세요." required style="width: 530px;"> <br>
                작성자 : &nbsp;&nbsp;&nbsp;<input type="text" name="pwriter" id="pwriter" value="user01" style="border: none; "> <br>
                상세주소 : <input type="text" name="paddress" id="paddress" placeholder="주소를 입력해주세요. ex) 서울 강남구 테헤란로14길 6" required style="width: 530px;"> <br><br>
                한줄평 : &nbsp;&nbsp;&nbsp;<input type="text" name="plocation" id="plocation" placeholder="이 장소를 한줄로 표현해주세요" required style="width: 530px;"> <br><br>
                
                <br>
                <textarea name="pcontent" id="pcontent" cols="30" rows="10" placeholder="" required>
[촬영 시기]
[추천 카메라]
[특징]
등 자유롭게 작성바랍니다...

                </textarea>
            </div>
        </div>
        
        <div class="photo" style="width: 550px;">
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
                <button type="button" class="golist">목록가기</button>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9a2f35856f46bd082d1ef297c29d5fc&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span class="road">' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span class="jibun">' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
    
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

$('#placesList').on('click', 'li', function() {
    if($(this).find('.road').length!=0){
        $("#paddress").val($(this).find('.road').text());
    }else{
        console.log($(this).find('.jibun').text())
        $("#paddress").val($(this).find('.jibun').text());
    }
    $("#ptitle").val($(this).find(".info>h5").text());
});



</script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>