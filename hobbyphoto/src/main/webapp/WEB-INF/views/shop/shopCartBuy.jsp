<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제페이지(상품 종류 한개)</title>
    <style>
        /*div {border: 1px solid red;}*/
        .payment_outer {
            /* width: 1400px; */
            justify-content: center; 
            align-items: center; 
        }

        .order_pay{
            width: 100%;
            height: 50px;
        }
        .order_pay img{
            width: 290px;
            height: 170px;
        }
        /* 여기 일단 늘리긴했는데.... */
        .information {
            width: 880px;
            height: 500px;
        }
        .information p {
            border-bottom: 2px solid rgb(95, 95, 95);
            width: 750px;
            height: 30px;
            margin-right: 50px;
        }
        .buyer_info {
            border: none;
            width: 800px;
        }

        .buyer_info tr{
            height: 50px;
        }

        .pd_table {
            border-spacing: 0px;
            width: 1200px;
            height: 150px;
        }
        #pd_thead tr{
            background-color: rgb(233, 233, 233);
        }

        .pd_table img{
            width: 80px;
            height: 80px;
        }
        .all_info{
            display: flex;
            justify-content: center;
            
        }
        #amount{
            border: 2px solid rgb(69, 69, 69);
            width: 300px;
            height: 430px;
        }
        .payment_outer input{
            border: none;
            border-bottom: 1px solid rgba(79, 45, 45, 0.453);
            width: 350px;
            height: 50px;
        }
        #sum {
            text-align: right;
            margin-top: 15px;
            margin-right: 10px;
            margin-bottom: 15px;
        }
        .addressbtn,.orbtn {
            width: 150px;
            height: 40px;
        }
        #sum2 {
            /* margin-top: 20px; */
            width: 300px;
            height: 125px;
            margin-left: 40px;
        }
        .hr2 {
            color: whitesmoke;
        }
        
        .pd_table,.buyer_info,#sum2 td{
            font-size: larger;
            font-weight: 500;
            /* text-align: center; */
        }

    </style>
</head>
<body>
<jsp:include page="../common/shopHeader.jsp"/>
<div class="payment_outer" align="center">
        <div class="order_pay">
            <!-- <img src="img/pay.png" alt="카메라 사진"> -->
            <h1>ORDER</h1>
        </div>
        <table class="pd_table" border="1">
            <thead id="pd_thead">
                <tr>
                    <th colspan="2">제품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>    
                </tr>
            </thead>
            <tbody> 
                <tr>
                    <td style="text-align: center;"><img src="${ list.thumbnail }" alt=""></td>
                    <td style="text-align: center;">${ list.PName }</td>
                    <td style="text-align: center;">${ list.price }</td>
                    <td style="text-align: center;">${ amount }</td>
                    <td style="text-align: center;">${ list.price * amount }</td>
                </tr>

            </tbody>    
        </table>

        <br>
        
        <div class="all_info">
            <div class="information">
                <p align="left">주문자 정보</p>
                <table class="buyer_info">
                    <tr>
                        <td style="width: 120px;">이름</td>
                        <td><input type="text" placeholder="이름을 입력하세요" value="${ loginMember.userName }"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" value="${loginMember.email }"></td>
                    </tr>
                    <tr>
                        <td>휴대폰 번호</td>
                        <td><input type="text" value="${ loginMember.phone }"></td>
                    </tr>
                </table>
                <br><br>
                <p align="left">배송지 정보</p>
                <table class="buyer_info" style="line-height: 30px;">
                    <tr>
                        <td style="width: 120px;">수령인 이름</td>
                        <td><input type="text" placeholder="이름을 입력하세요"></td>
                        <td></td>
                    </tr>
                    <!-- <tr>
                        <td colspan="2"><input type="checkbox" name="same" id="same" style="width: 20px; margin-left: 120px;">주문자 정보와 동일</td>
                    </tr> -->
                    <tr>
                        <td>휴대폰 번호</td>
                        <td><input type="text"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="text" id="sample6_address" placeholder="주소"></td>
                        <td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
                    </tr>
                    <tr>
                    	<td></td>
                    	<td><input type="text" id="sample6_detailAddress" placeholder="상세주소"></td>
                    	<td></td>                    	
                    </tr>
             
                </table>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                //document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            //document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
				</script>
                
            </div>
            <div class="amount_outer">
                <div id="amount">
                    <div id="sum">
                        결제예정 금액
                        <p style="color: steelblue; font-size: 26px; margin-top: 10px;">${list.price * amount + (list.price * amount >= 50000 ? 0 : 3000)} 원</p>
                    </div>
                    <hr class="hr2">
                    <table id="sum2" >
                        <tr>
                            <td>주문금액</td>
                            <td>${ list.price * amount } 원</td>
                        </tr>
                        
                        <tr>
                            <td>배송비</td>
                            <td>${ list.price * amount  >= 50000 ? "0원" : "3000원" }</td>
                        </tr>
                    </table>
                    <br><br>
                    <div>
                        [필수] 주문할 제품의 거래조건을 <br>
                        하였으며, 구매에 동의하시겠습니까? <br>
                        (전자상거래법 제8조 2항)<br><br>
                        <button class="orbtn">결제</button>
                    </div>
                </div>
               <pre>결제가 팝업창에서 이루어집니다 <br> 브라우저 설정에서 팝업창 차단을 해제해주세요</pre>
            </div>
        </div>
    </div>   
<jsp:include page="../common/footer.jsp"/>
</body>
</html>