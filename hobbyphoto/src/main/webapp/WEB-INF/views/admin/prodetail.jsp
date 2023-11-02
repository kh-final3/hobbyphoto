<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>상품 상세 페이지</title>

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

<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="container">
        <h2>상세 보기</h2>
    
            <label for="productName">상품명:</label>
            <input type="text" id="productName" name="pName" value="${ p.PName }" readonly>
				
			<br>
			
            <label for="productName">브랜드 명:</label>
			<select class="select-area" name="brandNo" required disabled>
			    <option value="" disabled ${p.brandNo == null ? 'selected' : ''}>브랜드를 선택하세요</option>
			    <option value="1" ${p.brandNo == 1 ? 'selected' : ''}>CANON</option>
			    <option value="2" ${p.brandNo == 2 ? 'selected' : ''}>NIKON</option>
			    <option value="3" ${p.brandNo == 3 ? 'selected' : ''}>OLYMPUS</option>
			    <option value="4" ${p.brandNo == 4 ? 'selected' : ''}>SONY</option>
			    <option value="5" ${p.brandNo == 5 ? 'selected' : ''}>FUJIFILM</option>
			</select>

            </select>
            
            <br>


            <label for="category">종류:</label>
            <select class="select-area" name="categoryNo" required disabled>
                <option value="" disabled ${p.categoryNo == null ? 'selected' : ''}>종류를 선택하세요</option>
                <option value="1" ${p.categoryNo == 1 ? 'selected' : ''}>DSLR</option>
                <option value="2" ${p.categoryNo == 2 ? 'selected' : ''}>SLR</option>
                <option value="3" ${p.categoryNo == 3 ? 'selected' : ''}>미러리스트</option>
                <option value="4" ${p.categoryNo == 4 ? 'selected' : ''}>임펙트</option>
            </select>

            <br>

            <label for="productPrice">가격:</label>
            <input type="number" id="productPrice" name="price" value="${ p.price }" readonly> <br>

            <label for="productamount">수량:</label>
            <input type="number" id="productamount" name="amount" value="${ p.amount }" readonly> <br>

            <label for="productImage">상품 이미지:</label> <br>
            <img src="${ p.thumbnail }" alt="" width="100"> <br>

            <label for="productDescription">상품 개요 :</label> <br>
            <img src="${ p.PDimg }" alt="pdimg Preview" width="100"> <br>
            
            <label for="productDescription">제품 상세 :</label> <br>
            <img src="${ p.PSimg }" alt="PSimg Preview" width="100"> <br>
            
            <button type="button" onclick="Prolistgo()">목록으로</button>
       
    </div>
    
    <script>
    	function Prolistgo(){
    		location.href="plist.pr";
    	}
    </script>
	
</body>
</html>

