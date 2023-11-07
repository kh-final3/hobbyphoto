<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비추천 상세</title>
<style>
    .replyArea{border: 1px solid lightgray; padding: 0px; border-top: none;}
    .reply{padding: 0px; margin:auto;}
    .reply-info{float: left; padding-top: 4px; width: 1000px; font-size: 18px; margin-left: 160px;}
    .reply-title{height: 55px; padding: 10px 30px; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;}
    .reply-content{padding: 30px; margin-left: 160px;}
    .ir-title{height: 55px; padding: 10px 30px; font-weight: bolder;}
    .ir-content{padding: 10px 30px;}
    .ir-btn{margin-left: 10px; width: 100px; height: 75px; position: relative; bottom: 33px;}

    .insertReply{border: 1px solid lightgray; padding: 0px;}

	.like>button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
            font-size: 15px;
	}
	.like{margin-left:880px;}
    .images img{width: 600px; height: 300px;}
    .title{font-weight: bold;}
    .writer{font-size: 13px;}
    hr{color: gainsboro;}
    .ir-title{margin-top:10px;}
    .ir-content, .ir-title{margin-left:500px;}
</style>

</head>
	<jsp:include page="../common/header.jsp"/>
	<body>
	    <div class="content">
			        <div class="wrap"><br><br>
			      <div class="main" align="center">
			        <div class="title" align="center">
			          ${ b.boardTitle }
			        </div>
			        <pre>${ b.createDate }</pre>
			        	<div class="writer">${ b.boardWriter }</div><br>
			        <hr style="width: 20px;">
			        <br>
				        <div class="content">
				        	${ b.boardContent }
				        </div><br>
				        <div class="hashTag">
				        	#${ b.hashTag }
				        </div><br>
			      </div>
				      <div class="images" align="center">
				         <c:forEach var="a" items="${ at }">    
						 	<img src="${ a.filePath }" style="width: 700px;">
						 	<br><br>
						 </c:forEach>
			      </div> <br>
				      <div class="like">
							<button id="like1" onclick="insertLike();">좋아요 🤍</button>
							<button id="like2" style="display: none;" onclick="deleteLike();">좋아요 🧡 </button>
							<button type="button" data-toggle="modal" data-target="#reportBoard">신고 🚨 </button>	
					 </div>		
			    </div>
	        </div>
	        <br>
	        <c:if test="${ loginMember.userId ne b.boardWriter }">
	        	<button class="btn btn-sm btn-secondary" style="margin-bottom: 10px; margin-left:915px;" onclick="goBack();">목록가기</button>
	        </c:if>
				<c:if test="${ loginMember.userId eq b.boardWriter }">
		            <div align="center">
		            		<a class="btn btn-primary btn-m" onclick="postFormSubmit(3);">목록가기</a>
			                <a class="btn btn-warning btn-m" onclick="postFormSubmit(1);">수정하기</a> <!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
			                <a class="btn btn-danger btn-m" onclick="postFormSubmit(2);">삭제하기</a>
		            </div><br><br>
				</c:if>
	        
            <form id="postForm" action="" method="post">
            	<input type="hidden" name="phno" value="${ b.boardNo }">
            	<c:forEach var="a" items="${ at }">    
            		<input type="hidden" name="filePath" value="${ a.filePath }">
				</c:forEach>
            </form>
            
			<script>
				function goBack(){
					location.href="rcBoardList.bo";
				}
				function postFormSubmit(num) {
					if(num == 1){ // 수정하기 클릭시
						$("#postForm").attr("action", "rcUpdateForm.bo").submit();
					} else if(num == 2){ // 삭제하기 클릭시
						$("#postForm").attr("action", "rcDelete.bo").submit();
					} else if(num == 3){
						$("#postForm").attr("action", "rcBoardList.bo").submit();
					}
				}
			</script> 
	            <ul class="replyArea">
	                <ul class="reply">
	                    <!-- 댓글 들어가는 자리 -->
	                </ul>
	            </ul>
	            <br>
	            <div class="insertReply">
                    <div class="ir-title">댓글달기</div>
                    <div class="ir-content">
                            <textarea name="" id="content" cols="90" rows="3" style="resize: none;"></textarea>
                            <button class="ir-btn btn-dark" onclick="addReply();">작성</button>
                    </div>
	            </div>
	        <br><br>
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
						<input name="boardType" type="hidden" value="2">
						<input name="reportedUno" type="hidden" value="${b.boardWriter}">
						<input name="reportUno" type="hidden" value="${loginMember.userNo}">
						
						<hr>
						
							<input type="radio" id="r1" name="GUILTY" value="영리목적/홍보성">
							<label for="r1">영리목적/홍보성</label><br>
							<input type="radio" id="r2" name="GUILTY" value="욕설/인신공격">
							<label for="r2">욕설/인신공격</label> <br>
							<input type="radio" id="r3" name="GUILTY" value="도배">
							<label for="r3">같은 내용 반복(도배)</label> <br>
							<input type="radio" id="r4" name="GUILTY" value="개인정보노출">
							<label for="r4">개인정보노출</label> <br>
							<input type="radio" id="r5" name="GUILTY" value="불법정보">
							<label for="r5">불법정보</label><br>
							<input type="radio" id="r6" name="GUILTY" value="음란성/선정성">
							<label for="r6">음란성/선정성</label> <br>
				
						<textarea name="rpContent" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요." cols="50" rows="3" style="margin: 20px;"></textarea>
						<br><button type="submit" class="btn btn-secondary" id="rpt_btn" style="width: 100%; height: 40px; margin-top: 15px;">신고</button>
					</form>
					</div>
		
				</div>
				
			</div>
		</div>

	</body>
	    <script>
    	$(function(){
    		selectRcReplyList();
    	})
    	
    	function addReply(){
    		if($("#content").val().trim().length != 0){
    			
    			$.ajax({
    				url:"rcRinsert.bo",
    				data:{
    					refBno:${ b.boardNo },
    					replyContent:$("#content").val(),
    					replyWriter:'${ loginMember.userNo }'
    					
    				}, success:function(status){
						console.log("성공")
    					if(status == "success"){
    						selectRcReplyList();
    					}
    					
    					if("${ loginMember.userId }" != "${ b.boardWriter }"){
							if(socket){
								let socketMsg = "reply,${ loginMember.userId },${ b.boardWriter },${b.boardNo},${b.boardTitle},2";
								socket.send(socketMsg);
							}
			           	}
    					
    					$("#content").val("");
    					
    				}, error:function(){
    					console.log("댓글 작성용 ajax 요청 실패!")
    				}
    			})
    		} else {
    			alert("댓글 작성 후 등록 요청해주세요!");
    		}
    		
    		if("${ loginMember.userId }" != "${ b.boardWriter }"){
    			 $.ajax({
    			        url : "insertAlram",
    			        data : {sendId: "${ loginMember.userId }" , fromId: "${ b.boardWriter }" , bno:${ b.boardNo },title:"${ b.boardTitle }" , cmd: "reply", type:2 }
    			 });
    		}
    	}
    	
    	function selectRcReplyList(){
    		$.ajax({
    			url:"rcRlist.bo",
    			data:{
    				boardNo:${ b.boardNo },
					boardWriter:'${ loginMember.userId }'
    			}, success:function(list){
    				console.log(list);
    				
	    				let value = "";
	    				for(let i in list){
	    					value += "<ul class='reply'>"
		    						   + "<div class='reply-title'>"
			                        	   + "<div class='reply-info'>"
					                           + "<span style='margin-right: 10px;'>" + list[i].replyWriter + "</span>"
					                           + "<span>" + list[i].createDate + "</span>"
			                        	   + "</div>"
					                       + "<div>"
					                       	   + "<button class='btn btn-dark btn-sm'>삭제</button>"
					                       + "</div>"
		                    		   + "</div>"
	                    		   + "<div class='reply-content'>" + list[i].replyContent + "</div>"
	                    		   + "</ul>"
	    					}
    				console.log(value)
    				$(".reply").html(value);
    				$("#rcount").text(list.length);

    			}, error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패!")
    			}
    		})
    		
    		
    	}
        if (${ loginMember.userNo } != null) {
            let userNo = ${ loginMember.userNo };
            let bno = ${ b.boardNo };
            function insertLike(){
                $.ajax({
                    url:"like.bo",
                    data:{boardNo:bno, 
						boardWriter:userNo,
						  boardType: 2
                        },
                    success:function(result){
                        
                        if(result == 'Y'){
                            $("#like1").css("display", "none");
                            $("#like2").css("display", "");
                        }
                        
                        if("${ loginMember.userId }" != "${ b.boardWriter }"){
							if(socket){
								let socketMsg = "like,${ loginMember.userId },${ b.boardWriter },${b.boardNo},${b.boardTitle},2";
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
         			        data : {sendId: "${ loginMember.userId }" , fromId: "${ b.boardWriter }" , bno:${ b.boardNo },title:"${ b.boardTitle }" , cmd: "like", type:2 }
         			 });
         		}
            }
            
            function deleteLike(){
        
                $.ajax({
                    url:"deleteLike.bo",
                    data:{boardNo:bno, 
						boardWriter:userNo,
                          boardType: 2
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
						  boardType: 2
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
    </script>
	<jsp:include page="../common/footer.jsp"/>
</html>