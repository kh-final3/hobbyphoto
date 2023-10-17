<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>관리자 대시보드</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .dashboard {
            width: 80%;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            margin-top: 0px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-right: 5px;
        }

        button:hover {
            background-color: #45a049;
        }
  
        input[type="checkbox"] {
            margin-right: 5px;
        }

        .button-container {
            display: flex;
        }
        table {
            margin-left: auto;
            margin-right: auto;
        }

        .btn-area button{
            background-color: rgba(0, 0, 0, 0.6);
        }

        .btn-area button:hover{
            background-color: lightgray;
        }

    </style>
</head>
<body>
    <div class="dashboard">
        <h2>게시물 관리</h2>

        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" name="" id=""></th>
                    <th>게시판 유형</th>
                    <th>분류</th>
                    <th>게시판 목록</th>
                    <th>게시물 관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                  <td><input type="checkbox" name="" id=""></td>
                  <td>커뮤니티</td>
                  <td>분류A</td>
                  <td>게시물 1</td>
                  <td class="button-container">
	                      <button onclick="postFormSubmit(#);">관리</button>
	                      <button onclick="postFormSubmit(2);">삭제</button>
	                      <button onclick="postFormSubmit(1);">수정</button>
                  </td>
                </tr>
            </tbody>
        </table>
		
            <form id="postForm" action="" method="post">
            		<input type="hidden" name="bno" value="${ b.boardNo }">
            		<input type="hidden" name="filePath" value="${ b.changeName }">
            </form>
            
            <script>
            	function postFormSubmit(num){
            		
            		if(num == 1){ // 수정하기 클릭시
            			$("#postForm").attr("action", "updateForm.bo").submit();
            		}else{ // 삭제하기 클릭시
            			$("#postForm").attr("action", "delete.bo").submit();
            		}
            	}
            </script>
		
        <div align="center" class="btn-area">
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
        </div>

    </div>
   
</body>
</html>
