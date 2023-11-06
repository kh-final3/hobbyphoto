<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>    
    <style>
        .innerOuter{width: 1300px; height: 600px; margin: auto;}
        .innerOuter>div{box-sizing: border-box; display: block; float: left;}
        .product-img{width: 500px; height: 500px; margin-right: 40px;}
        .product-info{width: 570px; height: 525px;}
        .product-name{width: 570px; height: 52px; font-size: 36px; word-break: break-all;}
        .product-price{width: 570px; height: 63px; margin-top: 24px; font-size: 29px; padding-top: 21px; word-break: break-all;}
        .product-select{width: 570px; height: 320px; margin-top: 24px; padding-top: 21px; border-top: 1px solid lightgray;}
        .tit{font-size: 16px; font-weight: bold;}
        .smoll-tit{font-size: 14px; color: gray;}
        #pd-selectbox{width: 570px; height: 50px; padding-left: 10px;}
        #count-box{width: 122px; height: 40px; border: 1px solid #ddd; display: block; float: right;}
        #count-box *{width: 40px; height: 100%; font-weight: 700; box-sizing: border-box; display: block; float: left; border: 0; background-color: white; text-align: center;}
        #count-box button{outline: 0;}
        .product-tprice{width: 570px; height: 50px; margin-top: 24px; padding-top: 21px; border-top: 2px solid black;}
        .result-price{float: right; padding-right: 10px;}
        .product-btn{width: 570px; height: 64px;}
        .pd-btn{width: 64px; height: 64px; padding: 0px 10px 0px 10px; background-color:white; font-size: 46px; border: 1px solid black; margin-right: 20px;}
        .pd-btn>img{margin-bottom: 20px;} 
        .final{width: 380px; height: 64px; position: relative; bottom: 12px; background-color: black; color: white; font-size: 25px;}
        .product-nav{border-top: 2px solid black; border-bottom: 1px solid lightgray;}
        ul>li{list-style-type: none;}
        .product-nav>ul{margin-bottom: 0px;}
        .product-nav>ul>li{ width: 300px; height: 70px; padding-top: 20px; display: inline-block; font-size: 20px; font-weight: bolder;}
    </style>
</head>
<body>

<div class="content">
        <br><br>
        
      <jsp:include page="../common/shopHeader.jsp"/>
        
    <form action="cart.pro"	>
        
        
        <input type="hidden" name="userNo" class="userNo" value="${ loginMember.userNo }">
        <input type="hidden" name="prono" value=${ p.PNo }>
        
        
        <div class="innerOuter">
            <br>
            
        
            <div class="product-img">
                <img src="" style="width: 500px; height: 290px; margin-top: 100px;">
            </div>
            <div class="product-info">
                <div class="product-name">
                    <strong>
                        상품명
                    </strong>
                </div>
                <div class="product-price">
                    <strong class="st-price"><fmt:formatNumber value="1000" pattern="#,###"/>가격</strong>
                    <strong>원</strong>
                </div>
                <div class="product-select">
                    <p class="tit">
                        제품선택
                    </p>
                    <div>
                        <div id="pd-selectbox">
                            <div id="count-box" align="center">
                                <button type="button" class="minus">-</button>
                                <input class="count" type="text" name="amount" value="1" align="center">
                                <button type="button" class="plus">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="product-tprice">
                        <p class="tit">
                            총 상품금액
                            <span class="smoll-tit">
                                (총
                                <span class="count">
                                    -
                                </span>
                                개)
                            </span>
                            <span class="result-price">
                                <span class="num">-</span>
                                원
                            </span>
                        </p>
                    </div>
                    <br><br>
                    <div class="product-btn" style="margin-left: 100px;">
                       <!-- <button type="submit" class="pd-btn" id="cartbtn-cart">
                            <img src="resources/images/cart.png" style="width: 40px; height: 40px;">
                        </button>  -->
                        
                        <button class="final" type="submit">
                            구매하기
                        </button>
                    </div>
                </div>
            </div>
 
        </div>
        
    </form>
    
    <script>
    
	    $(()=>{
	        $(".count").text($(".count").val())
	        $(".num").text($(".st-price").text())
	        $(".minus").click(()=>{
	            let count = Number($(".count").val());
	            let price =  Number($(".st-price").text().replace(/,/g,''));
	            let totalPrice = Number($(".num").text().replace(/,/g,'')); 
	
	            console.log(totalPrice)
	            
	            if($(".count").val() != 1){
	                $(".count").val(count-1)
	                $(".count").text($(".count").val())
	                totalPrice = totalPrice - price;
	                $(".num").text(totalPrice.toLocaleString('ko-KR'));
	            }
	        })
	
	        $(".plus").click(()=>{
	            let count = Number($(".count").val());
	            let price =  Number($(".st-price").text().replace(/,/g,''));
	            let totalPrice = price;
				
	            if($(".count").val() < ${ p.amount}){
	                $(".count").val(count+1)
	                $(".count").text($(".count").val())
	                totalPrice = price * $(".count").val();
	                $(".num").text(totalPrice.toLocaleString('ko-KR'));
	            }
	        })
	    })
    
    
    
    
    	$(document).ready(function(){
    		
    		//찜하기
    		//$("#wishbtn").click(function(event){
    		//	event.preventDefault();
    		//	$("form").attr("action", "add-to-wishlist").submit();
    		//});
    		
    		//로그인 체크
    		function checkLogin() {
		        if (${ empty loginMember}) { // 로그인하지 않은 경우
		            alert('회원만 사용할 수 있습니다. 로그인해주세요.');
		            return false;
		        }
		        return true;
		    }
    		
    		//장바구니
    		//$("#cartbtn-cart").click(function(event) {
    	    //    event.preventDefault();
    	        
    	     	// 로그인 여부 확인
    	    //    if (!checkLogin()) return; // 로그인하지 않은 경우 함수에서 빠져나옴
    	        
    	    //    $("form").attr("action", "cart.pro").submit();
    	        
    	   // });

    		
    	    // 구매하기 버튼
    	    $(".final").click(function(event) {
    	        event.preventDefault();
    	        
    	     	// 로그인 여부 확인
    	        if (!checkLogin()) return; // 로그인하지 않은 경우 함수에서 빠져나옴

    	        $("form").attr("action", "purchase").submit();
    	    });
    		
    	})
    
    </script>
        
        <div class="product-nav" align="center">
            <ul>
                <li class="nav-item" data-content="overview" style="border-bottom: 2px solid skyblue;">
                    <!-- <a id="jyoverview">제품 개요</a> -->
                    <input type="button" name="" id="overbtn" style="background-color: white; border: none;" value="제품개요">
                </li>
                <li class="nav-item" data-content="detail">
                    <!-- <a id="jydetail">제품 상세</a> -->
                    <input type="button" name="" id="detailbtn" style="background-color: white; border: none;" value="제품상세">
                </li>
                <li class="nav-item" data-content="refund">
                    <!-- <a id="jyrefund">배송/환불규정</a> -->
                    <input type="button" name="" id="refundbtn" style="background-color: white; border: none;" value="배송/환불규정">
                </li>
            </ul>
        </div>
        <br><br>

        <!-- -->
        <div style="width: 960px; margin: auto;" id="overview" class="jyImg" >
            <img src="${ p.PDimg }">
        </div>
		
        
        <div style="width: 960px; margin: auto; display: none;" id="detail" class="jyImg" >
            <img src="${ p.PSimg }">
        </div>
        
       <div style="display: none" id="refund" class="refund" >
        
        <div style="width: 960px; margin: auto;" class="refundpro">
            <h2 style="font-weight: bolder;">배송 / 환불 규정</h2>
            <br><br>
            <h3 style="font-weight: bolder;">교환 / 반품 안내 및 보증 조건과 절차</h3>
            <br>
            <table style="border-top: 2px solid black;">
                <tbody>
                    <tr>
                        <th width="270" style="padding: 10px 20px;">
                            교환 / 반품 기준
                        </th>
                        <td style="padding: 10px">
                            <ul>
                                <li>고객 변심으로 인한 교환/반품은 상품을 수령하신 날로부터 7일 이내에 신청 가능합니다.</li>
                                <li>반품 시 제공된 사은품은 모두 회수하며 회수가 되지 않을 경우 교환/반품이 불가능합니다.</li>
                                <li>교환/환불 시 제품 특성에 따라 처리 소요시간이 상이할 수 있습니다.</li>
                                <li>교환은 동일한 상품만 가능하며, 다른 상품으로 교환을 원하실 경우 해당 상품을 주문취소 후 재주문하여 주시기 바랍니다.</li>
                                <li>(색상변경 포함)</li>
                                <li>전자상거래 등에서의 소비자 보호에 관한 법률로 규정되어 있는 소비자 청약철회 가능 범위에 해당하는 경우 신청 가능합니다.</li>
                                <li>퀵배송 등으로 주문하신 상품과 설치상품의 교환/반품 접수는 고객지원센터(1588-0911)로 연락주시기 바랍니다.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            교환 / 반품 불가사유
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>포장을 개봉하여 사용하거나 또는 설치가 완료되어 상품들의 가치가 훼손된 경우</li>
                                <li>고객님의 단순변심으로 인한 교환/반품 요청이 상품을 수령한 날로부터 7일을 경과한 경우</li>
                                <li>고객님의 귀책사유로 상품 등의 가치가 파손되거나 훼손된 경우</li>
                                <li>배송된 상품이 하자없음을 확인한 후 설치가 완료된 상품의 경우</li>
                                <li>기타 ‘전자상거래 등에서의 소비자보호에 관한 법률’이 정하는 청약철회 제한 사유에 해당되는 경우</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            품질보증기준 및 AS 안내
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>품질보증기준 : 제품별 별도표기</li>
                                <li>A/S 관련 전화번호 : 고객지원센터 1588-0911</li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div style="width: 960px; margin: auto;">
            <br><br>
            <h3 style="font-weight: bolder;">배송안내</h3>
            <br>
            <table style="border-top: 2px solid black;">
                <tbody>
                    <tr>
                        <th width="270" style="padding: 10px 20px;">
                            배송방법
                        </th>
                        <td style="padding: 10px">
                            <ul>
                                <li>택배 배송 (설치상품일 경우, 업체에서 직접 방문하여 설치해드립니다.)</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            배송가능지역
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>전국</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            배송비
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>포장을 개봉하여 사용하거나 또는 설치가 완료되어 상품들의 가치가 훼손된 경우</li>
                                <li>고객님의 단순변심으로 인한 교환/반품 요청이 상품을 수령한 날로부터 7일을 경과한 경우</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            배송기일
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>결제일 다음날부터 3~5일 이내 (일요일, 공휴일, 정기휴무 제외) 발송됩니다.</li>
                                <li>예약판매 상품 등 일부 상품에 대해서는 상품 수급 또는 운송업체의 사정에 따라 배송이 지연될 수 있습니다.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <th width="270" style="padding: 10px 20px;">
                            교환 / 반품 기준
                        </th>
                        <td style="padding: 10px;">
                            <ul>
                                <li>품질보증기준 : 제품별 별도표기</li>
                                <li>A/S 관련 전화번호 : 고객지원센터 1588-0911</li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        
        <div style="width: 960px; margin: auto;">
            <br><br>
            <h3 style="font-weight: bolder;">거래약관</h3>
            <br>
            <p>웹사이트 하단의 이용약관을 참조하세요.</p>
        </div>
        <br><br><br>
    </div>

 	 </div>

      <jsp:include page="../common/footer.jsp"/>
        
	<script>
		$(document).ready(function(){
			$("#detailbtn").click(function(){
				$("#overview,#refund").hide();
				$("#detail").show();
				$(".nav-item").css("border-bottom", "");
				$(this).closest(".nav-item").css("border-bottom", "2px solid skyblue");
			});
			
			$("#overbtn").click(function(){
				$("#detail").hide();
				$("#refund").hide();
				$("#overview").show();
				$(".nav-item").css("border-bottom", "");
				$(this).closest(".nav-item").css("border-bottom", "2px solid skyblue");
			});
			
			$("#refundbtn").click(function(){
				$("#detail").hide();
				$("#overview").hide();
				$("#refund").show();
				$(".nav-item").css("border-bottom", "");
				$(this).closest(".nav-item").css("border-bottom", "2px solid skyblue");
			});
			
		})
	</script>

</body>
</html>