<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진게시판 상세</title>
    <style>
        /* 전체 */
        .warp{
            border: 1px solid rgba(0, 0,0,0.1);
            width: 1200px;
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
            width: 100%;
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
            margin-top: 100px;
            margin-right: 90px;
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
        }

        .writer_name p{
            font-size: medium;
            font-weight: 600;
            margin-top: 35px;
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
            width: 13%;
            height: 60%;
            margin-left: 3px;
            margin-top: 10px;
        }
        #detail-hr {
            border: 1px solid rgba(220, 220, 220, 0.340);
            margin-right: 10px;
            margin: auto;
            width: 360px
        }
        .profile{
            display: flex;
        }
        
       	.writer_name2 img {
            width: 20px;
            height: 20px;
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
                            backBtn.removeAttribute('disabled');
                            positionValue -= IMAGE_WIDTH;
                            images.style.transform = "translateX(" + positionValue + "px)";
                            pages -= 1;
                        }
                        if (pages === 1) {
                            backBtn.setAttribute('disabled', 'true');
                        }
                    }

                    function back() {
                        if (pages < ${at.size()}) {
                            nextBtn.removeAttribute('disabled');
                            positionValue += IMAGE_WIDTH;
                            images.style.transform = "translateX(" + positionValue + "px)";
                            pages += 1;
                        }
                        if (pages === ${at.size()}) {
                            nextBtn.setAttribute('disabled', 'true');
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
		             		<a class="btn btn-primary" href="phBoardList.bo">목록으로</a>
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
                            <img src="resources/pro.png" alt="" width="95">
                            <p>${ b.boardWriter }</p>
                            <p style="color: blue; cursor: pointer;">팔로우</p>
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
                            조회수 : ${ b.count }
                        </div>
                        
                    </div>
                </div>
                <hr id="detail-hr">
                <div class="content-area">
                    <div class="review-area">
                        <!-- 댓글 들어가는 자리 -->
                    </div>
                </div>
                <hr id="detail-hr">
                <div class="under-area">
                    <p>댓글(<span id="rcount">0</span>)</p>
                    <div class="writer">
                        <textarea name="" id="content" cols="30" rows="10"></textarea>
                        <button onclick="addReply();">등록</button>
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
    					if(status == "success"){
    						selectPhReplyList();
    					}
    				}, error:function(){
    					console.log("댓글 작성용 ajax 요청 실패!")
    				}
    			})
    		} else {
    			alertify.alert("댓글 작성 후 등록 요청해주세요!");
    		}
    	}
    	
    	function selectPhReplyList(){
    		$.ajax({
    			url:"phRlist.bo",
    			data:{
    				phno:${ b.boardNo }
    			}, success:function(list){
    				console.log(list);
    				
	    				let value = "";
	    				for(let i in list){
	    					value += "<tr>"
	    						  + "<th>" + list[i].replyWriter + "</th>"
	    						  + "<td>" + list[i].replyContent + "</td>"
	    						  + "<td>" + list[i].createDate + "</td>"
	    						  + "</tr>"
	    					}
    				
    				$(".review-area").html(value);
    				$("#rcount").text(list.length);

    			}, error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패!")
    			}
    		})
    	}
    </script>
    
<jsp:include page="../common/footer.jsp"/>
</body>
</html>