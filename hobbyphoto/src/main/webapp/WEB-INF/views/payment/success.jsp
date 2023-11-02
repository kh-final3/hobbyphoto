<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제성공</title>
<!-- 
o:
orderNo=68, userNo=2, name=가나다라, address=서울특별시 송파구 올림픽로424, postcode=12345, 
phone=111, orderDate=2023-10-29 17:32:17, totalPrice=2, status=미결제, 
pType=null, oMsg=ㄱ나, dMsg=강, pNo=0, pName=null, price=0, amount=0, userName=null)}
 -->

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
            	<c:when test="${ not empty o }">
         			
                <tr>
                    <td style="width: 200px; height: 40px;">최종결제금액</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ o.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문번호</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="가나다${ o.userNo }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문일자</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ o.orderDate }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">상품명</td>
                    <td style="width: 200px; height: 40px;"><input type="" value=""></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문 고객 이름</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ o.name }"></td>
                </tr>
                </c:when>
               <c:otherwise>
               
              
               
               <tr>
                    <td style="width: 200px; height: 40px;">최종결제금액</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문번호</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문명</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">상품명</td>
                    <td style="width: 200px; height: 40px;"><input type="" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 40px;">주문 고객 이름</td>
                    <td style="width: 200px; height: 40px;"><input type="text" value="${ ord.totalPrice }"></td>
                </tr>
                
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