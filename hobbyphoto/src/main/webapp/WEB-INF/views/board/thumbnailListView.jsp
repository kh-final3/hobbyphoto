<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>사진게시판</title>
<style>
    .outer_th{
        /* border: 1px solid red; */
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }

    .list-area_th{
        /* border: 1px solid red; */
        width: 1000px;
        margin: auto;
    }

    .thumbnail{
        /* border: 1px solid red; */
        width: 300px;
        display: inline-block;
        margin: 14px;
    }
    
    .thumbnail:hover{
    	cursor: pointer;
    	opacity: 0.7;
    }

    /* 사진 밑의 작성자, 제목 */
    .thumbnail>#thumbText{
        margin: 10px;
        font-size: small;
        line-height: 210%;
    }

    /* 제목 밑줄 */
    h.h_a:after{
        content: "";
        display: block;
        width: 30px;
        border-bottom: 2px solid gray;
        border-radius: 20px;
        margin: 10px 0 0 0;
    }

    /* 글작성 버튼 */
    #btn_th{
        margin: 0 -227px 10px 0;
    }

    /* 페이징바 */
    .paging-area>button{
            border: none;
            background-color: white;
            width: 35px;
            height: 35px;
            margin-top: 20px;
        }

    /* 위로가기 버튼 */
    #top{
        width: 40px; 
        height: 40px;
    }

</style>
</head>
<body>

    <div class="outer_th" id="header_th">
            <br>
            <h2 align="center">사진게시판</h2>
            <br>

	        <div style="width: 850px;" align="right">
	            <a href="#" class="btn btn-light" id="btn_th">글작성</a>
	        </div>
        <div class="list-area_th">
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            <div class="thumbnail" align="center">
                <img src="https://www.w3schools.com/bootstrap4/newyork.jpg" width="295" height="220"> 
                <p id="thumbText">
                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> TRAVEL <br><h class="h_a">두롤의 라오스</h>
                    <p style="font-size: small;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </p>
            </div>
            
            

            <div class="paging-area" align="center">
                <button disabled> &lt; </button>
                <button style="border: 1px solid lightgray; font-weight: bolder;">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button> &gt; </button>
            </div>

            <div id="topbtn">
                <a style="display:scroll; position:fixed; bottom:10px; right:20px;" title="top">
                    <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top">
                </a> 
            </div>   
        </div>
    </div>
    
</body>
</html>