<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비추천 상세</title>
<style>
    .content{
        width: 1300px;
        margin: auto;
    }
    .recommend{
        border-bottom: 1px solid lightgray;
		width: 1280px;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }

    #contentArea th,td{
        padding-left: 20px;
    }

    .text{font-size: 14px; color: gray; margin-right: 70px;}

    #etc{padding-left: 20px;}

    .replyArea{border: 1px solid lightgray; padding: 0px; border-top: none;}
    .reply{padding: 0px;}
    .reply-info{float: left; padding-top: 4px; width: 1180px; font-size: 18px;}
    .reply-title{height: 55px; padding: 10px 30px; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;}
    .reply-content{padding: 30px;}

    .insertReply{border: 1px solid lightgray; padding: 0px;}
    .ir-title{height: 55px; padding: 10px 20px; font-weight: bolder; font-size: 17px;}
    .ir-content{padding: 10px 30px;}
    .ir-btn{margin-left: 10px; width: 100px; height: 75px; position: relative; bottom: 33px;}
	#etc>button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
            font-size: 14px;
        }
</style>
</head>
	<jsp:include page="../common/header.jsp"/>
	<body>
	    <div class="content">
	        <br><br>
	        <div align="center">
	            <h2>장비 추천</h2>
	            <h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
	        </div>
	        <br>
	        <div class="recommend">
	            <table id="contentArea" align="center" class="table">
	                <tr>
	                    <th width="100">제목</th>
	                    <td>${ b.boardTitle }</td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>${ b.boardWriter }</td>
	                </tr>
	                <tr>
	                    <td colspan="2" id="etc">
							<span>작성일</span> 
							<span class="text">${ b.createDate }</span> 
							<span>조회수</span><span class="text">${ b.count }</span>
							
							<button id="like1" onclick="insertLike();">좋아요 🤍</button>
							<button id="like2" style="display: none;" onclick="deleteLike();">좋아요 💚</button>
							<button type="button" data-toggle="modal" data-target="#reportBoard">신고</button>	
						</td>
	                </tr>
	                <tr>
	                    <td colspan="2">
							<p style="height:150px">${ b.boardContent }</p>
							<p style="height:30px;">
								<h style="font-weight: 700; background-color: rgb(240, 240, 240);">#</h>  ${ b.hashTag }
							</p>
						</td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td>
		                     <c:forEach var="a" items="${ at }">    
				                <img src="${ a.filePath }" style="width: 800px;">
				             </c:forEach>
	                    </td>
                	</tr>
	            </table>
	        </div>
	        <br>
	        <button class="btn btn-dark btn-sm">목록으로</button>
				<c:if test="${ loginMember.userId eq b.boardWriter }">
		            <div align="center">
		            		<a class="btn btn-primary btn-sm" href="rcBoardList.bo">목록으로</a>
			                <a class="btn btn-warning btn-sm" onclick="postFormSubmit(1);">수정하기</a> <!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
			                <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
		            </div><br><br>
				</c:if>
	        
            <form id="postForm" action="" method="post">
            	<input type="hidden" name="phno" value="${ b.boardNo }">
            	<c:forEach var="a" items="${ at }">    
            		<input type="hidden" name="filePath" value="${ a.filePath }">
				</c:forEach>
            </form>
            
			<script>
				function postFormSubmit(num) {
					if(num == 1){ // 수정하기 클릭시
						$("#postForm").attr("action", "rcUpdateForm.bo").submit();
					} else{ // 삭제하기 클릭시
						console.log($("#postForm"));
						$("#postForm").attr("action", "rcDelete.bo").submit();
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
                            <textarea name="" id="content" cols="130" rows="3"></textarea>
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
    			alertify.alert("댓글 작성 후 등록 요청해주세요!");
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