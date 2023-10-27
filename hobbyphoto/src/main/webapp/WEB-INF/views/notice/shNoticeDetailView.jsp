<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }
    .wrap{
        width: 800px;
        margin: auto;
        font-family: 'NanumBarunGothic';
    }
    #header, #bar {
        border: none;
        border-bottom: 2px solid lightgray;
        padding: 10px;
        padding-bottom: 7px;
        margin-top: 20px;
    }
    
    #header>*{margin: 15px;}
    #h_etc{margin-bottom: 2px;}
    #subject{font-size: 20px;}
    #title{font-size: 40px;}
    #writer{font-size: 20px;}
    #h_etc{font-style: 10px; color: gray;}

    #content{
        padding: 15px;
        padding-top: 30px;
        font-size: 20px;
        line-height: 35px;
        margin-bottom: 100px;
    }

    #h_etc>span, #bar>span, #cmt_etc>span{margin-right: 10px;}
    #comment{
        padding: 20px;
      
    }
    
    #comment-area1{
        border: none;
        background-color: rgb(244, 244, 244);
        padding: 10px;
        margin-top: 10px;
    }
    #comment-area1>*{margin: 5px;}
    #cmt_id{font-size: 15px; font-weight: bold;}
    #cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
    #cmt_etc{font-size: 12px; color: gray;}
    #comment-area2{
        border: 1px solid gray;
        border-radius: 5px;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 30px;
    }
    #cmt_btn{
        padding-right: 10px;
    }
    #cmt_btn>button{
        border: none;
        width: 60px;
        height: 30px;
        font-family: 'NanumBarunGothic';
    }

</style>
</head>
<body>

    <div class="outer">
        <div class="wrap">
            <div id="header">
                <div id="subject">[ 공지 ]</div>
                <div id="title">${ n.noticeTitle }</div>
                <div id="writer">${ n.noticeWriter }</div>
                <div id="h_etc">
                    <span>${ n.createDate }</span>
                    <span>조회수 ${ n.count }</span>
                </div>
            </div>
            <div id="content">
			${ n.noticeContent }
            </div>
            
    <div align="center">
        <a href="list.no" class="btn btn-sm btn-secondary" style="width: 90px; height: 35px; font-size: medium;">목록가기</a>
        <a href="shUpdateForm.no?num=${ n.noticeNo }" class="btn btn-sm btn-warning" style="width: 90px; height: 35px; font-size: medium;">수정하기</a>
        <a href="shDelete.no?num=${ n.noticeNo }"W class="btn btn-sm btn-danger" style="width: 90px; height: 35px; font-size: medium;">삭제하기</a>
    
    </div>
  </div>
 </div>
</body>
</html>