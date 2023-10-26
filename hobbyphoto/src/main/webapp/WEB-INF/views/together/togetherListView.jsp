<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>모임</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        .outer{
            width: 1200px;
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            width: 1000px; 
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
            overflow: hidden;
            padding-bottom:150px;
        }
       
        .list>div{
            /* border: 1px solid black; */
            width: 33.3%;
            height: 250px;
            float: left;
            box-sizing: border-box;
            position: relative;
        }
        
        .together{
            /* border: 1px solid black; */
            width: 90%;
            height: 85%;
            position: absolute;
            top: 10;bottom: 0;left: 0;right: 0;
            margin: auto;
            background-color: rgb(231, 231, 231);
            border-radius: 10px;
        }

        .together>table{
            width: 100%;
            height: 100%;
            padding: 15px;
            padding-left: 25px;
            border-collapse: inherit;
        }
        tbody>tr{
            font-size: 15px;
            font-weight: bolder;
        }
        
        .together>.end{
            background-color: black;
            border-radius: 5px;
            color: white;
            width: 80px;
            height: 40px;
            line-height: 2.4;
            text-align: center;
            font-size: 18px;
            position: absolute;
            top: 155px;
            left: 200px;
        }
        #title {
            font-weight: bolder;
            letter-spacing: 5px;
            margin-top:100px;
            margin-bottom:60px;
        }
        
        #write-btn{
            width: 100px;
            height: 40px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="outer">
        <div class="wrap">
            <h1 align="center" id="title">소 모 임</h1>
           
            <div align="center"><button id="write-btn" class="btn btn-secondary">글 작성</button></div>
         
            <div class="list">
              
                <div>
                    <div class="together">
						<input type="hidden" class="todayNo" value="글번호">
                        <table>
                            <tbody>
                                <tr height="30" style="font-size: 18px; font-weight: bolder;">
                                    <td>제목</td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                </tr>
                                <tr>
                                    <td>📍 장소</td>
                                </tr>
                                <tr>
                                	<td>📅 날짜</td>
                                </tr>
                                <tr>
                                    <td>🕒 시간</td>
                                </tr>
                                <tr>
                                
                                    <td>🙋 5/10명</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="end">마감</div>
                      
                    </div>
                    
                </div>
                <div>
                    <div class="together">
						<input type="hidden" class="todayNo" value="글번호">
                        <table>
                            <tbody>
                                <tr height="30" style="font-size: 18px; font-weight: bolder;">
                                    <td>제목</td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                </tr>
                                <tr>
                                    <td>📍 장소</td>
                                </tr>
                                <tr>
                                	<td>📅 날짜</td>
                                </tr>
                                <tr>
                                    <td>🕒 시간</td>
                                </tr>
                                <tr>
                                
                                    <td>🙋 5/10명</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="end">마감</div>
                      
                    </div>
                    
                </div>
                <div>
                    <div class="together">
						<input type="hidden" class="todayNo" value="글번호">
                        <table>
                            <tbody>

                                <tr height="30" style="font-size: 18px; font-weight: bolder;">
                                    <td>제목</td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                </tr>
                                <tr>
                                    <td>📍 장소</td>
                                </tr>
                                <tr>
                                	<td>📅 날짜</td>
                                </tr>
                                <tr>
                                    <td>🕒 시간</td>
                                </tr>
                                <tr>
                                
                                    <td>🙋 5/10명</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="end">마감</div>
                      
                    </div>
                    
                </div>
                <div>
                    <div class="together">
						<input type="hidden" class="todayNo" value="글번호">
                        <table>
                            <tbody>
                                <tr height="30" style="font-size: 18px; font-weight: bolder;">
                                    <td>제목</td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                </tr>
                                <tr>
                                    <td>📍 장소</td>
                                </tr>
                                <tr>
                                	<td>📅 날짜</td>
                                </tr>
                                <tr>
                                    <td>🕒 시간</td>
                                </tr>
                                <tr>
                                
                                    <td>🙋 5/10명</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="end">마감</div>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="detail.to">모임</a>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>