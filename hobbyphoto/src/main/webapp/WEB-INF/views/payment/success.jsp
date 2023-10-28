<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제성공</title>

	<style>
        .bigarea{
            margin-top: 60px;
        }
    </style>

</head>
<body>

	<div class="bigarea" align="center">
        <h3>결제가 완료되었습다.</h3>
		
        <div class="innerOut">
            <h4>결제 정보</h4>
    
            <table border="1" >
            <c:choose>
            	<c:when test="${ empty o }">
         			
                <tr>
                    <td style="width: 200px; height: 40px;">최종결제금액</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ o.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문번호</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문명</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">상품명</td>
                    <td style="width: 200px; height: 40px;"><input type="" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문 고객 이름</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                </c:when>
               <c:otherwise>
               
               <c:forEach var="k" items="${ ord }">
               
               <tr>
                    <td style="width: 200px; height: 40px;">최종결제금액</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ k.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문번호</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문명</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">상품명</td>
                    <td style="width: 200px; height: 40px;"><input type="" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문 고객 이름</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value=""></td>
                </tr>
                </c:forEach>
                </c:otherwise>
               </c:choose>
            </table>
        </div>
        <br>
        <div>
            <button type="button" onclick="main()">메인</button>
            <button type="button" onclick="list()">구매목록</button>
        </div>
		
    </div>

	<script>
		function main(){
			location.href="pro.list";
		}
		
		function list(){
			location.href="pro.list";
		}
	</script>


</body>
</html>