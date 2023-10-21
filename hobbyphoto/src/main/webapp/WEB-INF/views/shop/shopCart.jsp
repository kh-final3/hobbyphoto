<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  
    <style>
        .cart_product{margin: auto; box-sizing: border-box; width: 1350px;}
        .cart_product div{box-sizing: border-box;}
        .product_info{width: 100%; border-bottom: 1px solid rgb(0, 0, 0);}
        .product_head{width: 100%; height: 75px; border-top: 4px solid black; display: table;}
        .product_head div{line-height: 24px; vertical-align: middle; font-size: 18px; font-weight: 700;}
        .ph_check{width: 60px; height: 100%; display: table-cell;}
        .ph_title{width: 720px; height: 100%; display: table-cell;}
        .ph_amount{width: 200px; height: 100%; display: table-cell;}
        .ph_price{width: 200px; height: 100%; display: table-cell;}
        .ph_charge{width: 200px; height: 100%; display: table-cell;}
        .product_check{width: 22px; height: 22px;}
        .allproduct_check{width: 22px; height: 22px;}
        .product_body{width: 100%; height: 170px; display: table;}
        .product_body .pb_check,.pb_title,.pb_amount,.pb_price,.pb_charge
        {line-height: 24px; vertical-align: middle; border-top: 1px solid rgb(228, 228, 228); padding: 30px 0;}
        .product_body a{text-decoration: none; color: black;}
        .product_body p{margin: 10px 0 0;}
        .pb_check{width: 60px; height: 100%; display: table-cell;}
        .pb_title{width: 720px; height: 100%; display: table-cell;}
        .pb_title>div{float: left;}
        .pb_amount{width: 200px; height: 100%; display: table-cell;}
        .pb_price{width: 200px; height: 100%; display: table-cell; font-size: 22px; font-weight: 700;}
        .pb_charge{width: 200px; height: 100%; display: table-cell;}
        .pb_img{width: 110px; height: 110px; margin-right: 25px;}
        .product_brand{font-size: 14px; font-weight: 600;}
        .product_title{font-size: 16px; font-weight: 600;}
        .prodcut_price{font-size: 13px;}
        #count-box{width: 122px; height: 40px; border: 1px solid #ddd; display: block;}
        #count-box button{font-size: 20px;}
        #count-box *{width: 40px; height: 100%; font-weight: 400; box-sizing: border-box; display: block; float: left; border: 0; background-color: white; text-align: center;}
        #count-box button{outline: 0;}
        .product_btn{width: 300px; height: 45px; margin-top: 30px;}
        .cart_btn{border: 1px solid rgb(160, 160, 160); margin-right: 10px; width: 130px; height: 40px; font-size: 15px; justify-content:center; background-color: white;}
        .cart_price{margin: 117px auto 137px; box-sizing: border-box; width: 1350px; position: relative;}
        .cart_price div{box-sizing: border-box;}
        .price_info{width: 100%; border-bottom: 1px solid rgb(0, 0, 0);}
        .price_head{width: 100%; height: 75px; border-top: 4px solid black; display: table;}
        .price_head div{line-height: 24px; vertical-align: middle; font-size: 18px; font-weight: 700;}
        .price_head_sprice{width: 500px; height: 100%; font-size: 18px; font-weight: 700; display: table-cell;}
        .price_head_tcharge{width: 400px; height: 100%; font-size: 18px; font-weight: 700; display: table-cell;}
        .price_head_tprice{width: 500px; height: 100%; font-size: 18px; font-weight: 700; display: table-cell;}
        .price_body{width: 100%; height: 150px; display: table;}
        .price_body_sprice{width: 500px; height: 100%; line-height: 24px; vertical-align: top; border-top: 1px solid rgb(228, 228, 228); padding: 55px 0 0; display: table-cell;}
        .price_body_tcharge{width: 400px; height: 100%; line-height: 24px; vertical-align: top; border-top: 1px solid rgb(228, 228, 228); padding: 55px 0 0; display: table-cell;}
        .price_body_tprice{width: 500px; height: 100%; line-height: 24px; vertical-align: top; border-top: 1px solid rgb(228, 228, 228); padding: 55px 0 0; display: table-cell;}
        .total_price{font-size: 16px;}
        .total_price strong{font-size: 22px;}
        .total_charge{font-size: 16px;}
        .total_charge strong{font-size: 22px;}
        .final_price{font-size: 16px;}
        .final_price Strong{font-size: 22px;}
        .total_amount{margin-top: 10px; font-size: 0.875rem; font-weight: 500;}
        .price_btn{width: 900px; height: 70px; margin: auto;}
        .continue_btn{width: 400px; height: 100%; border: 1px solid black; background-color: white; font-size: 26px; font-weight: 600; margin-left: 10px;}
        .buy_btn{width: 400px; height: 100%; border: 1px solid black; background-color: black; color: white; font-size: 26px; font-weight: 600;}
        .cart_plus{width: 40px; height: 40px; text-align: center; line-height: 34px; border-radius: 100px; background-color: black; color: white; font-size: 30px; position: absolute; left: 33%; top: 55%;}
        .cart_minus{width: 40px; height: 40px; text-align: center; line-height: 34px; border-radius: 100px; background-color: black; color: white; font-size: 30px; position: absolute; right: 33%; top: 55%;}
    </style>
</head>
<body>
	
	<jsp:include page="../common/shopHeader.jsp"/>

	<div class="outer">
        <br><br>
        <div class="cart_product">
            <div class="product_info" align="center">
                <div class="product_head">
                    <div class="ph_check">
                        <input class="allproduct_check" type="checkbox">
                    </div>
                    <div class="ph_title">
                        상품정보
                    </div>
                    <div class="ph_amount">
                        수량
                    </div>
                    <div class="ph_price">
                        주문금액
                    </div>
                    <div class="ph_charge">
                        배송비
                    </div>
                </div>
                
                
                
                <c:forEach var="c" items="${ list }">
                
                
                
                <div class="product_body" data-product-id="${c.PNo}" >
                    <div class="pb_check">
                        <input class="product_check" type="checkbox">
                    </div>
                    <div class="pb_title" align="left">
                        <div>
                            <a href="#">
                                <img src="${ c.thumbnail }" class="pb_img">
                            </a>
                        </div>
                        <div>
                            <p>
                                <span class="product_brand">${ c.brandName }</span>
                            </p>
                            <p>
                                <a href="#" class="product_title">${ c.PName }</a>
                            </p>
                            <p>
                                <span class="prodcut_price">${ c.price }</span>원
                            </p>
                        </div>
                    </div>
                    <div class="pb_amount">
                        <div id="count-box" class="totalallamount">
                            <button class="minus">-</button>
                            <input class="count" type="text" value="${ c.amount}" align="center">
                            <button class="plus">+</button>
                        </div>
                    </div>
                    <div class="pb_price">
                        <span>${c.price * c.amount}</span>원
                    </div>
               
                    <div class="pb_charge">
                       <span>${(c.price*c.amount) >=50000 ? "무료" : "3000원" }</span>
                    </div>
                </div>
                
                
                
                </c:forEach>

                
            </div>
            <div class="product_btn">
                <button class="cart_btn">선택상품 삭제</button>
                <button class="cart_btn">품절상품 삭제</button>
            </div>
        </div>

        <div class="cart_price">
            <div class="price_info" align="center">
                <div class="price_head">
                    <div class="price_head_sprice">
                        총 주문금액
                    </div>
                    <div class="price_head_tcharge">
                        총 배송비
                    </div>
                    <div class="price_head_tprice">
                        총 결제 금액
                    </div>
                </div>
                <div class="price_body">
                    <div class="price_body_sprice">
                        <span class="total_price"><strong></strong>원</span>
                        <br>
                        <span class="total_amount">총<span></span>개</span>
                    </div>
                    <div class="price_body_tcharge">
                        <span class="total_charge"><strong></strong>원</span>
                    </div>
                    <div class="price_body_tprice">
                        <span class="final_price"><strong></strong>원</span>
                    </div>
                </div>
            </div>
            <div class="cart_plus">+</div>
            <div class="cart_minus">=</div>
        </div>
        <div class="price_btn">
            <button class="continue_btn">CONTINUE SHOPPING</button>
            <button class="buy_btn">BUY NOW</button>
        </div>
    </div>

        <script>
        	$(document).ready(function(){
        		setTotalInfo();
        	});
        	
        	//체크 여부에 따른 total정보 변화
            $(".product_check").on("change",function(){
            	setTotalInfo($(".product_body"));
            });
        
            $(".allproduct_check").on("click",function(){
            	
            	//체크박스 체크 / 해제
            	if($(".allproduct_check").prop("checked")){
            		$(".product_check").prop("checked", true);
            	}else{
            		$(".product_check").prop("checked", false);
            	}
            	
            	//총 주문 정보 세팅(배송비, 총 가격,수량)
            	setTotalInfo($(".product_body"));
            	
            });
            
            
            function setTotalInfo(){
            
            
                let totalPrice = 0; //총가격
                let totalCount = 0; //총 수량
                let deliveryPrice = 0; //배송비
                let finalTotlaPrice = 0; // 최종 가격(총가격 + 배송비)

                $(".product_body").each(function(){
                	
                	if($(this).find(".product_check").is(":checked")===true){
                    //총가격
                    let price = $(this).find(".pb_price").text().replace(/,/g,'');
                    totalPrice += parseInt(price);
                    //수량
                    totalCount += parseInt($(this).find(".count").val());
                	}
                });
            
                //배송비
                if(totalPrice >= 50000 || totalPrice === 0){
                	deliveryPrice = 0;
                }else {
                	deliveryPrice = 3000;
                }
                

                finalTotlaPrice = totalPrice + deliveryPrice;

                //값 넣기
                //총가격
                $(".price_body_sprice .total_price strong").text(totalPrice.toLocaleString('ko-KR'));
                //총수량
                $(".price_body_sprice .total_amount span").text(totalCount);
                //배송비
                $(".price_body_tcharge .total_charge strong").text(deliveryPrice.toLocaleString('ko-KR'));
                //최종 가격(총가격 + 배송비)
                $(".price_body_tprice .final_price strong").text(finalTotlaPrice.toLocaleString('ko-KR'));
            }

            $(".pb_price span").each(function() {
                var price = parseInt($(this).text().replace(/,/g, ''));
                $(this).text(price.toLocaleString('ko-KR'));
            });

            $(".prodcut_price").each(function() {
                var prices = parseInt($(this).text().replace(/,/g, ''));
                $(this).text(prices.toLocaleString('ko-KR'));
            });
            
           	//+버튼 클릭
           	$(".plus").click(function(){
        	   var $input = $(this).siblings(".count");
        	   var count = parseInt($input.val());
        	   
        	   
        	   
        	   $input.val(count + 1); //수량 1증가
      
        	   //총 주문 정보 다시 계산
        	   setTotalInfo();
        	   
        		// AJAX로 수량 업데이트
        	    upDateAmount(this,$input.val());
           	});
        	   
            // "-" 버튼 클릭 이벤트
            $(".minus").click(function(){
                var $input = $(this).siblings(".count");
                var count = parseInt($input.val());

                if(count > 1) { // 수량이 1 이상일 때만 감소
                    $input.val(count - 1); // 수량 1 감소
                }

                // 총 주문 정보 다시 계산
                setTotalInfo();
                
                // AJAX로 수량 업데이트
                upDateAmount(this,$input.val());
            });
        	          
            
           function upDateAmount(buttonClicked,amount){ //수량 증가/감소용 ajax
        	   var $productBody = $(buttonClicked).closest('.product_body'); // "+" 또는 "-" 버튼을 누른 상품의 .product_body를 찾습니다.
        	   var pNo = $productBody.data('product-id');
        	   
                $.ajax({
                    url:"cupdate.amount",
                    data:{
                        pNo:pNo,
                        amount:amount,
                        userNo:'${loginMember.userNo}'
                    },success:function(result){
                    	console.log(result);
                    
                    	if (result === "success") {
                            // 해당 상품의 수량이 이미 업데이트되었습니다. 

                            // 각 상품의 가격 업데이트
                            //var $productBody = $(this).closest('.product_body');
                            var unitPrice = parseInt($productBody.find('.prodcut_price').text().replace(/,/g, '').replace('원', ''));
                            var newTotalPrice = unitPrice * amount;
                            $productBody.find('.pb_price span').text(newTotalPrice.toLocaleString('ko-KR'));

                            // 전체 주문 정보 다시 계산
                            //setTotalInfo();
                        } else {
                            console.log("Server reported an error while updating amount");
                        }
                    	
                    },error:function(){
                    	console.log("장바구니 수량 변경용 ajax통신 실패");
                    }
                })
            }
           
            
            
        </script>

    <br><br>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>