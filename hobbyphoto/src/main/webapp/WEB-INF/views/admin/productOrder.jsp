<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <title>신고게시물관리</title>
</head>
    <body class="sb-nav-fixed">
    <jsp:include page="adminAlert.jsp"/>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="rlist.me">상품주문관리</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="main.ho">홈으로</a></li>
                        <li><hr class="dropdown-divider"/></li>
                        <li><a class="dropdown-item" href="logout.me">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메인</div>
                            <a class="nav-link" href="alist.da">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${ loginMember.nickName }
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품주문관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="alist.da">Dashboard</a></li>
                            <li class="breadcrumb-item active">상품주문관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
								회원의 주문완료된 상품을 관리할 수 있습니다. <br>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                주문 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>회원번호</th>
                                            <th>받는사람</th>
                                            <th>배송지</th>
                                            <th>상세주소</th>
                                            <th>휴대폰번호</th>
                                            <th>주문날짜</th>
                                            <th>가격</th>
                                            <th>상태</th>
                                            <th>주문메세지</th>
                                            <th>배송메세지</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
		                                   <c:forEach var="p" items="${ list }">
		                                        <tr>
		                                            <td>${ p.orderNo }</td>
		                                            <td>${ p.userNo }</td>
		                                            <td>${ p.name }</td>
		                                            <td>${ p.address }</td>
		                                            <td>${ p.postcode }</td>
		                                            <td>${ p.phone }</td>
		                                            <td>${ p.orderDate }</td>
		                                            <td>${ p.totalPrice }</td>
		                                            <td>${ p.status }</td>
		                                            <td>${ p.OMsg }</td>
		                                            <td>${ p.DMsg }</td>
		                                        </tr>
		                                   </c:forEach>
	                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
				<footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; hobbyphoto 2023</div>
                            <div>
                                <a href="#">개인정보보호 정책</a>
                                &middot;
                                <a href="#">이용약관</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
		
		<script>
		    $(function(){
		        $(document).on("click", "#datatablesSimple>tbody>tr", function(){
		            var boardType = $(this).children().eq(3).text();
		            var refBno = $(this).children().eq(4).text();
		            if (boardType === "사진 게시판") {
		                location.href = "phDetail.bo?phno=" + refBno;
		            } else if (boardType === "장비 게시판") {
		                location.href = "rcDetail.bo?phno=" + refBno;
		            } else if (boardType === "모임 게시판") {
		                location.href = "togetherDetail.tg?gno=" + refBno;
		            } else {
		            	location.href = "backDetail.bo?bno=" + refBno;
		            }
		        });
		    });
		</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
    