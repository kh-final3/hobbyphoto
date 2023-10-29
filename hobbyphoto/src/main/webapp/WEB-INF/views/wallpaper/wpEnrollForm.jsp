<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .content{
        width: 1370px;
        margin: auto;
    }

    .wallpaper{
        border-bottom: 1px solid lightgray;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }

    .wallpaper-file{
        width: 1370px;
        height: 550px;
        border: 5px double gray;
    }

    .rc-btn>button{margin-left: 10px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div align="center">
            <h2>배경 화면 공유</h2>
            <h6 style="color: gray;">예쁘고 다양한 배경화면 공유하기!</h6>
        </div>
        <br>
        <div class="wallpaper">
            <form action="">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th width="100">제목</th>
                        <td colspan=""><input name="title" type="text" style="width: 1200px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="wallpaper-file" align="center">
                                <h2 style="margin-top: 200px;">업로드 할 파일 놓기</h2>
                                <h5>또는</h5>
                                <button class="btn btn-dark" >파일선택</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <br>
        <div class="rc-btn" align="right" style="width: 1300px;" >
            <button class="btn btn-dark">작성</button>
            <button class="btn btn-dark">취소</button>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>