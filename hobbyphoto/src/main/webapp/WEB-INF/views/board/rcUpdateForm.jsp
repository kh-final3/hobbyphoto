<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
        width: 1370px;
        margin: auto;
    }

    .recommend{
        border-bottom: 1px solid lightgray;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }

    .rc-btn>button{margin-left: 10px;}
</style>
</head>
<jsp:include page="../common/header.jsp"/>
<body>
    <div class="content">
        <br><br>
        <div align="center">
        	<h2>장비 추천</h2>
            	<h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
        </div>
        <br>
        <div class="recommend">
            <form action="rcUpdate.bo"  enctype="multiPart/form-data"class="form-area" method="post">
               <input type="hidden" name="boardNo" value="${ b.boardNo }">
               <input type="hidden" id="boardWriter" value="${ loginMember.userNo }" name="boardWriter">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th width="100">해시태그</th>
                        <td colspan=""><input type="text" name="hashTag" value="${ b.hashTag }" style="width: 1200px;"></td>
                    </tr>
                    <tr>
                        <th width="100">제목</th>
                        <td colspan=""><input type="text" name="boardTitle" value="${ b.boardTitle }" style="width: 1200px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="boardContent" cols="145" rows="15" style="resize: none;">${ b.boardContent }</textarea></td>
                    </tr>
                </table>
                <input type="file" name="upfile">
                <input type="file" name="upfile">
        		<br>
			        <div class="rc-btn" align="right" style="width: 1300px; margin-bottom: 20px;">
			            <button type="submit" class="btn btn-dark">수정하기</button>
			            <button class="btn btn-dark">취소</button>
			        </div>
        	</form>
        </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>