<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>철좀들어-회원관리</title>
    <link rel="stylesheet" href="${path }/resources/css/menu_admin1.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="navMenu.jsp" %>
<div class="container">
	<nav>
		<h1>회원 관리</h1>
		<a href="#">관리자</a>
		<a href="#">트레이너</a>
		<a href="#">일반회원</a>
	</nav>
	<table>
		<tr>
			<th>이름</th>
			<th>성별</th>
			<th>연락처</th>
			<th>가입상품</th>
			<th>구매날짜</th>
			<th>만료날짜</th>
			<th>남은일수</th>
			<th>담당PT</th>
			<th>남은PT횟수</th>
			<th>BIG3</th>
		</tr>
		<c:forEach var="user" items="${list}">
		<tr>
			<td>${user.user_name}</td>
			<td>${user.gender=="M"?"남":"여"}</td>
			<td class="tel">${user.user_tel}</td>
			<td>${user.prod_name }</td>
			<td><fmt:formatDate value="${user.buy_date}" pattern="yyyy-MM-dd" type="date"/></td>
			<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" type="date"/></td>
			<td>${user.remain }</td>
			<td>${user.trainer }</td>
			<td>${user.days }</td>
			<td>${user.big3 }
				<button class="bt_edit"><img src="${path}/resources/img/icon_edit.png"></button>
				<form class="editor_big3" action="" method="post">
					<input type="hidden" name="user_email" value="${user.user_email}">
					<input type="text" name="squat" placeholder="스쿼트">
					<input type="text" name="benchpress" placeholder="벤치프레스">
					<input type="text" name="deadlift" placeholder="데드리프트">
					<input type="submit" value="변경">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
<script>
// 휴대폰 번호 - 삽입
$(".tel").each(function(i,e){
	$(e).html($(e).html().substring(0,3)+"-"+$(e).html().substring(3,7)+"-"+$(e).html().substring(7));
});
// 3대 수정 버튼 클릭 시 폼 비운 채로 나타나게
$(".bt_edit").click(function(){
	let editor_big3 = $(this).parent().find('.editor_big3');
	$('.editor_big3').not(editor_big3).hide();
	editor_big3.toggle();
	$('.editor_big3').find('input[type=text]').val("");
});
</script>
</body>
</html>