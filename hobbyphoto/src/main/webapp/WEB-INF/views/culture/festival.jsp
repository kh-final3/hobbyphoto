<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        ol, ul {
            list-style: none;
        }

        body {
            font-family: 'NanumSquare', sans-serif;
            overflow-x: hidden;
        }

        body.fixed {
            overflow: hidden;
        }

        .container {
            width: 1400px;
            margin: 0 auto;
        }

        img {
            vertical-align: middle;
        }

        .desc_txt {
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 0;
            line-height: 0;
            overflow: hidden;
            visibility: hidden;
            font-size: 0;
        }

        select {
            -moz-appearance: none;
            -webkit-appearance: none;
            appearance: none;
        }

        select::-ms-expand {
            display: none
        }

        .font_spoqa {
            font-family: 'SpoqaHanSansNeo';
        }

        #wrap {
            overflow-x: hidden;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul {
            display: flex;
            padding: 0;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li {
            width: 50%;
            border-top: 1px solid #dadada;
            border-right: 1px solid #dadada;
            border-bottom: 1px solid #7989d9;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li a {
            display: block;
            width: 100%;
            height: 60px;
            line-height: 60px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            color: #666;
            font-family: 'SpoqaHanSansNeo';
            background: #f6f6f6;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li.on {
            border-left: 1px solid #7989d9;
            border-top: 1px solid #7989d9;
            border-bottom: 1px solid #fff;
            border-right: 1px solid #7989d9;
        }

        .performance_wrap .pf_schedule .pf_sche_tab .tab_ul li.on a {
            background: #fff;
            color: #7989d9;
        }
        body {
            font-family: 'NanumBarunGothic', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 50px 0;
        }

        .pf_list_box {
            margin: auto;
            display: flex;
            width: 1200px;
            border: 1px solid #dadada;
            margin-bottom: 20px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .imgbox {
            width: 200px;
            height: 230px;
            border-right: 1px solid #dadada;
            background-size: cover;
            background-position: center;
        }

        .imgbox img{
            width: 100%;
            height: 100%;
        }

        .txtbox {
            display: flex;
            flex-direction: column;
            padding: 20px;
            border-radius: 5px;
            flex-grow: 1;
        }

        .txtbox h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .txtbox ul {
            list-style: none;
            padding: 0;
        }

        .txtbox li {
            font-size: 15px;
            margin-bottom: 5px;
        }

        .pf_btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .view_btn {
            border: 1px solid #dadada;
            color: black;
            padding: 5px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .view_btn:hover {
            font-weight: bold;
            border: 1px solid #000;
            background-color: #dadada;
        }

        .pf_list_box:hover, .card:hover {
            box-shadow: 0 0 20px rgba(25, 27, 79, 0.5);
            transition: all 0.3s;
        }

        .card-img-top {
            height: 300px;
        }
       
    </style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div class="content">
            <div class="performance_wrap">
                <div class="container">
                    <div class="pf_schedule">
                        <div class="pf_sche_tab">
                            <ul class="tab_ul">
                                <li class="on"><a href="festvalListView.fs">축제</a></li>
                                <li><a href="exhibitListView.fs">전시</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="containers">
    </div>
    <script>
        $(function () {
                  $(".tab_ul li").click(function () {
                    $(".tab_ul li").removeClass("on");
                    $(this).addClass('on');
                  })
                  
                  $.ajax({
                        url: "festvalList.fs",
                        success: function (data) {
                            console.log(data);


                            let value = "";
                            $(data).find("row").each(function (i, row) {
                                value += "<div class='pf_list_box'>"
		                               + "<div class='imgbox'>"
		                               + "<img src='"+$(row).find("MAIN_IMG").text() +"' ></div>"
		                                + "<div class='txtbox'>"
		                                + "<h3>" + $(row).find("TITLE").text() +"</h3>"
		                                + "<ul>"
		                                + "<li><b>기 간 </b>" + $(row).find("DATE").text()+"</li>"
		                                + "<li><b>장 소 </b>" + $(row).find("PLACE").text()+ "</li>"
		                                + "<li><b>가 격 </b>" + $(row).find("USE_FEE").text()+"</li>"
		                                + "<li><b>대 상 </b>" + $(row).find("USE_TRGT").text()+"</li>"
		                                + "</ul>"
		                                + "<div class='pf_btn'>"
		                                + "<br>"
		                                + "<a href="+$(row).find("ORG_LINK").text() +" seq='2221' class='view_btn'>상세보기</a>"
		                                + "</div>"
		                                +  "</div>"
		                                + "</div>"
                            })

                            $(".containers").html(value);
                             
                        }, error: function () {
                            console.log("ajax 통신 실패")
                        }
                    })
                });
        
        
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>
