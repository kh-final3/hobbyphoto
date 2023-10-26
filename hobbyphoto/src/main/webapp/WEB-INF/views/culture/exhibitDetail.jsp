<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<title>Document</title>
<style>
.exhibitionDetail {
	width: 96%;
	max-width: 800px;
	margin: 0 auto;
	line-height: 1.5
}

.exhibitionDetail-head {
	padding-bottom: 60px;
	border-bottom: 1px solid #dfdfdf;
	margin-top: 40px
}

.exhibitionDetail-head-title {
	margin-bottom: 8px;
	font-size: 28px;
	font-weight: bold
}

.exhibitionDetail-head-location {
	font-size: 14px;
	color: #989898
}

.exhibitionDetail-carousel {
	margin-top: 12px
}

.exhibitionDetail-carousel-item {
	position: relative;
	width: 100%;
	padding-bottom: 75%
}

.exhibitionDetail-carousel-item:nth-child(n+2) {
	display: none
}

.exhibitionDetail-carousel-imageWrap {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	border: 1px solid #eee;
	background-color: #fafafa;
	overflow: hidden
}

.exhibitionDetail-carousel-image {
	position: absolute;
	display: block;
	width: 100%;
	height: 100%;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%)
}

.exhibitionDetail-carousel>.owl-dots {
	margin-top: 24px
}

.exhibitionDetail-carousel .owl-dots {
	line-height: 8px;
	text-align: center
}

.exhibitionDetail-carousel .owl-dot {
	display: inline-block;
	background-color: #dfdfdf;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	margin: 0 6px;
	vertical-align: top
}

.exhibitionDetail-carousel .owl-dot.active {
	background-color: #989898
}

.exhibitionDetail-section {
	margin-top: 72px
}

.exhibitionDetail-section-title {
	font-size: 20px;
	font-weight: bold;
	text-align: center
}

.exhibitionDetail-section-bar {
	width: 42px;
	height: 3px;
	margin: 8px auto 24px;
	background-color: #222
}

.exhibitionDetail-section-description {
	position: relative;
	padding: 24px 24px 24px 94px;
	margin: 8px 0 30px;
	background-color: #eff3fa;
	border-radius: 4px
}

.exhibitionDetail-section-description>img {
	position: absolute;
	top: 50%;
	left: 40px;
	transform: translateY(-50%);
	width: 22px
}

.exhibitionDetail-section-description>p {
	margin-bottom: 8px;
	font-size: 14px;
	color: #222;
	line-height: 1.5
}

.exhibitionDetail-section-description>a {
	float: right;
	font-size: 12px;
	font-weight: bold;
	color: #007aff;
	line-height: 1.75;
	text-decoration: underline
}

.exhibitionDetail-sm {
	font-size: 12px;
	color: #989898
}

.exhibitionDetail-explain {
	margin: 0 auto;
	font-size: 14px;
	text-align: justify;
	color: #4a4a4a
}

.exhibitionDetail-infoTable {
	border: 1px solid #dfdfdf;
	background-color: #fafafa
}

.exhibitionDetail-infoTable-head {
	border-bottom: 1px solid #dfdfdf;
	background-color: #fff
}

.exhibitionDetail-collectionBox {
	float: right;
	width: 48px;
	height: 48px;
	border-left: 1px solid #eee;
	background: #fff
		url(https://og-data.s3.amazonaws.com/static/pages/img/service/detailview/lined_heart_sprite.png) 3px
		3px no-repeat;
	background-size: 84px 42px;
	cursor: pointer
}

.exhibitionDetail-collectionBox.collected {
	background-position-x: -39px
}

.exhibitionDetail-shareButton {
	float: right;
	width: 48px;
	height: 48px;
	border-left: 1px solid #eee;
	background: #fff
		url(https://og-data.s3.amazonaws.com/static/pages/img/service/detailview/share_icon.png) 3px 3px
		no-repeat;
	background-size: 42px 42px;
	cursor: pointer
}

.exhibitionDetail-infoTable-table {
	table-layout: fixed;
	width: 100%;
	font-size: 14px
}

.exhibitionDetail-infoTable-table th {
	width: 80px;
	padding: 16px 0 0 20px;
	text-align: left;
	vertical-align: top
}

.exhibitionDetail-infoTable-table td {
	padding: 16px 20px 0 20px;
	vertical-align: top
}

.exhibitionDetail-infoTable-table a {
	color: #4085df;
	text-decoration: underline
}

.exhibitionDetail-infoTable-admissionDetail {
	padding-bottom: 16px;
	border-bottom: 1px solid #eee;
	margin-top: 6px
}

.exhibitionDetail-infoTable-footer {
	padding: 14px 20px;
	border-top: 1px solid #eee;
	margin-top: 16px
}

.exhibitionDetail-location {
	border: 1px solid #dfdfdf
}

.exhibitionDetail-location-map {
	height: 248px;
	background-color: #eee
}

.exhibitionDetail-location-caption {
	padding: 15px 20px;
	border-top: 1px solid #dfdfdf;
	background-color: #fff
}

.exhibitionDetail-location-name {
	font-size: 15px;
	font-weight: bold
}

.customoverlay {
	position: relative;
	bottom: 45px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0 1px 2px #888
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden
}

.customoverlay .title {
	display: inline-block;
	text-align: center;
	background: #fff;
	padding: 5px;
	font-size: 14px;
	font-weight: bold
}

.customoverlay .arrow {
	display: inline-block;
	text-align: center;
	background: #1c1c1c;
	padding: 5px;
	font-size: 14px;
	font-weight: bold;
	color: #fff
}

.exhibitionDetail-ogArtists {
	
}

.exhibitionDetail-ogArtists>h4 {
	position: relative;
	font-size: 18px
}

.exhibitionDetail-ogArtists>h4>a {
	position: absolute;
	display: block;
	top: 0;
	right: 0;
	line-height: 27px;
	font-size: 16px;
	font-weight: normal;
	color: #989898
}

.exhibitionDetail-ogArtists>h4>a.lte_8 {
	display: none
}

.exhibitionDetail-ogArtists-artworks {
	margin: 12px 0 40px
}

.exhibitionDetail-artworkGrid {
	display: block;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	float: left;
	width: 24.25%;
	padding: 0;
	border: 1px solid #dfdfdf;
	border-radius: 3px;
	margin: 0 1% 1% 0;
	cursor: pointer;
	position: relative;
	overflow: hidden
}

.exhibitionDetail-artworkGrid:nth-child(4n) {
	margin-right: 0
}

.exhibitionDetail-artworkGrid-maskHolder {
	z-index: 1;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	display: inline-block;
	-webkit-transition: .1s ease-in-out;
	transition: .1s ease-in-out;
	background: rgba(255, 255, 255, 0);
	text-align: center
}

.exhibitionDetail-artworkGrid:hover .exhibitionDetail-artworkGrid-maskHolder
	{
	background: rgba(255, 255, 255, 0.4);
	bottom: 0;
	overflow: hidden
}

.exhibitionDetail-artworkGrid-imgHolder {
	position: relative;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding-bottom: 100%
}

.exhibitionDetail-artworkGrid-imgWrap {
	border-bottom: 1px solid #dfdfdf;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	background-color: #f9f9f9;
	display: none
}

.exhibitionDetail-artworkGrid-imgWrap:before {
	content: "";
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle
}

.exhibitionDetail-artworkGrid-img {
	vertical-align: middle;
	max-width: 100%;
	max-height: 100%
}

.exhibitionDetail-artworkGrid-txtHolder {
	margin: 10px 15px 15px;
	position: relative
}

.exhibitionDetail-artworkGrid-tagHolder {
	position: absolute;
	top: 0;
	right: 0;
	width: 12px;
	height: 18px
}

.exhibitionDetail-artworkGrid-tagHolder>div {
	border-radius: 50%;
	width: 12px;
	height: 12px;
	margin: 3px 0
}

.exhibitionDetail-artworkGrid-tag-red {
	background-color: rgb(223, 59, 50)
}

.exhibitionDetail-artworkGrid-tag-blue {
	background-color: rgb(64, 133, 223)
}

.exhibitionDetail-artworkGrid-tag-gray {
	background-color: rgb(152, 152, 152)
}

.exhibitionDetail-artworkGrid-title {
	margin-bottom: 6px;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden
}

.exhibitionDetail-artworkGrid-tagHolder+.exhibitionDetail-artworkGrid-title
	{
	margin-right: 15px
}

.exhibitionDetail-artworkGrid-info {
	color: #989898;
	font-size: 13px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden
}

.exhibitionDetail-themes-item {
	position: relative;
	display: block;
	float: left;
	width: 32.666667%;
	height: 156px;
	margin: 0 1% 1% 0;
	border-radius: 3px;
	background: no-repeat center;
	overflow: hidden
}

.exhibitionDetail-themes-item:nth-child(3n) {
	margin-right: 0
}

.exhibitionDetail-themes-item-inner {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	padding: 44px 12px 0;
	color: #fff;
	background-color: rgba(0, 0, 0, .25)
}

.exhibitionDetail-themes-tag {
	position: absolute;
	top: 12px;
	left: 12px;
	padding: 0 9px;
	border-radius: 10px;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.15);
	font-size: 12px;
	font-weight: bold;
	color: #222;
	line-height: 20px;
	background-color: #fff;
	text-align: center
}

.exhibitionDetail-themes-title {
	display: inline-block;
	font-size: 12px;
	border-bottom: 1px solid #fff;
	margin-bottom: 4px
}

.exhibitionDetail-themes-sub {
	display: -webkit-box;
	height: 3em;
	font-size: 16px;
	font-weight: bold;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	text-overflow: ellipsis;
	word-break: keep-all;
	word-wrap: break-word;
	overflow: hidden
}

.exhibitionDetail-themes-hash {
	position: absolute;
	bottom: 12px;
	left: 12px;
	font-size: 12px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden
}

.exhibitionDetail-themes-showAll {
	display: block;
	width: 180px;
	height: 50px;
	border-radius: 3px;
	margin: 44px auto 100px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	color: #fff;
	background-color: #222
}

@media screen and (max-width: 991px) {
	.exhibitionDetail-head {
		margin-top: 24px
	}
	.exhibitionDetail-head-location {
		font-size: 12px
	}
	.exhibitionDetail-location-name {
		font-size: 14px
	}
}

@media screen and (max-width: 767px) {
	.exhibitionDetail-head {
		padding-bottom: 30px
	}
	.exhibitionDetail-head-title {
		font-size: 24px
	}
	.exhibitionDetail-carousel {
		margin-top: 10px
	}
	.exhibitionDetail-carousel>.owl-nav {
		margin-top: 16px
	}
	.exhibitionDetail-section {
		margin-top: 48px
	}
	.exhibitionDetail-section-title {
		font-size: 18px
	}
	.exhibitionDetail-section-description {
		padding: 20px 20px 20px 70px;
		margin: 0 0 24px
	}
	.exhibitionDetail-section-description>img {
		position: absolute;
		left: 24px
	}
	.exhibitionDetail-infoTable-table th {
		width: 60px;
		padding-top: 12px
	}
	.exhibitionDetail-infoTable-table td {
		padding-top: 12px
	}
	.exhibitionDetail-infoTable-admissionDetail {
		padding-bottom: 12px
	}
	.exhibitionDetail-infoTable-footer {
		padding: 12px 20px
	}
	.exhibitionDetail-location-map {
		height: 148px
	}
	.exhibitionDetail-location-caption {
		padding: 14px
	}
	.exhibitionDetail-ogArtists>h4>a {
		font-size: 14px
	}
	.exhibitionDetail-ogArtists>h4>a.lte_8 {
		display: block
	}
	.exhibitionDetail-ogArtists>h4>a.lte_6 {
		display: none
	}
	.exhibitionDetail-ogArtists-artworks {
		margin: 10px 0 22px
	}
	.exhibitionDetail-artworkGrid {
		width: 32.295720%;
		margin: 0 1.556420% 1.556420% 0
	}
	.exhibitionDetail-artworkGrid:nth-child(n+7) {
		display: none
	}
	.exhibitionDetail-artworkGrid:nth-child(4n) {
		margin: 0 1.556420% 1.556420% 0
	}
	.exhibitionDetail-artworkGrid:nth-child(3n) {
		margin-right: 0
	}
	.exhibitionDetail-artworkGrid-txtHolder {
		margin: 10px 12px 12px
	}
	.exhibitionDetail-themes-item {
		width: 49.221790%;
		margin: 0 1.556420% 1.556420% 0
	}
	.exhibitionDetail-themes-item:nth-child(n+5) {
		display: none
	}
	.exhibitionDetail-themes-item:nth-child(3n) {
		margin-right: 1.556420%
	}
	.exhibitionDetail-themes-item:nth-child(2n) {
		margin-right: 0
	}
	.exhibitionDetail-themes-showAll {
		width: 160px;
		height: 46px;
		margin: 40px auto 72px;
		line-height: 46px;
		font-size: 16px
	}
}

@media screen and (max-width: 543px) {
	.exhibitionDetail-head {
		margin-top: 28px
	}
	.exhibitionDetail-head-title {
		font-size: 20px
	}
	.exhibitionDetail-carousel {
		margin-top: 8px
	}
	.exhibitionDetail-section-bar {
		margin-bottom: 20px
	}
	.exhibitionDetail-infoTable-table th {
		width: 46px;
		padding: 8px 0 0 12px
	}
	.exhibitionDetail-infoTable-table td {
		padding: 8px 12px 0 12px
	}
	.exhibitionDetail-infoTable-footer {
		padding: 12px;
		margin-top: 12px
	}
	.exhibitionDetail-location-caption {
		padding: 12px
	}
	.exhibitionDetail-ogArtists>h4 {
		font-size: 15px
	}
	.exhibitionDetail-ogArtists>h4>a {
		line-height: 22px;
		font-size: 13px
	}
	.exhibitionDetail-ogArtists-artworks {
		margin: 8px 0 18px
	}
	.exhibitionDetail-artworkGrid-txtHolder {
		margin: 8px
	}
	.exhibitionDetail-artworkGrid-title {
		margin-bottom: 4px;
		font-size: 12px
	}
	.exhibitionDetail-artworkGrid-info {
		font-size: 12px
	}
	.exhibitionDetail-themes-item {
		width: 100%;
		height: 180px;
		margin: 0 0 8px 0
	}
	.exhibitionDetail-themes-item:nth-child(n+4) {
		display: none
	}
	.exhibitionDetail-themes-item:nth-child(3n) {
		margin-right: 0
	}
	.exhibitionDetail-themes-item-inner {
		padding: 58px 12px 0
	}
	.exhibitionDetail-themes-sub {
		max-width: 240px;
		font-size: 18px
	}
	.exhibitionDetail-themes-hash {
		bottom: 16px
	}
	.exhibitionDetail-themes-showAll {
		width: 140px;
		margin-top: 28px
	}
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<div id="wrap" class="header_banner_padding">

		<div id="contents">
			<div class="exhibitionDetail">
				<section class="exhibitionDetail-head">
					<h2 class="exhibitionDetail-head-title">${ fe.feTitle }</h2>
					<div class="exhibitionDetail-head-location">${ fe.feLocation }

					</div>
				</section>
				<section
					class="exhibitionDetail-carousel owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1600px;">
							<div class="owl-item active" style="width: 800px;">
								<div class="exhibitionDetail-carousel-item">
									<div class="exhibitionDetail-carousel-imageWrap">
										<img class="exhibitionDetail-carousel-image"
											src="${ fe.timg }">
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>

				<section class="exhibitionDetail-section">
					<div class="exhibitionDetail-explain">${fe.feContent }</div>
				</section>

				<section class="exhibitionDetail-section">
					<h3 class="exhibitionDetail-section-title">전시 정보</h3>
					<div class="exhibitionDetail-section-bar"></div>
					<div class="exhibitionDetail-infoTable">
						<div class="exhibitionDetail-infoTable-head cf">
							<div class="exhibitionDetail-collectionBox"></div>
							<div class="exhibitionDetail-shareButton"
								data-pathname="/exhibition/4189/"
								data-txt="LOVE IN PARADISE : BANKSY &amp; KEITH HARING #오픈갤러리 #전시정보"></div>
						</div>
						<table class="exhibitionDetail-infoTable-table">
							<tbody>

								<tr>
									<th>장소</th>
									<td>${ fe.feLocation }</td>
								</tr>
								<tr>
									<th>기간</th>
									<td>${ fe.feDate }</td>
								</tr>

								<tr>
									<th>관람료</th>
									<td><c:choose>
											<c:when test="${ not empty fe.cash }">
                                    		 ${ fe.cash }
                                		</c:when>
											<c:otherwise>
		                                    전시별 상이
                                		</c:otherwise>
										</c:choose></td>
								</tr>

								<tr>
									<th>주최</th>
									<td>${ fe.host }</td>
								</tr>



								<tr>
									<th>출처</th>
									<td class="exhibitionDetail-infoTable-url"><a
										href="${ fe.url }" target="_blank">사이트 바로가기</a></td>
								</tr>


								<tr>
									<th>문의</th>
									<td class="exhibitionDetail-infoTable-contact">
										${ fe.inq }
										<div
											class="exhibitionDetail-infoTable-contactSub exhibitionDetail-sm">
											(전시 정보 문의는 해당 연락처로 전화해주세요.)</div>
									</td>
								</tr>

							</tbody>
						</table>
						<div class="exhibitionDetail-infoTable-footer exhibitionDetail-sm">
							* 주최 측의 사정에 따라 변경될 수 있습니다.</div>
					</div>
				</section>

				<section class="exhibitionDetail-section">
					<h3 class="exhibitionDetail-section-title">위치 정보</h3>
					<div class="exhibitionDetail-section-bar"></div>
					<div class="exhibitionDetail-location">
						<div id="map" style="width: 100%; height: 350px;"></div>

						<div class="exhibitionDetail-location-caption">
							<div class="exhibitionDetail-location-name">${ fe.feLocation }</div>
							<div class="exhibitionDetail-sm"></div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div align="center">
			<a href="exhibitList.fs" class="btn btn-sm btn-secondary" style="width: 90px; height: 35px; font-size: medium;">목록가기</a>
					<!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우 -->
	
			<a href="updateForm.ex?feNo=${ fe.feNo }" class="btn btn-sm btn-warning" style="width: 90px; height: 35px; font-size: medium;">수정하기</a>
			<a href="delete.fs?feNo=${ fe.feNo }" class="btn btn-sm btn-danger" style="width: 90px; height: 35px; font-size: medium;">삭제하기</a>
		
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9a2f35856f46bd082d1ef297c29d5fc&libraries=services"></script>
	<script>
        var mapContainer = document.getElementById('map'),
        mapOption = { 
            center: new kakao.maps.LatLng(${fe.latitude}, ${fe.longitude}), 
            level: 3 
        }; 

        var map = new kakao.maps.Map(mapContainer, mapOption); 

        var marker = new kakao.maps.Marker({
            map: map, 
            position: new kakao.maps.LatLng(${fe.latitude}, ${fe.longitude})
        });

        var content = '<div class="wrap">' + 
                    '    <div class="info">' + 
                    '        <div class="title">' + 
                    "             ${ fe.feLocation }" + 
                    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                    '        </div>' + 
                    '        <div class="body">' + 
                    '            <div class="img">' +
                    '                <img src="${ fe.timg }" width="73" height="70">' +
                    '           </div>' + 
                    '            <div class="desc">' + 
                    '                <div><a href="${ fe.url }" target="_blank" class="link">전시 홈페이지</a></div>' + 
                    '            </div>' + 
                    '        </div>' + 
                    '    </div>' +    
                    '</div>';

        var overlay = new kakao.maps.CustomOverlay({
            content: content,
            map: map,
            position: marker.getPosition()       
        });

        kakao.maps.event.addListener(marker, 'click', function() {
            overlay.setMap(map);
        });

        function closeOverlay() {
            overlay.setMap(null);     
        }

		
    </script>

	<script>
		let lat = ${fe.latitude};
		let lng = ${fe.longitude};
		getAddr(lat,lng);
		function getAddr(lat,lng){
			let geocoder = new kakao.maps.services.Geocoder();
		
			let coord = new kakao.maps.LatLng(lat, lng);
			let callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					$(".exhibitionDetail-sm").html(result[0].road_address.address_name);
				}
			}
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>