<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>상품 등록 페이지</title>

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
    <div class="container">
        <h2>상품 등록</h2>
        <form action="#" method="post">
            <label for="productName">상품명:</label>
            <input type="text" id="productName" name="productName" required>

            <label for="productName">브랜드 명:</label>
            <select class="select-area">
                <option value="코닥">코닥</option>
                <option value="코닥">소닉</option>
                <option value="코닥">캐논</option>
            </select>

            <br>

            <label for="productPrice">가격:</label>
            <input type="number" id="productPrice" name="productPrice" required>

            <label for="productPrice">수량:</label>
            <input type="number" id="productPrice" name="productPrice" required>

            <label for="productDescription">상품 설명:</label>
            <textarea id="productDescription" name="productDescription" required style="resize: none;"></textarea>

            <label for="productImage">상품 이미지 URL:</label>
            <input type="text" id="productImage" name="productImage" required>

            <button type="submit">상품 등록</button>
        </form>
    </div>
</body>
</html>
