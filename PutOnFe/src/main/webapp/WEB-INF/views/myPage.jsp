<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>철좀들어-마이페이지</title>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
</head>
<body>
<%@ include file="navMenu.jsp" %>
<div class="container">
	<nav>
		<ul>
			<li><a href="<c:url value=''/>">회원정보</a></li>
			<li><a href="<c:url value=''/>">비밀번호 변경</a></li>
			<li><a href="<c:url value=''/>">회원탈퇴</a></li>
		</ul>
	</nav>
	<div class="contents">
		<h1>회원정보</h1>
		<form action="" method="post">
			<label><span>이메일</span><input type="text" name="email" value="${user.user_email}" readonly></label>
			<label><span>이름</span><input type="text" name="name" value="${user.user_name}" readonly></label>
			<label><span>연락처</span><input type="text" name="tel" id="tel" readonly></label>
			<label><span>성별</span><input type="text" name="gender" value="${user.gender eq 'M'?'남자':'여자'}" readonly></label>
			<label><span>회원유형</span><input type="text" name="type" value="${user.user_type eq 'A'?'관리자':user.user_type eq 'T'?'트레이너':'일반회원'}" readonly></label>
			<label><span>3대</span><input type="text" name="big3" readonly></label>
		</form>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
let tel = "${user.user_tel}";
let user_tel= tel.substring(0,3)+"-"+tel.substring(3,7)+"-"+tel.substring(7);
$("#tel").val(user_tel);
</script>
</html>