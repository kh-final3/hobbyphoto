<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .SocialingHostImage_host__kz5xl {
            position: relative
        }

        .SocialingHostImage_host__image__NUYeg {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%
        }

        .IntroduceHtml_introduce__KLDMs {
            position: relative;
            width: calc(100% - 28px);
            height: auto;
            background-color: #f4f4f4;
            padding: 8px 14px 41px;
            color: #383535;
            font-size: 16px;
            line-height: 26px;
            letter-spacing: -.6px
        }

        .IntroduceHtml_introduce__content__AGQj0 {
            display: inline;
            height: auto;
            white-space: pre-line;
            overflow: scroll;
            -webkit-user-select: text;
            -moz-user-select: text;
            user-select: text
        }

        .IntroduceHtml_introduce__content__AGQj0::-webkit-scrollbar {
            display: none
        }

        .IntroduceHtml_introduce__content__AGQj0 * {
            margin: 0
        }

        .IntroduceHtml_introduce__content__AGQj0 img {
            max-width: 100%
        }

        .Main_template__t9QX6 {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            position: relative;
            background-color: #f4f4f4
        }

        .Main_template__image__l4wQN {
            width: 100%;
            height: 200px;
            object-fit: cover;
            position: relative
        }

        .Main_content__MC5q_ {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: #fefefe;
            position: relative;
            width: calc(100% - 28px);
            top: -25px;
            height: auto;
            border-radius: 16px;
            z-index: 100
        }

        .Main_content__host-img__3fO0S {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
            position: relative;
            bottom: 35px
        }

        .Main_content__host-name__5ligk {
            font-family: Pretendard;
            font-weight: 500;
            font-size: 12px;
            line-height: 12px;
            text-align: center;
            letter-spacing: -.2px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #383535;
            margin-top: 9px;
            white-space: nowrap
        }

        .Main_content__title__2dJZx {
            font-family: Pretendard;
            font-style: normal;
            font-weight: 600;
            font-size: 18px;
            line-height: 24px;
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            padding: 7px 12px 10px
        }


        .Info_template__qLVqv {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            position: relative;
            background-color: #f4f4f4;
            font-family: Pretendard
        }

        .Info_notification__7DgBr {
            width: calc(100% - 28px);
            height: auto;
            display: flex;
            flex-direction: column;
            padding: 0 14px;
            margin-top: 55px;
            margin-bottom: 40px;
            letter-spacing: -.4px
        }

        .Info_notification__title {
            font-weight: 400;
            font-size: 14px;
            line-height: 20px;
            color: #f43630;
            letter-spacing: -.4px;
            float: left
        }

        .Info_notification__introduce {
            font-weight: 600;
            font-size: 18px;
            line-height: 33px;
            float: left;
            color: #242424;
            letter-spacing: -.4px
        }

        .Info_notification__detail__a5KSg {
            margin-top: 8px;
            display: flex;
            justify-content: flex-start;
            flex-direction: column;
            letter-spacing: -.4px
        }

        .Info_detail__4My9u {
            display: flex;
            align-items: center;
            margin-bottom: 7px;
            letter-spacing: -.4px
        }

        .Info_detail__image__Jg5Nb {
            margin-right: 6px
        }

        .Info_detail__info__hl0py {
            font-weight: 400;
            font-size: 16px;
            line-height: 26px;
            letter-spacing: -.4px;
            color: #383535;
            height: 21px;
            white-space: pre-line
        }

        :root {
            --swiper-theme-color: #007aff
        }

        .detail-socialing_content__6jFUF,
        .detail-socialing_template__NkCnA {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column
        }

        .detail-socialing_content__6jFUF {
            max-width: 600px;
            width: 100%;
            position: relative
        }

        #enroll-btn:hover{
            font-weight: bolder;
            cursor: pointer;
        }

        #enroll-btn{
            width: 90%;
            height: 50px;
            margin-top: 10px;
            border: none;
            background-color: black;
            color: white;
            border-radius: 7px;
            font-size: 18px;
            font-weight: 200;
            letter-spacing: 20px;
        }

    </style>
</head>
	<body>
	    <div id="__next">
	        <div class="__className_ff1e61">
	            <div class="detail-socialing_template__NkCnA">
	                <div class="detail-socialing_content__6jFUF">
	                    <div class="Main_template__t9QX6">
	
	                        <!-- 모임홍보사진 -->
	                        <img alt="socialing-detail_image"
	                            src="resources/images/${ sg.img }"
	                            width="600" height="200" decoding="async" data-nimg="1" class="Main_template__image__l4wQN"
	                            loading="lazy" style="color: transparent;">
	                        <div class="Main_content__MC5q_">
	                            <div class="Main_content__host-img__3fO0S"
	                            ><a href="/user-profile?id=486807">
	                                    <div class="SocialingHostImage_host__kz5xl">
	
	                                        <!-- 모임주최자프사 -->
	                                        <img alt="socialinghost"
	                                            src="https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/7r5X/image/9djEiPBPMLu_IvCYyvRPwmZkM1g.jpg"
	                                            width="50" height="50" decoding="async" data-nimg="1"
	                                            class="SocialingHostImage_host__image__NUYeg" loading="lazy"
	                                            style="color: transparent;">
	                                    </div>
	                                </a>
	                                <div class="Main_content__host-name__5ligk">${ sg.userNo }</div>
	                            </div>
	                            <div class="Main_content__title__2dJZx">${ sg.title }
	                            </div>
	                        </div>
	                        <div class="IntroduceHtml_introduce__KLDMs">
	                            <div class="IntroduceHtml_introduce__content__AGQj0">
	                                <div>
	                                    <p>${ sg.content }</p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="Info_template__qLVqv">
	
	                        <div class="Info_notification__7DgBr">
	                            <div class="Info_notification__title">안내사항</div>
	                            <div class="Info_notification__introduce">자세한 정보를 알려드릴게요</div>
	                            <div class="Info_notification__detail__a5KSg">
	                                <span class="Info_detail__4My9u">
	                                    <img alt="map" src="https://images.munto.kr/munto-web/info_group.svg?s=48x48"
	                                        width="24" height="24" decoding="async" data-nimg="1"
	                                        class="Info_detail__image__Jg5Nb" loading="lazy" style="color: transparent;">
	                                    <div class="Info_detail__info__hl0py">${ sg.meTotal }명</div>
	                                </span>
	
	                                <span class="Info_detail__4My9u">
	                                    <img alt="member" src="https://images.munto.kr/munto-web/info_place_24px.svg?"
	                                        height="24" decoding="async" data-nimg="1" class="Info_detail__image__Jg5Nb"
	                                        loading="lazy" style="color: transparent;">
	                                    <div class="Info_detail__info__hl0py">${ sg.location }</div>
	                                </span>
	
	                                <span class="Info_detail__4My9u">
	                                    <img alt="map" src="https://cdn-icons-png.flaticon.com/512/1827/1827463.png"
	                                        width="24" height="24" decoding="async" data-nimg="1"
	                                        class="Info_detail__image__Jg5Nb" loading="lazy" style="color: transparent;">
	                                    <div class="Info_detail__info__hl0py">${ sg.grDate }</div>
	                                </span>
	
	
	                            </div>
	                        </div>
	                        <button id="enroll-btn">신청하기</button>
	                        <br><br><br>
	                    </div>
	                    <div>
	
	                    </div>
	
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
</html>