<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
	  div {
	    /* border: 1px solid black; *//
	  }
	  .sidebar{
	    width: 300px;
	    float: left;
	  }
	  .goj{
	    text-decoration: none;
	    color: black;
	    display: block;
	  }
	  .gradeOrder{
	    float: left;
	  }
	  .grade{
	    background-color: rgba(0, 0, 0, 0.238);
	    width: 1000px;
	    height: 150px;
	  }
	  .order{
	    width: 1000px;
	    height: 400px;
	  }
	  .orderBox{
	    width: 1000px;
	    height: 200px;
	    border: 1px solid gainsboro;
	    display: flex; 
	  }
	  .orderBox div {
	  	width: 300px;
	    flex: 1;
	    border: 1px solid gainsboro;
	    margin: 5px;
	    float:left;
	  }
	  #gradeInfo{
	    margin-left: 30px;
	  }
	  .sidebar a, p{
	    margin-left: 30px;
	  }
	  .goj{
	   font-size: 13px;
	  }
	  
	  .clearfix::after {
	    content: "";
	    display: table;
	    clear: both;
	
	  }
	</style>
	
</head>
<body>
<jsp:include page="../common/shopHeader.jsp"/>
	<div class="outer clearfix">
      <div class="content">
        <div class="sidebar">
          <div class="myInfo">
            <p style="font-size: 20px;">마이페이지</p>
            <p>${ loginMember.userName }</p>
            <!-- <p>좋아요 3개</p> -->
          </div>
          
          <br>
          
          <div class="shoppingInfo">
            <p>나의 쇼핑 정보</p>
            <a class="goj" href="#">주문 배송 조회</a> <br>
            <a class="goj" href="#">취소/교환/반품 상세</a><br>
            <a class="goj" href="#">상품 리뷰</a><br>
            <a class="goj" href="shop.mp?userNo=${ loginMember.userNo }">장바구니</a><br>
          </div>
          <div class="accountSetting">
            <p>계정 설정</p>
            <a class="goj" href="#">회원 정보 수정</a><br>
            <a class="goj" href="#">회원 등급</a><br>
            <a class="goj" href="#">쿠폰</a><br>
            <a class="goj" href="#">마일리지</a><br>
          </div>
        </div>
        <div class="gradeOrder">
          <div class="grade">
            <br>
            <div id="gradeInfo">
              <p>${ loginMember.userName }은 기본등급입니다.</p>
              <p>구매금액 0원 | 구매건수 1건</p>
            </div>
          </div>
          <hr>
          <div class="order">
            <p>나의 주문현황</p>
            <div class="orderBox">
              <div id="onetoone">
                <p>1:1문의</p>
                <hr>
                <p>답변대기</p>
                <p>답변완료</p>
              </div>
              <div>
                <p>상품문의</p>
                <hr>
                <p>답변대기</p>
                <p>답변완료</p>
              </div>
              <div>
                <p>상품후기</p>
                <hr>
                <p>적용가능 보기</p>
                <p>작성완료 보기</p>
              </div>
            </div>
          </div>
        </div>
      </div>
   </div>
   
   
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>