<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  	
  <style>
    div{/*box-sizing: border-box; border: 1px solid ;*/ font-family: 'NanumBarunGothic';}
        .mb_outer{
            height: 120px;
            margin-top: 10px;
            margin: auto;
            margin-left: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center; 
        }

        .mb_outer>div{height: 100%; float: left;}
        .mb_menu-area{
            width: 70%; 
            height: auto;
            /* border: 1px solid blue;  */
        }
        .mb_login-area{
            width: 20%;
            margin-left: 20px; 
            /* border: 1px solid red; */
        }

        .mb_menu-area>div{height: 100%; float: left;}
        #mb_logo{width: 15%; height: 100%;}
        #mb_nav{width: 80%;}
        #mb_logo>img{
            display: block; 
            width: 100%; 
            height: 40%; 
            margin: auto;
            margin-top: 35px;
        } 
        #mb_logo>img:hover{
            cursor: pointer;
        }

        #mb_navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
            display: flex
        }

        #mb_navi a:hover {
           font-weight: 1000;
        }

        .mb_search-area, .mb_login-area {
            display: flex;
            align-items: center;
        }

        .mb_login-area>div{
            height: 70%;
            float: right;
            margin-top: 20px;
            /* border: 1px solid black; */
        }
        #mb_user_1{
            margin-top: 5px;
        }

        #mb_search {
            margin-right: 10px;
        }

        #mb_navi li {
            float: left;
            text-align: center;
            width: 15%; 
            /* border: 1px solid red; */
            height: 100%;
        }

        #mb_navi a {
            text-decoration: none;
            color: rgb(50, 50, 50);
            font-size: 18px;
            font-weight: 500;
            display: block;
            height: 100%;
            width: 100%;
            line-height: 120px;
            cursor: pointer;
        }

        #mb_navi li:nth-child(7) {
            margin-left: auto;
        }
    
        .mb_search-area {
            width: 150px;
        }
        
        #sh_text {
            margin-left: 10px;
            margin-top: 5px;
            width: 180px;
            border: none; 
            border-bottom: 1px solid #aeaeae; 
        }
        #search_text {
        display: flex;
        }

        #search {
            width: 25px;
            height: 25px;
            float: left;
            margin-top: 5px;
        }
        
        .login-area {
            margin-left: 90px; /* 테이블 간격 늘리기 */
        }
        
        hr{
          width: 1000px;
        }
  </style>
</head>
	<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	    <div class="mb_outer">
	        <div class="mb_menu-area">
	            <div id="mb_logo">
	                <img src="resources/images/logo.png" alt="로고">
	            </div> 
	            <div id="mb_nav">
	                <ul id="mb_navi">
	                    <li><a href="#">홈</a></li>
	                    <li><a href="#">사진게시판</a></li>
	                    <li><a href="#">장비추천</a></li>
	                    <li><a href="festvalList.fs">축제 · 전시</a></li>
	                    <li><a href="list.pl">출사명소</a></li>
	                    <li><a href="list.to">모임</a></li>
	                    <li><a href="list.no">공지사항</a></li>
	                    <li><a href="test.t">테스트</a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="mb_search-area">
	            <div id="mb_search">
	                <form action="#" id="search_form">
	                    <div id="search_text">
	                        <input type="text" name="keyword" id="sh_text" placeholder="     검색어를 입력해주세요">
	                        <input type="image" id="search" src="https://cdn-icons-png.flaticon.com/128/2801/2801881.png">
	                    </div>
	                    
	                </form>
	            </div>
	        </div>
	        <div class="mb_login-area">
	                <div id="mb_user_1">
	                    <table class="login-area" align="center">
	                        <tr height="75">
	                            <td width="70"><img width="60" src="resources/images/shopping-cart.png" alt=""></td>
	                            <td width="70"><img width="60" height="60" src="https://cdn-icons-png.flaticon.com/512/848/848006.png" alt=""></td>
	                        </tr>
	                    </table>
	                </div>
	        </div>
	    </div>
	</body>
</html>