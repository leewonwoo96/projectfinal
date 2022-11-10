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
    <title>철좀들어-추천정보</title>
    <link rel="stylesheet" href="${path }/resources/css/boarder_recommend.css">
</head>
<body>
<%@ include file="navMenu.jsp" %>
<div class="container">
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회</th>
		</tr>
		<c:forEach var="board" items="${list }">
			<tr>
				<td>${board.rec_num }</td>
				<td><a href="<c:url value='/recommend/read${ph.sc.queryString }&rec_num=${board.rec_num }'/>">${board.rec_title }</a></td>
				<td>${board.user_email }</td>
				<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="rec_date" value="${board.rec_date}" pattern="yyyy-MM-dd"/>
				<c:choose>
					<c:when test="${today<=rec_date }">
						<td class="recdate"><fmt:formatDate value="${board.rec_date }" pattern="HH:mm" type="time"/></td>
					</c:when>
					<c:otherwise>
						<td class="recdate"><fmt:formatDate value="${board.rec_date }" pattern="yyyy-MM-dd" type="date"/></td>
					</c:otherwise>
				</c:choose>
				<td>${board.views }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="tools">
		<button type="button" class="btn" id="writeBtn" onclick="location.href='<c:url value="/recommend/write"/>'">글쓰기</button>
		<div class="search-container">
			<form action="<c:url value="/recommend"/>" class="search-form" method="get">
				<select class="form-control" name="option">
					<option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected":""}>제목+내용</option>
					<option value="T" ${ph.sc.option=='T'? "selected":""}>제목</option>
					<option value="C" ${ph.sc.option=='C'? "selected":""}>내용</option>
				</select>
				<input type="text" name="keyword" class="form-control" value="${ph.sc.keyword }" placeholder="검색어 입력">
				<input type="submit" class="btn btn-default" value="검색">
			</form>
		</div>
	</div>
	<nav>
		<ul class="pagination">
			<c:if test="${ph.showPrev }">
				<li><a href="<c:url value='/recommend${ph.sc.getQueryString(ph.beginPage-1)}'/>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
				<li ${i==ph.sc.getPage()?'class="active"':'' }><a href="<c:url value='/recommend${ph.sc.getQueryString(i)}'/>">${i }</a></li>
			</c:forEach>
			<c:if test="${ph.showNext }">
				<li><a href="<c:url value='/recommend${ph.sc.getQueryString(ph.endPage+1)}'/>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</div>
<script>
	let msg="${msg}";
	if(msg=="del") alert("성공적으로 삭제되었습니다.");
	if(msg=="error") alert("삭제에 실패했습니다.");
	if(msg=="write_success") alert("성공적으로 등록되었습니다.");
</script>
</body>
</html>