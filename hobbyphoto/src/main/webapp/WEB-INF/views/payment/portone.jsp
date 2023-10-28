<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- PortOne SDK -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

    <script>
      
    function requestPay() {
    	  IMP.init('imp25583820'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
    	  IMP.request_pay({
    	    pg: "inicis",
    	    pay_method: "card",
    	    merchant_uid : 'merchant_'+new Date().getTime(),
    	    name : '결제테스트',
    	    amount : 10,
    	    buyer_email : 'iamport@siot.do',
    	    buyer_name : '구매자',
    	    buyer_tel : '010-1234-5678',
    	    buyer_addr : '서울특별시 강남구 삼성동',
    	    buyer_postcode : '123-456'
    	  }, function (rsp) { // callback
    	      if (rsp.success) {
    	        console.log("성공")
    	      } else {
    	    	  console.log("실패")
    	      }
    	  });
    	}
    </script>
</head>
<body>
 <button onclick="requestPay()">결제하기</button>
    <!-- 결제하기 버튼 생성 -->
    
</body>
</html>