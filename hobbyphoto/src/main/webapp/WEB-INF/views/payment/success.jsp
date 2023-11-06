<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제성공</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        th{ width: 200px; text-align: center; border-bottom: 1px solid rgba(192, 192, 192, 0.52);}
        tr td{
            width: 400px;
            height: 45px;
            border-bottom: 1px solid rgba(192, 192, 192, 0.52);;
        }
        table{border: none;}
        input{border: none;text-align: center; width: 100%;}
    </style>
<body>
<br><br><br><br><br>
    <div class="bigarea" align="center">
        <h3>결제가 완료되었습니다.</h3>
        <br>
		
        <div class="innerOut">
            <h4 style="margin-bottom: 20px;">결제 정보</h4>
    
            <table>
            <c:choose>
            	<c:when test="${ not empty o }">
         			
                <tr>
                    <th>최종결제금액</th>
                    <td><input type="text" value="${ o.totalPrice }원"></td>
                </tr>
                <tr>
                    <th>주문번호</th>
                    <td><input type="text" value="ORD<fmt:parseDate value="${ o.orderDate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${orderDate}" pattern="yyyyMMdd"/>-6400521${ o.userNo }"></td>
                </tr>
                <tr>
                    <th>주문일자</th>
                    <td><input type="text" value="${ o.orderDate }"></td>
                </tr>
                <tr>
                    <th>주문 고객 이름</th>
                    <td><input type="text" value="${ o.name }"></td>
                </tr>
                </c:when>
               <c:otherwise>
               
              
               
               <tr>
                    <th>최종결제금액</th>
                    <td><input type="text" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <th>주문번호</th>
                    <td><input type="text" value="ORD<fmt:parseDate value="${ ord.orderDate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${orderDate}" pattern="yyyyMMdd"/>-6400521${ ord.userNo }"></td>
                </tr>
                <tr>
                    <th>주문일자</th>
                    <td><input type="text" value="${ ord.orderDate }"></td>
                </tr>
                <tr>
                    <th>상품명</th>
                    <td><input type="" value="${ ord.totalPrice }"></td>
                </tr>
                <tr>
                    <th>주문 고객 이름</th>
                    <td><input type="text" value="${ ord.name }"></td>
                </tr>
                
                </c:otherwise>
               </c:choose>
            </table>
        </div>
        <br>
        <div>
            <button class="btn btn-secondary" type="button" onclick="main()">메인</button>
            <button class="btn btn-success" type="button" onclick="list()">구매목록</button>
        </div>
    </div>
    <script>
    function list(){
			location.href="pro.list";
			location.href="shop.order?userNo='${loginMember.userNo}'";
		}
    function main(){
    	location.href="pro.list";
    }
	</script>
</body>
</html>