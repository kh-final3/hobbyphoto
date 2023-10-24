<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
    <div class="content">
        <br><br>
        <div align="center">
        	<h2>장비 추천</h2>
            	<h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
        </div>
        <br>
        <div class="recommend">
            <form action="rcInsert.bo" class="form-area" method="post">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th width="100">제목</th>
                        <td colspan=""><input type="text" name="boardTitle" style="width: 1200px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="boardContent" cols="180" rows="15" style="resize: none;"></textarea></td>
                        <input type="text" name="hashTag" style="width: 1200px;">
                    </tr>
                </table>
                <input type="file">
        		<br>
			        <div class="rc-btn" align="right" style="width: 1300px;" >
			            <button type="submit" class="btn btn-dark">작성</button>
			            <button class="btn btn-dark">취소</button>
			        </div>
        	</form>
        </div>
    </div>
</body>
</html>