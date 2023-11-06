<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
        width: 1200px;
        margin: auto;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }
    .rc-btn>button{margin-left: 10px;}
    #content{margin-left:95px;}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div align="center">
        	<h2>장비 추천</h2>
            	<h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
        </div>
        <br>
        <div class="recommend">
            <form action="rcInsert.bo"  enctype="multiPart/form-data"class="form-area" method="post">
               <input type="hidden" id="boardWriter" value="${ loginMember.userNo }" name="boardWriter">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th width="100">제목</th>
                        <td colspan=""><input type="text" name="boardTitle" style="width: 1000px;" required></td>
                        <tr>
                            <th width="100">해시태그</th>
                            <td colspan=""><input type="text" name="hashTag" value="${ b.hashTag }" style="width: 1000px;" required></td>
                        </tr>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea id="content" name="boardContent" cols="120" rows="15" style="resize: none;" required></textarea></td>
                    </tr>
                </table>
                <div style="margin-left:200px";>
	                <input type="file" name="upfile">
	                <input type="file" name="upfile">
	                <input type="file" name="upfile">
	            </div>    
        		<br>
			        <div class="rc-btn" align="right" style="width: 1200px; margin-bottom: 20px;" >
			            <button type="submit" class="btn btn-dark">작성</button>
			            <button class="btn btn-dark">취소</button>
			        </div>
        	</form>
        </div>
    </div>
    <br><br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
