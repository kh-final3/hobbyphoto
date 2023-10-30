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
                            ${fe.feContent}
                            

                        </div><!-- //view_cont -->
                  

                        <div align="center" class="buttons">
                            <a href="festivalList.fs" class="btn btn-sm btn-secondary"
                                style="width: 90px; height: 35px; font-size: medium; margin-right: 10px; border-radius: 5px;">목록가기</a>
                            <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우 -->
                            <c:if test="${ loginMember.userNo eq 1}">
        
                                <a href="updateForm.fs?feNo=${ fe.feNo }" class="btn btn-sm btn-warning"
                                style="width: 90px; height: 35px; font-size: medium; margin-right: 10px; border-radius: 5px;">수정하기</a> 
                                <a href="delete.fs?feNo=${ fe.feNo }" class="btn btn-sm btn-danger"
                                style="width: 90px; height: 35px; font-size: medium; border-radius: 5px;">삭제하기</a>
                            </c:if>
        
                        </div>
                    </div><!-- //view_contbox -->
                </div><!-- //container -->
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
</body>

</html>