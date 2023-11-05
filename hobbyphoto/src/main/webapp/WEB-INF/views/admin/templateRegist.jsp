<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <title>템플릿 등록 페이지</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            margin-top: 30px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            /* height: 1000px; */
        }

        .container {
            width: 50%;
            height: 80%;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #555;
        }

        input,
        textarea {
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            height: 200px; 
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
        }

        button:hover {
            background-color: #45a049;
        }

        .select-area{
            height: 40px;
        }
    </style>

</head>
<body>

 <jsp:include page="adminAlert.jsp"/>

	<div class="container">
        <h2>템플릿 등록</h2>
        <form action="tem.pro" method="post" enctype="multipart/form-data">
            <label for="productName">상품명:</label>
            <input type="text" id="temName" name="temName" required>

            <label for="productPrice">가격:</label>
            <input type="number" id="price" name="price" required>

            <!-- <label for="productamount">수량:</label> -->
            <!-- <input type="number" id="productamount" name="amount" required> -->

            <label for="productImage">상품 이미지:</label>
            <input type="file" id="titleImg" name="upfile" required>

            <label for="productDescription">상품 개요 :</label>
            <input type="file" name="upfile" id="temImg" required>

            <!-- <label for="productDescription">제품 상세 :</label> -->
            <!-- <input type="file" name="upfile" id="psimg" required> -->
            
            <button type="submit">상품 등록</button>
        </form>
    </div>
	
</body>
</html>

