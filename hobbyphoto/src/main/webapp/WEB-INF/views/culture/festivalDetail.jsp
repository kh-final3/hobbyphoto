<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://www.mfac.or.kr/web/css/reset.css?ver=20231011" rel="stylesheet" type="text/css">
    <link href="https://www.mfac.or.kr/web/css/swiper.min.css" rel="stylesheet" type="text/css">
    <link href="https://www.mfac.or.kr/web/css/common.css?ver=20231011" rel="stylesheet" type="text/css">
    <link href="https://www.mfac.or.kr/web/css/sub.css?ver=20231011" rel="stylesheet" type="text/css">
    <link href="https://www.mfac.or.kr/web/css/responsive.css?ver=20231011" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div class="contents">
            <div class="view_wrap whole_wrap">
                <div class="container">
                    <div class="view_top">
                        <div class="imgbox">
                            <span>
                                <img src="${ fe.timg }">
                            </span>
                        </div><!-- //imgbox -->
                        <div class="txtbox">

                            <h3>${ fe.feTitle }</h3>
                            <ul>
                                <li>
                                    <p>장르</p><span>${ fe.feType }</span>
                                </li>
                                <li>
                                    <p>기간</p><span>${ fe.feDate }</span>
                                </li>
                                <li>
                                    <p>장소</p><span>${ fe.feLocation }</span>
                                </li>
                                <li>
                                    <p>이용대상</p><span>${ fe.age }</span>
                                </li>
                                <li>
                                	<c:choose>
                                		<c:when test="${ not empty fe.cash }">
                                    		<p>이용가격</p><span>${ fe.cash }</span>
                                		</c:when>
                                		<c:otherwise>
		                                    <p>이용가격</p><span>프로그램별 상이</span>
                                		</c:otherwise>
                                	</c:choose>
                                </li>
                                <li>
                                    <p>주최,주관</p><span>${ fe.host }</span>
                                </li>



                               
                                <li>
                                    <p>문의 전화</p><span>02-3274-8600[문의1]</span>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="view_contbox">
                        <div class="view_tab">
                            <ul class="w_block">
                                <li class="on"><a href="javascript:void(0);">상세 정보</a></li>
                            </ul>
                            <div class="m_tab">
                                <label for="sub_tab" class="desc_txt">서브 메뉴</label>
                                <select id="sub_tab">
                                    <option>상세 정보</option>
                                </select>
                            </div>
                        </div><!-- //view_tab -->
                        <div class="view_cont">
                            <br><br>
                            <div style="text-align: center;">
                                <strong style="font-size: 22px; text-align: center;">
                                    <a href="https://www.mfac.or.kr/festival/mpf_info2023_2.jsp?sc_type=1"
                                        style="color: inherit; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none;"><span
                                            style="color: rgb(0, 0, 255);">
                                            <span
                                                style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;"><span
                                                    style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;"><span
                                                        style="background-color: rgb(204, 255, 204);">◈◈▷▶ M클래식 축제 전체 일정
                                                        바로가기
                                                    </span>
                                                    <span
                                                        style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;"><span
                                                            style="background-color: rgb(204, 255, 204);">&nbsp;&nbsp;◁◀</span>
                                                    </span>
                                                    <span style="background-color: rgb(204, 255, 204);">◈◈</span>
                                                </span>
                                            </span>
                                        </span>
                                    </a>
                                </strong>
                                <br>
                                <br>
                                <br>
                                <strong><span style="font-size:18px;"><span style="color:#000080;">※ 티켓오픈일정</span><br>
                                        <span style="font-size:16px;"><span style="color:#006666;">☆ 유료회원 선예매 : 7.6(목)
                                                오후2시&nbsp; &nbsp;&nbsp;<br>
                                                ☆ 일반 예매 : 7.7(금) 오후2시</span></span></span></strong><br>
                                <img alt="홍보이미지" src="/userfiles/img_20231010173642.jpg"
                                    !style="width: 1000px; height: 709px;"><br>
                                <br>
                            </div>

                        </div><!-- //view_cont -->
                        <a href="festvalList.fs" id="btnList" class="list_btn"><img
                                src="https://www.mfac.or.kr/web/images/sub/list_ico.png" alt="목록 이미지">목록보기 </a>
                    </div><!-- //view_contbox -->
                </div><!-- //container -->
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
</body>

</html>