<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">

<title>Insert title here</title>

	<Style>

     div * {
        box-sizing: border-box;
     }

   

    #banner{
    height: 450px;
    border: 1px solid black;
    margin: auto;
    background-image: url(bg_cat_camera.jpg);
    background-size: 1400px;
    color: white;
    }

    #category{
        height: 60px;
        border: 1px solid black;
        margin: auto;
        margin-top: 10px;
        background-color: black;
        color: white;
    }

    .list{
        width: 1300px;
        margin: auto;
        margin-top: 20px;
        margin-left: 200px;
    }

    .product{
        width: 350px;
        height: 430px;
        border: 1px solid lightgray;
        border-radius: 20px;
        padding: 20px;
        margin: 70px 36px 0px;
        float: left;
    }

    .img{
        width: 310px;
        height: 310px;
    }
    .img>img{
        width: 310px;
        height: 310px;
    }
    .text{
        border-top: 1px solid lightgray;
        padding-top: 20px;
        font-size: 20px;
        font-weight: bolder;
    }

    .inner-category{
        width: 1200px;
        height: 100%;
        box-sizing: border-box;
    }

    .category-ul{
        width: 1200px;
        height: 100%;
        margin: 0px;
        padding: 0px;
        list-style-type: none;
    }

    .select-li{
        width: 250px;
        height: 60px;
        display: inline-block;
        vertical-align: top;
    }
    
    .home-btn{
        width: 80px;
        height: 60px;
        display: inline-block;
        vertical-align: top;
    }


    *:after{box-sizing: border-box;}

    .label{
        height: 100%;
        font-weight: 700;
        font-size: 18px;
        line-height: 58px;
        display: block;
        padding: 0 50px 0 30px;
    }

    .select-wrap{width: 100%; height: 100%; position: relative; box-sizing: border-box; margin-bottom: 1px;}
    .select-wrap:hover{cursor: pointer;}

    .select-btn{width: 16px; height: 16px; color: white; position: absolute; right: 10%; top: 30%;}

    .select-item{width: 100%; height: 260px; box-shadow: none; box-sizing: border-box; background-color: white; border: 1px solid #ccc; display: none;}
    .select-ul{width: 100%; padding: 0;}
    .select-ul>li{width: 100%; height: 50px; box-sizing: border-box; font-size: 16px; font-weight: 600; color: black; list-style-type: none; padding: 13px 30px;}
    

    .clearfix::after {
    content: "";
    clear: both;
    display: table;
    margin: auto;
    }
    .home-btn{text-align: center; line-height: 50px; font-size: 30px;}
    .home-btn a{color: white;}
    .home-btn a:link{color: white; text-decoration: none}
    .home-btn a:hover{color: white;}

	

	</Style>

</head>
<body>

	<jsp:include page="../common/shopHeader.jsp"/>
            <div class="all">
                <div id="banner" align="center">
                       <img src="resources/images/니콘배너.png" style="width:100%; height:100%;">
                </div>

                <div id="category" align="center">
                
                <!-- <form id="searchul" action="shopli.search" method="post">-->
                <input type="hidden" name="brand" id="selectedbrand" value="">
                <input type="hidden" id="selectedcategory" name="category" value=""> 

                    <div class="inner-category">
                        <ul class="category-ul" align="left">
                            <li class="home-btn" align="center">
                                <a href="pro.list">
                                   <i class="ri-home-line"></i>
                                </a>
                            </li>
                            
                            
	                            <li class="select-li">
	                                <div class="select-wrap">
	                                    <span class="label" id="brandLabel">브랜드</span>
	                                    <b class="select-btn" onclick="brandBtn()"><i class="ri-arrow-down-s-fill"></i></b>
	                                </div>
	                                <div class="select-item brand">
	                                    <ul class="select-ul">
	                                        <li name="brand" value="1">CANON</li>
	                                        <li name="brand" value="2">NIKON</li>
	                                        <li name="brand" value="3">OLYMPUS</li>
	                                        <li name="brand" value="4">SONY</li>
	                                        <li name="brand" value="5">FUJIFILM</li>
	                                    </ul>
	                                </div>
	                            </li>
	                            
	                            <li class="select-li">
	                                <div class="select-wrap">
	                                    <span class="label" id="categoryLabel">DSLR</span>
	                                    <b class="select-btn" onclick="categoryBtn()"><i class="ri-arrow-down-s-fill"></i></b>
	                                </div>
	                                <div class="select-item category">
	                                    <ul class="select-ul">
	                                        <li name="category" value="1">DSLR</li>
	                                        <li name="category" value="2">SLR</li>
	                                        <li name="category" value="3">미러리스트</li>
	                                        <li name="category" value="4">임펙트</li>
	                                    </ul>
	                                </div>
	                            </li>
                            
                            
                        </ul>
                    </div>
                            <!-- </form> -->
                </div>
                
	                <div class="list clearfix" style="width: 90%;">
	                    <c:forEach var="c" items="${ list }">
	                        <div class="product" id="clickpro">
	                            <input type="hidden" name="pNo" class="pNo" value="${ c.PNo }">
	                            <div class="img">
	                                <img src="${ c.thumbnail }">
	                            </div>
	                            <div class="text">
	                                ${ c.PName }
	                            </div>
	                        </div>
	                    </c:forEach>
	                </div>
            </div>

            <br>
            <div>
                <jsp:include page="../common/footer.jsp"/>
            </div>
            





		    <script>
		    	$(function(){
		    		$(".product").click(function(){
		    			location.href='detail.pro?pno='+$(this).children(".pNo").val();
		    		})
		    	})
		    	
		    	function brandBtn() {
		            $(".category").css("display", "none")
		            if( $(".brand").css("display") == "none"){
		                $(".brand").css("display", "block")
		            }else{
		                $(".brand").css("display", "none")
		            }       
		        }
		
		        function categoryBtn() {
		            $(".brand").css("display", "none")
		            if( $(".category").css("display") == "none"){
		                $(".category").css("display", "block")
		            }else{
		                $(".category").css("display", "none")
		            }   
		        }
		        
		        $(document).ready(function(){

		            // 브랜드 선택
		            $(".select-item.brand ul").on("click", "li", function(){
		                var selectedBrand = $(this).attr('value');
		                $("#selectedbrand").val(selectedBrand); // 값을 숨겨진 input 필드에 저장
		                console.log(selectedBrand)
		                
		                // 브랜드 이름으로 span 변경
    					$("#brandLabel").text($(this).text());
		                $(".brand").css("display", "none");
		                
		             	// 카테고리 초기화
		                $("#categoryLabel").text("DSLR"); // 초기 상태로 span 변경
		                $("#selectedcategory").val(""); // 숨겨진 input 필드 값 초기화
		                
		                var selectedCategory = $("#selectedcategory").val(); // 현재 선택된 카테고리 값
		                ulselect(selectedBrand,selectedCategory); //함수 실행
		                //$("#selectedbrand").val(selectedBrand); // 값을 숨겨진 input 필드에 저장
		                //$("#searchul").submit(); // form 제출
		            });

		            // 카테고리 선택
		            $(".select-item.category ul").on("click", "li", function(){
		                var selectedCategory = $(this).attr('value');
		                $("#selectedcategory").val(selectedCategory); // 값을 숨겨진 input 필드에 저장
		                
		             	// 카테고리 이름으로 span 변경
		                $("#categoryLabel").text($(this).text());
		                $(".category").css("display", "none")
		                
		                var selectedBrand = $("#selectedbrand").val(); // 현재 선택된 브랜드 값
		                ulselect(selectedBrand,selectedCategory);
		                
		                console.log(selectedBrand)
		                console.log(selectedCategory)
		                //$("#selectedcategory").val(selectedCategory); // 값을 숨겨진 input 필드에 저장
		                //$("#searchul").submit(); // form 제출
		            });
		            
		            function ulselect(selectedBrand,selectedCategory){
		            	$.ajax({
		            		url:"shopli.search",
		            		data:{
		            			brand:selectedBrand,
		            			category:selectedCategory
		            		},
		            		success:function(data){
		            			console.log(data);
		            			
		            			let value ="";
		            			$.each(data.list, function(index, product) {
		            		        value += '<div class="product" id="clickpro">'
		            		               + '<input type="hidden" name="pNo" class="pNo" value="' + product.PNo + '">'
		            		               + '<div class="img">'
		            		               + '<img src="' + product.thumbnail + '">'
		            		               + '</div>'
		            		               + '<div class="text">'
		            		               + product.pName
		            		               + '</div>'
		            		               + '</div>';
		            		    });

		            		    $(".list").html(value);
		            			
		            		},error:function(){
		            			console.error("검색 ajax 요청 실패")
		            		}
		            	})
		            }

		        });
		        
		        
		    </script>


</body>
</html>