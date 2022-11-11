<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<img src="${path}/resources/img/anchovy.png">
<p>
	<span id="user-name">${user.user_name }님</span>
	<span id="user-type">관리자</span>
</p>
<p>존엄하신 관리자</p>
<p>회원 수 : 000명</p>
<p>트레이너 수 : 00명</p>
<p>기간권 구매자 수 : 000명</p>
<div class="info-nav">
	<a href="<c:url value='/myPage'/>">마이페이지</a>
	<a href="<c:url value='/login/logout'/>">로그아웃</a>
</div>