<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content="" />
        <meta name="author" content="" />
        <style>
            button {
                border: 1px solid gray
            }
            
        </style>
        <title>관리자 페이지</title>
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
    </head>
    <body class="sb-nav-fixed">
    <c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="alist.da">하비포토 관리페이지</a>

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
                        <li><hr class="dropdown-divider" /></li>
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
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.me">Login</a>
                                            <a class="nav-link" href="memberEnrollForm.me">Register</a>
                                            <a class="nav-link" href="password.jsp">Forgot Password</a>

                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">주요 관리 기능</div>

                            <a class="nav-link" href="mlist.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원관리
                            </a>
                            <a class="nav-link" href="plist.pr">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품관리
                            </a>
                            <a class="nav-link" href="blist.bo">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시글관리
                            </a>
                            <a class="nav-link" href="rlist.me">

                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                신고회원관리
                            </a>
                            <div class="sb-sidenav-menu-heading">주요 현황</div>
                            <a class="nav-link" href="chart.da">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품 매출 현황
                            </a>
                            <a class="nav-link" href="table.da">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                커뮤니티 이용자수
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
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">커뮤니티 및 쇼핑몰 관리</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">회원관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="mlist.me">View Details</a>

                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">상품관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">

                                        <a class="small text-white stretched-link" href="plist.pr">View Details</a>

                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">

                                    <div class="card-body">게시글관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="blist.bo">View Details</a>

                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">

                                    <div class="card-body">신고회원관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="rlist.me">View Details</a>

                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        상품 매출 현황
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        커뮤니티 이용자수
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                이슈 회원 관리
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>신고 사유</th>
                                            <th>신고자</th>
                                            <th>제재 횟수</th>
                                            <th>신고 날짜</th>
                                            <th>신고된 게시물</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>도박/사행성</td>
                                            <td>김철수</td>
                                            <td>1</td>
                                            <td>2023/10/10</td>

                                            <td><button>신고된 게시물로 이동</button></td>

                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>도박/추측</td>
                                            <td>김철수</td>
                                            <td>1</td>
                                            <td>2023/10/01</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>이영희</td>
                                            <td>욕설</td>
                                            <td>박지영</td>
                                            <td>3</td>
                                            <td>2023/10/02</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>김철민</td>
                                            <td>사칭</td>
                                            <td>이수진</td>
                                            <td>2</td>
                                            <td>2023/10/03</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>박지원</td>
                                            <td>혐오 발언</td>
                                            <td>이동욱</td>
                                            <td>4</td>
                                            <td>2023/10/04</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>최민호</td>
                                            <td>거짓 정보</td>
                                            <td>김하늘</td>
                                            <td>2</td>
                                            <td>2023/10/05</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>이지수</td>
                                            <td>사생활 침해</td>
                                            <td>박태현</td>
                                            <td>1</td>
                                            <td>2023/10/06</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>박영호</td>
                                            <td>폭력적인 콘텐츠</td>
                                            <td>정미경</td>
                                            <td>3</td>
                                            <td>2023/10/07</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>김수진</td>
                                            <td>부적절한 행동</td>
                                            <td>이승우</td>
                                            <td>2</td>
                                            <td>2023/10/08</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>장현우</td>
                                            <td>표절</td>
                                            <td>강지은</td>
                                            <td>1</td>
                                            <td>2023/10/09</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                        <tr>
                                            <td>송가람</td>
                                            <td>길게 눈에 띄는 콘텐츠</td>
                                            <td>이준호</td>
                                            <td>5</td>
                                            <td>2023/10/10</td>
                                            <td><button>신고된 게시물로 이동</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">

                </footer>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/assets/demo/chart-area-demo.js"></script>
        <script src="resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>

