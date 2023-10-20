<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <input class="product_check" type="checkbox">
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
                <div class="product_body">
                    <div class="pb_check">
                        <input class="product_check" type="checkbox">
                    </div>
                    <div class="pb_title" align="left">
                        <div>
                            <a href="#">
                                <img src="" class="pb_img">
                            </a>
                        </div>
                        <div>
                            <p>
                                <span class="product_brand">브랜드</span>
                            </p>
                            <p>
                                <a href="#" class="product_title">상품명</a>
                            </p>
                            <p>
                                <span class="prodcut_price">186,000원</span>
                            </p>
                        </div>
                    </div>
                    <div class="pb_amount">
                        <div id="count-box">
                            <button class="minus">-</button>
                            <input class="count" type="text" value="1" align="center">
                            <button class="plus">+</button>
                        </div>
                    </div>
                    <div class="pb_price">
                        <span>186,000</span>원
                    </div>
                    <div class="pb_charge">
                        배송비
                    </div>
                </div>
                <div class="product_body">
                    <div class="pb_check">
                        <input class="product_check" type="checkbox">
                    </div>
                    <div class="pb_title" align="left">
                        <div>
                            <a href="#">
                                <img src="" class="pb_img">
                            </a>
                        </div>
                        <div>
                            <p>
                                <span class="product_brand">브랜드</span>
                            </p>
                            <p>
                                <a href="#" class="product_title">상품명</a>
                            </p>
                            <p>
                                <span class="prodcut_price">186,000원</span>
                            </p>
                        </div>
                    </div>
                    <div class="pb_amount">
                        <div id="count-box">
                            <button class="minus">-</button>
                            <input class="count" type="text" value="1" align="center">
                            <button class="plus">+</button>
                        </div>
                    </div>
                    <div class="pb_price">
                        <span>186,000</span>원
                    </div>
                    <div class="pb_charge">
                        배송비
                    </div>
                </div>  
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
                        <span class="total_price"><strong>186,000</strong>원</span>
                        <br>
                        <span class="total_amount">총<span>n</span>개</span>
                    </div>
                    <div class="price_body_tcharge">
                        <span class="total_charge"><strong>0</strong>원</span>
                    </div>
                    <div class="price_body_tprice">
                        <span class="final_price"><strong>186,000</strong>원</span>
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
    <br><br>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>