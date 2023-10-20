<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <style>
        /* div {border: 1px solid black;} */
        #ft_footer{
            display: flex;
            flex-direction: row; /* 로고와 푸터를 가로로 나열 */
            align-items: flex-start; /* 세로 정렬을 맨 위로 조정 */
            height: 200px;
            box-sizing: border-box; 
            margin: auto;
            margin-top: 50px;
            text-align: left;
            font-family: 'NanumBarunGothic';
        }
        .footer_info {
          margin-top: 10px;
          margin-left: 20px;
        }

        #ft_logo {
            height: 100%;
            width: 20%;
        }

        #ft_logo img{
            display: block;
            margin: auto;
            margin-left: 85px;
            padding-top: 50px;
            width: 60%;
            height: 50%;
        }

        #ft_footer1 {
            height: 50px;
            margin-top: 10px; 
            margin-left: 10px;
            display: flex;
            justify-content: left;
            align-items: center;
        }

        #ft_footer2 {
            margin-top: 5px;
            margin-left: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #ft_footer a {
            height: 30%;
            text-decoration: none; 
            color: black;
            font-weight: 600;
            margin: 15px;
            font-size: 16px;
        }

        #ft_footer p {
            height: 70%;
            margin-top: 20px;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <div id="ft_footer">
        <div id="ft_logo">
            <img src="resources/images/logo.png" alt="">
        </div>
          <div class="footer_info">
            <div id="ft_footer1">
              <a href="#">회사 소개</a> 
              <a href="#">공지사항</a> 
              <a href="#">연락처</a> 
              <a href="#">광고문의</a> 
              <a href="#">채용</a> |
              <a href="#">개인정보 처리방침</a>
              <a href="#">서비스 이용약관</a>
          </div>
          <div id="ft_footer2">
              <p>
                  상호명 : (주)하비포토 | 대표자 : 윤지영 <br>
                  사업자등록번호 : 592-68-230926 | 통신판매업신고번호 : 제 2023-서울강남-05367호 | 직업정보 제공사업 신고번호 : K120235648630009 <br>
                  주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 3층 H호 | 고객센터 : final3.kh@gmail.com (영업시간 평일 9:00 ~ 18:00) 주말 공휴일 휴무 <br>
                  @2023 (주)하비포토, INC All rights reserved.
              </p>
          </div>
        </div>      
    </div>
</body>
</html>