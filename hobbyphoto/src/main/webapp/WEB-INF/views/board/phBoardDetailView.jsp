<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진게시판 상세</title>
    <style>
    	/* div {border: 1px solid black;} */
        /* 전체 */
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1400px;
            height: 1000px;
            margin: auto;
            background-color: rgba(44, 44, 44, 0.026);
            border-radius: 8px;
        }

        .inner{
            border: 1px solid white;
            width: 90%;
            height: 98%;
            margin: auto;
            background-color: white;
            border-radius: 15px;
        }

        /* 사진 */
        .img-area{
            /* border-right: 1px solid black; */
            width: 64%;
            height: 100%;
            float: left;
        }

        /* 글씨 */
        .text-area{
            border: 1px solid blue;
            width: 35%;
            height: 85%;
            margin-left: 65%;
            border: none;
        }

        /* 글씨 상위(작성자, 글 내용) */
        .head-area{
            border: 1px solid red;
            width: 100%;
            height: 35%;
            border: none;
        }
        /* 작성자 */
        .writer_name{
            border: 1px solid black;
            width: 85%;
            height: 30%;
            border: none;
            margin-top: 2px;
        }
        .writer_name2{
            margin-top: 25px;
            margin-left: 20px;
            width: 10%;
            height: 20%;
        }
        /* 글내용 */
        .content{
            border: 1px solid green;
            width: 400px;
            height: 70%;
            border: none;
            margin-left: 20px;
            margin-top: 30px;
        }
        /* 댓글 리스트 박스 */
        .content-area{
            /* border: 1px solid purple; */
            width: 100%;
            height: 50%;
        }
        /* 댓글 작성 박스 */
        .under-area{
            margin-top: 20px;
            border: 1px solid blueviolet;
            width: 100%;
            height: 10%;
            border: none;
        }

        /*이미지 슬라이드 css*/
        .box{
            width: 550px; 
            margin: 0 auto; /**중앙 정렬한다.**/
            margin-top: 80px;
            margin-right: 140px;
        }

        /**사진**/
        .slide{ /**이만큼의 크기로 보이겠다는 의미**/
            width:580px; height:750px;/**사진보다 크면 다음 사진까지 표시되어 img와 slide크기를 맞춘다.**/
            overflow: hidden;/**이미지는 내장이라 overflow:hidden을 사용해 넘친 사진들을 안보이게 한다.**/
        }
        .images{
            display: flex; /**좌우 슬라이드를 위해 flex로 사진을 가로정렬한다.**/
            height:750px; /**slide와 images의 높이가 다르면 부자연스럽게 표시돼 slide의 높이에 맞게 높이를 바꾼다.**/
            transition: transform 0.5s;
            /**어떤 속성에 대해 애니메이션 효과를 주는 속성이다. 
            tranform속성에 0.5초의 듀레이션(동작의 시작해서 끝나는 시간)을 준다.**/
        }
        .images img{
            width:580px; height:750px;/**slide 크기에 맞춘다.**/
            border-radius: 15px;
        }

        /**버튼위치**/
        .back{
            position:relative;
            bottom: 380px; right: 40px;
        }

        .next{
            position:relative;
            bottom: 380px; left: 550px;
        }

        /**버튼디자인**/
        button{
            width: 30px; height: 30px;
            color: white;
            background: #808080;
            border-radius: 3px;
        }
        .writer textarea {
            border: 1px solid rgba(171, 164, 159, 0.389);
        }

        button:active{/**버튼을 클릭하는 동안 색을 바꾼다.**/
            background: #808080;
        }

        button:disabled{/**버튼 속성이 disabled되면 색을 바꾼다.**/
            background: #cbcaca;
        }

        /*글정보*/
        .writer_name img{
            float: left;
            width:45px;
            height:45px;
            border-radius: 50%;
        }

        .writer_name p{
            font-size: medium;
            font-weight: 600;
            margin-top: 30px;
            margin-left: 10px;
            float: left;
        }

        /*댓글쓰기*/
        .under-area p{
            margin-top: 0px;
            margin-bottom: 3px;
        }

        .writer{
            border: 1px solid red;
            width: 100%;
            height: 50%;
            border: none;
        }

        .writer textarea{
            width: 82%;
            height: 100%;
            resize: none;
            float: left;
            margin-left: 4px;
        }

        .writer button{
            width: 14%;
            height: 40px;
            margin-left: 3px;
            /* margin-top: 10px; */
        }
        #detail-hr {
            border: 1px solid rgba(220, 220, 220, 0.340);
            margin-right: 10px;
            margin: auto;
            width: 420px
        }
        .profile{
            display: flex;
        }
        
       	.writer_name2 img {
            width: 20px;
            height: 20px;
        }
        .content button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
            font-size: 18px;
            color: black;
            width: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="warp">
        <div class="inner">
            <div class="img-area">
                <div class="box">
                    <!--div를 두개 감싼이유는 img들을 좌우배치하고 배치된 사진중 한장만 보이게 하기 위해서이다.-->
                    <div class="slide"> <!--배치된 img들을 하나의 img만 보이게 가리기 위한 태그-->
						<div class="images"> <!--img들을 좌우배치할 태그-->  
							 <c:forEach var="a" items="${ at }">    
							    <img src="${ a.filePath }">
							 </c:forEach>
                        </div>
                    </div>
                    <button class="back">❮</button>
                    <button class="next">❯</button>
                </div>

				<script>
                    let pages = ${at.size()};
                    let positionValue = 0;
                    const IMAGE_WIDTH = 580;
                    const backBtn = document.querySelector(".back");
                    const nextBtn = document.querySelector(".next");
                    const images = document.querySelector(".images");

                    function next() {
                        if (pages > 1) {
                            positionValue -= IMAGE_WIDTH;
                            images.style.transform = "translateX(" + positionValue + "px)";
                            pages -= 1;

                            backBtn.removeAttribute('disabled');
                        }

                        if (pages === 1) {
                            nextBtn.setAttribute('disabled', 'true');
                        }
                    }

                    function back() {
                        if (pages < ${at.size()}) {
                            positionValue += IMAGE_WIDTH;
                            images.style.transform = "translateX(" + positionValue + "px)";
                            pages += 1;

                            nextBtn.removeAttribute('disabled');
                        }

                        if (pages === ${at.size()}) {
                            backBtn.setAttribute('disabled', 'true');
                        }
                    }

                    function init() {
                        backBtn.setAttribute('disabled', 'true');
                        backBtn.addEventListener("click", back);
                        nextBtn.addEventListener("click", next);

                        if (pages <= 1) {
                            nextBtn.setAttribute('disabled', 'true');
                        }
                    }

                    init();
                </script>

				<c:if test="${ loginMember.userId eq b.boardWriter }">
		            <div align="center">
		             		<a class="btn btn-primary" href="phBoardList.bo">목록가기</a>
			                <a class="btn btn-warning" onclick="postFormSubmit(1);">수정하기</a> <!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
			                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
		            </div><br><br>
				</c:if>
            
            <form id="postForm" action="" method="post">
            	<input type="hidden" name="phno" value="${ b.boardNo }">
            	<input type="hidden" name="filePath" value="${ a.filePath }">
            </form>
            
            
            
			<script>
				function postFormSubmit(num) {
					if(num == 1){ // 수정하기 클릭시
						$("#postForm").attr("action", "phUpdateForm.bo").submit();
					} else{ // 삭제하기 클릭시
						$("#postForm").attr("action", "phDelete.bo").submit();
					}
				}
			</script> 
            
            </div>
            <div class="text-area">
                <div class="head-area">
                    <div class="profile">
                        <div class="writer_name">
                            <img src="${ b.profileImg }" width="45" style="margin-top:20px">
                            <p>${ b.boardWriter }</p>
                            
                            <c:forEach var="f" items="${ f }">
                            	<c:if test="${ loginMember.userId eq f.userId }">
                            		<c:set var="result" value="1"/>
                            	</c:if>
                            </c:forEach>
                            <c:choose>
                            	<c:when test="${ not empty loginMember and result ne 1 and loginMember.userId ne b.boardWriter}">
                            		<p style="color: blue; cursor: pointer;" onclick="toggleFollow();" id="follow">팔로우</p>
                            	</c:when>
                            	<c:when test="${ not empty loginMember and result eq 1 and loginMember.userId ne b.boardWriter}">
                            		<p style="color: red; cursor: pointer;" onclick="toggleFollow();" id="follow">팔로우취소</p>
                            	</c:when>
                            </c:choose>
                            
                        </div>
                        <div class="writer_name2">
                           <img src="resources/images/option.png">
                        </div>
                    </div>
                    <hr id="detail-hr">
                    <div class="content">
                        <br>
                        <div>
                            ${ b.boardContent }
                        </div>
                        <br>
                        <div>
                            작성일 : ${ b.createDate } | 
                            조회수 : ${ b.count }  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button id="like1" onclick="insertLike();">🤍</button>
							<button id="like2" style="display: none;" onclick="deleteLike();">❤️</button>
							<button id="report" type="button" data-toggle="modal" data-target="#reportBoard">🚨</button>	
                        </div>
                        <div class="modal" id="reportBoard">
                            <div class="modal-dialog">
                                <div class="modal-content">
                            
                                    <!-- Modal Header -->
                                    <div class= "modal-header">
                                    <h4 class="modal-title"><b>신고하기</b></h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                            
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                    <form action="reportBoard.bo" method="post">
                                        <p>작성자 : ${b.boardWriter} </p>
                                        <p>글 제목 : ${b.boardTitle} </p>
                                        
                                        <input name="refBno" type="hidden" value="${b.boardNo}">
                                        <input name="boardType" type="hidden" value="1">
                                        <input name="reportedUno" type="hidden" value="${b.boardWriter}">
                                        <input name="reportUno" type="hidden" value="${loginMember.userNo}">
                                        
                                        <hr>
                                        
                                            <input type="radio" id="r1" name="guilty" value="영리목적/홍보성">
                                            <label for="r1">영리목적/홍보성</label><br>
                                            <input type="radio" id="r2" name="guilty" value="욕설/인신공격">
                                            <label for="r2">욕설/인신공격</label> <br>
                                            <input type="radio" id="r3" name="guilty" value="도배">
                                            <label for="r3">같은 내용 반복(도배)</label> <br>
                                            <input type="radio" id="r4" name="guilty" value="개인정보노출">
                                            <label for="r4">개인정보노출</label> <br>
                                            <input type="radio" id="r5" name="guilty" value="불법정보">
                                            <label for="r5">불법정보</label><br>
                                            <input type="radio" id="r6" name="guilty" value="음란성/선정성">
                                            <label for="r6">음란성/선정성</label> <br>
                                
                                        <textarea name="rpContent" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요." cols="50" rows="3" style="margin: 20px;" required></textarea>
                                        <br><button type="submit" class="btn btn-secondary" id="rpt_btn" style="width: 100%; height: 40px; margin-top: 15px;">신고</button>
                                    </form>
                                    </div>
                        
                                </div>
                                
                            </div>
                        </div>
                            
                    </div>
                </div>
                <hr id="detail-hr">
                <br>
                <div class="content-area">
                    <div class="review-area" style="margin-left: 20px;">
                        <!-- 댓글 들어가는 자리 -->
                    </div>
                </div>
                <hr id="detail-hr">
                <div class="under-area">
                    <p>댓글(<span id="rcount">0</span>)</p>
                    <div class="writer">
                        <textarea name="" id="content" cols="30" rows="10"></textarea>
                        <button type="button" onclick="addReply();" class="btn btn-secondary btn-lg;">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    	$(function(){

    		selectPhReplyList();
    	})
    	
    	function addReply(){
    		if($("#content").val().trim().length != 0){
    			$.ajax({
    				url:"phRinsert.bo",
    				data:{
    					refBno:${b.boardNo},
    					replyContent:$("#content").val(),
    					replyWriter:'${ loginMember.userNo }'
    					
    				}, success:function(status){
                        console.log("성공")
    					if(status == "success"){
    						selectPhReplyList();
    						
    						if("${ loginMember.userId }" != "${ b.boardWriter }"){
    							if(socket){
    								let socketMsg = "reply,${ loginMember.userId },${ b.boardWriter },${b.boardNo},${b.boardTitle},1";
    								socket.send(socketMsg);
    							}
    			           	}
    			           		
    						$("#content").val("");
    					}
    				}, error:function(){
    					console.log("댓글 작성용 ajax 요청 실패!")
    				}
    			})
    		} else {
    			alertify.alert("댓글 작성 후 등록 요청해주세요!");
    		}
    		if("${ loginMember.userId }" != "${ b.boardWriter }"){
    			 $.ajax({
    			        url : "insertAlram",
    			        data : {sendId: "${ loginMember.userId }" , fromId: "${ b.boardWriter }" , bno:${ b.boardNo },title:"${ b.boardTitle }" , cmd: "reply", type:1 },
    			 });
    		}
    	}
    	
    	function selectPhReplyList(){
    		$.ajax({
    			url:"phRlist.bo",
    			data:{
    				boardNo:${ b.boardNo },
                    boardWriter:'${loginMember.userId}'
    			}, success:function(list){
                    console.log(list)
	    				let value = "";
	    				for(let i in list){
	    					value += "<tr>"
	    						  + "<th style='width:80px; margin-left:50px; font-size:16px;'>" + list[i].replyWriter + "</th>"
	    						  + "<td style='width:200px; margin-left:50px; font-size:15px'>" + list[i].replyContent + "</td>"
	    						  + "<td style='font-size:13px'>" + list[i].createDate + "</td>"
	    						  + "</tr>"
	    					}
    				
    				$(".review-area").html(value);
    				$("#rcount").text(list.length);

    			}, error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패!");
    			}
    		});
    	}
    </script>
    

    
    <script>
        if (${ loginMember.userNo } != null) {
            userNo = ${ loginMember.userNo };
            let bno = ${ b.boardNo };
            function insertLike(){
                $.ajax({
                    url:"like.bo",
                    data:{boardNo:bno, 
                          boardWriter:userNo,
						  boardType: 1
                        },
                    success:function(result){
                        
                        if(result == 'Y'){
                            $("#like1").css("display", "none");
                            $("#like2").css("display", "");
                        }
                        
                        if("${ loginMember.userId }" != "${ b.boardWriter }"){
							if(socket){
								let socketMsg = "like,${ loginMember.userId },${ b.boardWriter },${b.boardNo},${b.boardTitle},1";
								socket.send(socketMsg);
							}
			           	}
                    },
                    error:function(){
                        
                    }
                })
                
                if("${ loginMember.userId }" != "${ b.boardWriter }"){
          			 $.ajax({
          			        url : "insertAlram",
          			        data : {sendId: "${ loginMember.userId }" , fromId: "${ b.boardWriter }" , bno:${ b.boardNo },title:"${ b.boardTitle }" , cmd: "like", type:1 }
          			 });
          		}
            }
            
            function deleteLike(){
        
                $.ajax({
                    url:"deleteLike.bo",
                    data:{boardNo:bno, 
                        boardWriter:userNo,
                          boardType: 1
                        },
                    success:function(result){
                        
                        if(result == 'Y'){
                            $("#like2").css("display", "none");
                            $("#like1").css("display", "");
                        }
                    },
                    error:function(){
                        
                    }
                })
            }
            
            $(function(){
                
                $.ajax({
                    url:"likeCheck.bo",
                    data:{boardNo:bno, 
                          boardWriter:userNo,
						  boardType: 1
                        },
                    success:function(result){
                        ;
                        if(result == 'Y'){
                            $("#like2").css("display", "");
                            $("#like1").css("display", "none");
                        }else{
                            $("#like2").css("display", "none");
                            $("#like1").css("display", "");                    	
                        }
                    },
                    error:function(result){
                        ;
                    }
                })
            })
        }
        
        function toggleFollow(){
        	if($("#follow").text()==="팔로우"){
        		follow();
        	}else{
        		unfollow();
        	}
        }
        
        function follow(){
        	$.ajax({
        		url:"follow",
        		data:{
        			userId:'${loginMember.userId}',
        			followId:'${b.boardWriter}'
        		},success:function(result){

        			console.log(result);
        			if (result === 'success') {
                        $("#follow").text("팔로우취소").css("color", "red");
                    }
        		},error:function(){
        			console.log("팔로우 ajax 통신 실패");
        		}
        	});
        }
        
        function unfollow() {
            $.ajax({
                url: "unfollow",
                data: {
                    userId: '${loginMember.userId}',
                    followId: '${b.boardWriter}'
                },
                success: function (result) {
                    console.log(result);
                    if (result === 'success') {
                        $("#follow").text("팔로우").css("color", "blue");
                    }
                },
                error: function () {
                    console.log("언팔로우 ajax 통신 실패");
                }
            });
        }

        
    </script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>