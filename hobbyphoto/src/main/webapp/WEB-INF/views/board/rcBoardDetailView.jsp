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
    					if(status == "success"){
    						selectRcReplyList();
    					}
    				}, error:function(){
    					console.log("댓글 작성용 ajax 요청 실패!")
    				}
    			})
    		} else {
    			alert("댓글 작성 후 등록 요청해주세요!");
    		}
    	}
    	
    	function selectRcReplyList(){
    		$.ajax({
    			url:"rcRlist.bo",
    			data:{
    				phno:${ b.boardNo }
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
    				
    				$(".reply").html(value);
    				$("#rcount").text(list.length);

    			}, error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패!")
    			}
    		})
    	}
        if (${ loginMember.userNo } !== null) {
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
                    },
                    error:function(){
                        
                    }
                })
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