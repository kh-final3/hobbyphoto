<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<!-- jQuery library -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
			<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

			<style>
				#ff1 {
					font-family: 'NanumBarunGothicExtraLight';
				}

				#ff2 {
					font-family: 'NanumBarunGothicLight';
				}

				#ff3 {
					font-family: 'NanumBarunGothic';
				}

				#ff4 {
					font-family: 'NanumBarunGothicBold';
				}

				#write {
					width: 1200px;
					margin: auto;
					margin-bottom: 100px;
					margin-top: 100px;
				}

				#write1,
				#write2,
				#write3,
				#write4,
				#write5,
				#write6,
				#write7,
				#write8,
				#write9,
				#write10,
				#write11,
				#write12,
				#write13 {
					width: 670px;
					margin: 0 auto;
				}

				#searchimg {
					position: absolute;
					right: 460px;
					/* float: right; */
					margin: 12px 0 0 0;
					width: 15px;
					height: 15px;
					cursor: pointer;
				}

				#mtinput {
					float: right;
				}

				#top {
					width: 50px;
					height: 50px;
				}

				#dateIn {
					width: 250px;
				}

				input[type="number"] {
					width: 50px;
				}

				#ttl {
					font-weight: bolder;
					letter-spacing: 5px;
					margin-top: 100px;
					margin-bottom: 60px;
				}
			</style>
		</head>

		<body>
			<jsp:include page="../common/header.jsp"/>

			<div id="write">
				<h1 align="center" id="ttl">축제/전시 작성</h1>
				<form action="insertCulture.fs" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userNo" value="">
					<div id="write1">
						<p id="ff4">
							포스터 <em style="color: red;">*</em>
						</p>

						<div class="uploadimg">
							<img id="titleImg" width="250" height="170" onclick="chooseFile(1);">
							<div id="file-area" style="display: none">
								<input type="file" name="upfile" id="file1" onchange="loadImg(this, 1);" required>
							</div>
						</div>
					</div>
					<br>
					<div id="write2">
						<label id="ff4">제목</label><br> <input type="text" name="feTitle"
							style="width: 650px; margin: 5px 0 0 0;" maxlength="18" required>

					</div>
					<br>
					<div id="write3">
						<label id="ff4">내용</label><br>
						<div id="content"></div>
						<input type="hidden" name="feContent" class="feContent">
						<br>
					</div>
					<br>
					
					<div id="write4">
						<hr>
						<label id="ff4">전시/축제</label><br> 
						<input type="radio" name="feType" id="E" value="전시">
						<label for="E">전시</label>
						<input type="radio" name="feType" id="F" value="축제"> 
						<label for="F">축제</label>
						<br>
					</div>
					<br>

					<div id="write5">
						<hr>
						<span id="ff4">📍 장소</span> <br> <input type="text" name="feLocation"
							style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 김포공항" required>
					</div>
					<br>

					<div id="write6">
						<hr>
						<span id="ff4">📅 기간</span><br>
						<input type="date" name="feDate1" id="dateIn" required> 부터
						<input type="date" name="feDate2" id="dateIn" required> 까지
						<hr>
					</div>
					<br>
					<div id="write8">
						<span id="ff4">문의전화</span> <br> <input type="text" name="inq"
							style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 080-335-0020" required>
						<hr>
					</div>
					<br>
					<div id="write9">
						<span id="ff4">이용대상</span> <br> <input type="text" name="age"
							style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 누구나 이용가능 / 8세이상등.." required>
						<hr>
					</div>
					<br>
					<div id="write10">
						<span id="ff4">관람료</span> <br> <input type="text" name="cash"
							style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 10,000원, 무료등.." required>
						<hr>
					</div>
					<br>
					<div id="write11">
						<span id="ff4">주최</span> <br> <input type="text" name="host"
							style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 마포구" required>
						<hr>
					</div>
					<br>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<input type="text" name="latitude" id="lat" readonly>
					<input type="text" name="longitude" id="lon" readonly>
					

					<div align="right" id="write12">
						<button type="reset" class="btn btn-light" id="ff4">취소</button>
						<button type="submit" class="btn btn-primary" id="ff4">등록</button>
					</div>

					<div id="topbtn">
						<a style="display: scroll; position: fixed; bottom: 10px; right: 5px;" href="#" title="top">
							<img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top" alt="">
						</a>
					</div>
				</form>
			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9a2f35856f46bd082d1ef297c29d5fc"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3
						// 지도의 확대 레벨
					};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({
					// 지도 중심좌표에 마커를 생성합니다 
					position: map.getCenter()
				});
				// 지도에 마커를 표시합니다
				marker.setMap(map);

				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

					// 클릭한 위도, 경도 정보를 가져옵니다 
					var latlng = mouseEvent.latLng;

					// 마커 위치를 클릭한 위치로 옮깁니다
					marker.setPosition(latlng);

					var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					message += '경도는 ' + latlng.getLng() + ' 입니다';
					$("#lat").val(latlng.getLat());
					$("#lon").val(latlng.getLng());

					var resultDiv = document.getElementById('clickLatlng');
					resultDiv.innerHTML = message;

				});

				
			</script>
			<script>
				function chooseFile(num) {
					$("#file" + num).click();
				}
				function loadImg(inputFile, num) {
					if (inputFile.files.length == 1) {
						const reader = new FileReader();
						reader.readAsDataURL(inputFile.files[0]);
						reader.onload = function (e) {
							switch (num) {
								case 1:
									$("#titleImg").attr("src", e.target.result);
									break;
							}
						}
					} else {
						switch (num) {
							case 1:
								$("#titleImg").attr("src", null);
								break;
						}
					}
				}
			</script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		$("#content").keyup(function(){
			$(".feContent").val(editor.getHTML());	
		})

		const editor = new toastui.Editor({
			el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
			height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
			initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
			initialValue: '',                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
			previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
			placeholder: '내용을 입력해 주세요.',
			/* start of hooks */
			hooks: {
				async addImageBlobHook(blob, callback) { // 이미지 업로드 로직 커스텀
					try {
						/*
						* 1. 에디터에 업로드한 이미지를 FormData 객체에 저장
						*    (이때, 컨트롤러 uploadEditorImage 메서드의 파라미터인 'image'와 formData에 append 하는 key('image')값은 동일해야 함)
						*/
						const formData = new FormData();
						formData.append('image', blob);
						
						// 2. FileApiController - uploadEditorImage 메서드 호출
						const response = await fetch('tui-editor/image-upload', {
							method : 'POST',
							body : formData,
						});
	
						// 3. 컨트롤러에서 전달받은 디스크에 저장된 파일명
						const filename = await response.text();
						console.log('서버에 저장된 파일명 : ', filename);
						console.log(filename);
						// 4. addImageBlobHook의 callback 함수를 통해, 디스크에 저장된 이미지를 에디터에 렌더링
						const imageUrl = `tui-editor/image-print?filename=`+filename;
						console.log(imageUrl);
						callback(imageUrl, 'image alt attribute');
	
					} catch (error) {
						console.error('업로드 실패 : ', error);
					}
				}
			}
			/* end of hooks */
		});
		</script>
		<jsp:include page="../common/footer.jsp"/>

</body>
</html>