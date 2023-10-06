<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<script>
			alert("${ alertMsg }");
	</script>
	
	<div style="height:600px">
		<form action="login.me" method="post">
			아이디 : <input type="text" name="userId">
			비밀번호 : <input type="password" name="userPwd">
			<button>로그인</button>
		</form>
	</div>
	
	<jsp:include page="common/footer.jsp"/>
</body>
</html>