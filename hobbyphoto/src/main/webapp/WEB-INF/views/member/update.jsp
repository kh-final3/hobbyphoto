<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
        .outer_my{
        background-color: gainsboro;
        width: 1200px;
        height: 900px;
        margin: auto;
        margin-top: 50px;
        }

        /* 마이페이지 제목 */
        #h_my{
            font-weight: 600;
            
        }

        .info_my{
          background-color: white;
          width: 1180px;    
          height: 800px;
          margin: auto;
        }

        .info_my1{
          background-color: gainsboro;
          width: 300px;
          height: 500px;
          float: left;
          top: 30%;
          margin: 32px 20px;
        }

        .info_my2{
          padding-left : 16px;
          padding-top : 17px;
          border: 1px solid black;
          border-radius: 15px;
          width: 780px;
          float: right;
          margin: 32px 40px 10px 10px;
          height: 450px;
          
        }
        .info_my3{
          /* border: 1px solid red; */
          background-color: gainsboro;
          font-weight: 700;
          width: 780px;
          height: 390px;
          float: right;
          margin: 32px 40px 10px 10px;
          padding: 20px 0 10px 0;
        }

        /* 프로필 div안의 버튼 */
        #btnall_my{
            /* border: 1px solid red; */
            margin: 40px 74px;
        }

        #btn_my1{
            width: 150px;
            height: 35px;
        }

        #btn_my2{
            margin: 10px 0 0 0;
            width: 150px;
            height: 35px;
        }
        
        .my-update{
        	padding: 0 30px;
        }
        

        #list_my{
            background-color: white;
            margin: 5px;
            border-radius: 10px;
            height: 320px;
        }
        
        .info_my2 tr{
            font-size: larger;
            font-weight: 600;
        }

        .info_my2 td{
            font-size: 14px;
            padding: 0 0 5px 15px;
            font-weight: 500;
        }
		
		.myPage-update{
			margin-right: 20px;
		}

        .name_text{
            font-size: 24px;
            font-weight: 700;
            line-height: 29px;
            letter-spacing: -.63px;
            margin-bottom: 5px;
        }

        .id_text{
            font-size: 19px;
            font-weight: 400;
            line-height: 16px;
            letter-spacing: normal;
            color: rgba(123,137,148,.8);
        }

        .info_area{
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(123,137,148,.8);
        }

        .nickName_text,.gender_text,.description_text{
            display: inline-block;
            vertical-align: middle;
        }

        .text_update_btn{
            float: right;
            background-color: white;
            border: 1px solid black;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
        }
        
        .update_btn{
            background-color: black;
            border: 1px solid black;
            color: white;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
            margin-top: 2px;
        }

        .cancle_btn{
            background-color: white;
            border: 1px solid black;
            font-size: 14px;
            font-weight: 700;
            border-radius: 5px;
            margin-top: 2px;
        }

        #profile_2>img {
            width: 180px;
            height: 180px;
            border-radius: 100px;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 60px;
            margin-right: 60px;
        }
      
        #profile_2>#uplo {
            width: 40px;
        }

        #uplo {
            width: 30px;
            position: absolute;
            top: 190px;
            left: 205px;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer_my">
        <br><br>
        <h4 id="h_my" style="margin-left: 30px;"> 마이페이지</h4>

        <div class="info_my">
            <div class="info_my1">
                <div id="profile">
                    <div id="profile_2" style="position: relative">
                        <label for="image-upload" id="upload-label">
                            <img src="resources/images/plus.png" id="uplo">
                        </label>
                        <img src="${ loginMember.profileImg }" id="pro">
                        <input type="file" id="image-upload" accept="image/*" style="display: none;" name="upfile" onchange="updateProfileImage(this)">
                    </div>
                                
                </div>
                <h6 style="font-weight: 600; text-align: center;">반가워요!</h6>
                <h6 style="text-align: center;">${ loginMember.nickName }님</h6>
                <div id="btnall_my">
                    <button type="submit" class="btn btn-sm btn-primary" id="btn_my1" onclick="location.href='update.me'">수정하기</button><br>                    
                    <button type="submit" class="btn btn-sm btn-primary" id="btn_my2" onclick ="location.href='deleteForm.me'">회원탈퇴</button>
                </div>
            </div>
            <div class="info_my2">
                <br>
                <h style="font-weight: 700; margin: 0 0 5px 10px; font-size: larger;">회원정보</h><br><br>
                <div class="my-update">
                	<form>
	                    <table>
	                    	<tr>
                                <div class="info_area">
                                    <div class="name_text">
                                        ${ loginMember.userName }
                                    </div>
                                    <div class="id_text">
                                        ${ loginMember.userId }
                                    </div>
                                </div>
	                    	</tr>
                            <tr>
                                <td>이메일</td>
                                <td style="width: 600px;">${ loginMember.email }</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>${ loginMember.phone }</td>
                            </tr>
	                        <tr>
	                            <td>닉네임</td>
	                            <td class="nickName_td">
                                    <div class="nickName_text" >
                                        ${ loginMember.nickName }
                                    </div>
                                    <button class="text_update_btn" onclick="nickName_update()">변경</button>
                                </td>
	                        </tr>
	                        <tr>
	                            <td>한줄소개</td>
	                            <td class="description_td">
                                    <div class="description_text" >
                                        ${ loginMember.description }
                                    </div>
                                    <button class="text_update_btn" onclick="description_update()">변경</button>
                                </td>
	                        </tr>
                            <tr>
	                            <td>성별</td>
	                            <td class="gender_td">
                                    <div class="gender_text" >
                                    	<c:choose>
                                    		<c:when test="${ loginMember.gender eq 'M' }">
                                    			남성
                                    		</c:when>
                                    		<c:when test="${ loginMember.gender eq 'F' }">
                                    			여성
                                    		</c:when>
                                    		<c:otherwise>
                                    			없음
                                    		</c:otherwise>
                                    	</c:choose>
                                        
                                    </div>
                                    <button class="text_update_btn" onclick="gender_update()">변경</button>
                                </td>
	                        </tr>
	                    </table>
	                </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function nickName_update() {
            $(".nickName_td").html("<div><input type='text' id='change_nickName' placeholder='닉네임을 입력하세요'></div><button type='button' class='update_btn'>변경</button> <button class='cancle_btn'>취소</button>")
        }

        $(()=>{
        	$(document).on("click", ".nickName_td .update_btn", function(){
                $.ajax({
                	url:"updateNick.me",
                	data:{nickName:$("#change_nickName").val(),userNo:${loginMember.userNo}},
                	success:(data)=>{
                		if(data != ""){
                			$(".nickName_td").html("<div class='nickName_text'>"+ data +"</div><button class='text_update_btn' onclick='nickName_update()'>변경</button>")
                		}else{
	                		$(".nickName_td").html("<div class='nickName_text'>${ loginMember.nickName }</div><button class='text_update_btn' onclick='nickName_update()'>변경</button>")
                		}
                	},
                	error:()=>{
                		console.log("닉네임 변경 실패")
                	}
                })
             })
        })
        
        function description_update() {
            $(".description_td").html("<div><input type='text' id='change_description' placeholder='자기소개를 입력하세요'></div><button type='button' class='update_btn'>변경</button> <button class='cancle_btn'>취소</button>")
        }

        $(()=>{
        	$(document).on("click", ".description_td .update_btn", function(){
                $.ajax({
                	url:"updateDescription.me",
                	data:{description:$("#change_description").val(),userNo:${loginMember.userNo}},
                	success:(data)=>{
                		console.log(data)
                		if(data != ""){
                			$(".description_td").html("<div class='description_text'>"+ data +"</div><button class='text_update_btn' onclick='description_update()'>변경</button>")
                		}else{
	                		$(".description_td").html("<div class='description_text'>${ loginMember.description }</div><button class='text_update_btn' onclick='description_update()'>변경</button>")
                		}
                	},
                	error:()=>{
                		console.log("자기소개 변경 실패")
                	}
                })
             })
        })
        
        function gender_update() {
            $(".gender_td").html("<div><input type='text' id='change_gender' placeholder='남성 M/ 여성 F'></div><button type='button' class='update_btn'>변경</button> <button class='cancle_btn'>취소</button>")
        }

        $(()=>{
        	$(document).on("click", ".gender_td .update_btn", function(){
        		if($("#change_gender").val() == "M" || $("#change_gender").val() == "F"){
	                $.ajax({
	                	url:"updateGender.me",
	                	data:{gender:$("#change_gender").val(),userNo:${loginMember.userNo}},
	                	success:(data)=>{
	                		console.log(data)
	                		if(data != ""){
	                			if(data == "M"){
	                				$(".gender_td").html("<div class='gender_text'>남성</div><button class='text_update_btn' onclick='gender_update()'>변경</button>")
	                			}else{
	                				$(".gender_td").html("<div class='gender_text'>여성</div><button class='text_update_btn' onclick='gender_update()'>변경</button>")
	                			}
	                			
	                		}else{
		                		$(".gender_td").html("<div class='gender_text'>${ loginMember.gender }</div><button class='text_update_btn' onclick='gender_update()'>변경</button>")
	                		}
	                	},
	                	error:()=>{
	                		console.log("성별 변경 실패");
	                	}
	                })
        		}else{
                    alert("M 또는 F 로 입력해주세요");
                }
            })
        })

    </script>

<script>
    function updateProfileImage(input) {
    const selectedImage = input.files[0];

    if (selectedImage) {
        const reader = new FileReader();

        reader.onload = function(e) {
            const profileImage = document.getElementById("pro");
            profileImage.src = e.target.result;

            const formData = new FormData();
            formData.append("image", selectedImage);

            $.ajax({
                type: "POST",
                url: "updateImg.me",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("성공");
                },
                error: function() {
                    console.error("실패");
                }
            });
        };

        reader.readAsDataURL(selectedImage);
    }
}

</script>




    <jsp:include page="../common/footer.jsp"/>
</body>
</html>