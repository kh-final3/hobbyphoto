<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        .outer_find{
            /* border: 1px solid red; */
            width: 1200px;
            margin: 10px auto;
        }

        .container_find{
            /* border: 1px solid red; */
            width: 600px;
            margin: 10px auto;
        }
       	
       	.mail{
       		margin-bottom: 10px;
       	}
       	
       	.userId{
       		font-size: 19px;
       		padding-left: 10px;
       		font-weight: 600
       	}
       	.newPwd{
       		width: 400px;
       		height: 40px;
       		margin-bottom: 10px;
       	}
    </style>
</head>
<body>
	<div class="outer_find">
		<div class="container_find">
			<div class="area_inputs wow fadeIn">
				<div>
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일주소로 비밀번호 찾기가 가능합니다.</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="이름을 입력해주세요">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="inputPhone_1">이메일</label>
						<div>
							<input type="email" class="form-control mail mailId" placeholder="이메일을 입력해주세요">
						</div>
						<button class="btn btn-primary btn-block" type="button" id="sendBtn" name="sendBtn" onclick="sendNumberId()">인증번호</button>
						<br>
					  	<div class="mail_number_Id" style="display: none;">
					    	<input class="form-control mail numberId" type="text"  placeholder="인증번호 입력">
					   		<button class="btn btn-primary btn-block" type="button" name="confirmBtn1" onclick="confirmNumberId()">이메일 인증</button>
					  	</div>
					</div>
					<br>
					<div class="form-group">
						<button id="searchBtn1" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block" data-toggle="modal" data-target="#idModal" disabled>확인</button>
						<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
						<br>
					    <input type="text" class="confirmId" style="display: none" value="">
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="아이디를 입력해주세요">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="inputEmail_2">이메일</label>
						<div>
							<input class="form-control mail mailPwd" type="email" class="form-control" placeholder="이메일을 입력해주세요">
						</div>
						<button class="btn btn-primary btn-block" type="button" id="sendBtn" name="sendBtn" onclick="sendNumberPwd()">인증번호</button>
						<br>
					  	<div class="mail_number_Pwd" style="display: none">
					    	<input type="text" class="form-control mail numberPwd" placeholder="인증번호 입력">
					   		<button type="button" class="btn btn-primary btn-block" name="confirmBtn2" onclick="confirmNumberPwd()">이메일 인증</button>
					  	</div>
					</div>
					<br>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwdSearch_click()" class="btn btn-primary btn-block" data-toggle="modal" data-target="#pwdModal">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					<br>
						<input type="text" class="confirmPwd" style="display: none" value="">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디찾기 Modal -->
	<div class="modal fade" id="idModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">아이디 찾기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body" id="idBody">
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
				<button id="resultBtn1" type="button" class="btn btn-secondary" data-dismiss="modal">비밀번호 찾기</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 Modal -->
	<div class="modal fade" id="pwdModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">비밀번호 변경</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      
	      <form id="submitPwd" action="updatePwd.me" method="post">
		      <input name="userId" type="hidden" id="hiddenId">
		      <div class="modal-body" id="pwdBody">
		      </div>
		      
		      <div class="modal-footer">
					<button id="resultBtn2" type="button" class="btn btn-secondary" data-dismiss="modal"></button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>

    <script>
        // radio 변경으로 찾는 정보 변경
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
			$("#search_2").attr("checked", true)
		}
	}
        
	function sendNumberId(){
		if($(".mailId").val() != ""){
	        $(".mail_number_Id").css("display","block");
	        $.ajax({
	            url:"mail",
	            type:"post",
	            data:{"mail" : $(".mailId").val()},
	            success: function(data){
	                alert("인증번호 발송");
	                $(".confirmId").val(data);
	            }
	        });
		}else{
			alert("이메일을 입력해주세요.");
		}
    }
	
	function sendNumberPwd(){
		if($(".mailPwd").val() != ""){
	        $(".mail_number_Pwd").css("display","block");
	        $.ajax({
	            url:"mail",
	            type:"post",
	            data:{"mail" : $(".mailPwd").val()},
	            success: function(data){
	                alert("인증번호 발송");
	                $(".confirmPwd").val(data);
	            }
	        });
		}else{
			alert("이메일을 입력해주세요.");
		}
    }

    function confirmNumberId(){
        var number1 = $(".numberId").val();
        var number2 = $(".confirmId").val();
        console.log(number1)
        console.log(number2)
        if(number1 == number2){
            alert("인증되었습니다.");
            $("#searchBtn1").attr("disabled",false);
            $("button[name=confirmBtn1]").attr("disabled",true);
        }else{
            alert("인증번호가 다릅니다.");
        }
    }  
    function confirmNumberPwd(){
        var number1 = $(".numberPwd").val();
        var number2 = $(".confirmPwd").val();
        console.log(number1)
        console.log(number2)
        if(number1 == number2){
            alert("인증되었습니다.");
            $("#searchBtn2").attr("disabled",false);
            $("button[name=confirmBtn2]").attr("disabled",true);
        }else{
            alert("인증번호가 다릅니다.");
        }
    }
    
    function idSearch_click() {
    	$.ajax({
    		url:"idSearch",
    		data:{userName:$("#inputName_1").val()},
    		success:(data)=>{
    			let value = "";
    			if(data != null ){
    				value = "<span>" + data.userName +"</span> <p class='userId'>" + data.userId +"</p>"
    				$("#resultBtn1").html("비밀번호 찾기");
    				$("#resultBtn1").attr("onclick","search_check(2)");
    			}else{
    				value = "검색결과가 없습니다.";
    				$("#resultBtn1").html("다시하기");
    				$("#resultBtn1").removeAttr("onclick");
    			}
    			$("#idBody").html(value)
    		},
    		error:()=>{
    			console.log("아이디 찾기 오류")
    		}
    	})
    }
    
    function pwdSearch_click() {
		$.ajax({
    		url:"pwdSearch",
    		data:{userId:$("#inputId").val()},
    		success:(data)=>{
    			let value = "";
    			userId = $("#inputId").val();
    			$("#hiddenId").val(userId);
    			if(data != null ){
    				value = "<input type='password' id='newPwd' class='newPwd' name='userPwd' placeholder='새로운 비밀번호를 입력해주세요' min='6' max='18' required> <br>"
    					  + "<input type='password' id='heckPwd' class='newPwd' placeholder='비밀번호를 다시 입력해주세요' min='6' max='18' required>";
    				$("#resultBtn2").html("비밀번호 변경");
    				$("#resultBtn2").attr("onclick","test()");
    			}else{
    				value = "입력한 정보와 일치하는 계정이 없습니다"
    				$("#resultBtn2").html("다시하기");
    			}
    			$("#pwdBody").html(value);
    		},
    		error:()=>{
    			console.log("아이디 찾기 오류")
    		}
    	})
    }
    
    function test() {
		$("#submitPwd").submit();
	}
    </script>

</body>
</html>