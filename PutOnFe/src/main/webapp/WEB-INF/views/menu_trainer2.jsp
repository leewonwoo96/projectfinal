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
    <title>철좀들어-일정관리</title>
    <link rel="stylesheet" href="${path }/resources/css/menu_trainer2.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
</head>
<body>
<%@ include file="navMenu.jsp" %>
<div class="container">
<h1>PT 일정관리</h1>
<table id="calendar">
	<thead>
		<tr>
			<th id="prevM" align="center" colspan=2>&lang;</th>
			<th id="nowM" align="center" colspan=3></th>
			<th id="nextM" align="center" colspan=2>&rang;</th>
		</tr>
		<tr>
			<th style="color:rgb(255,70,70);">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style="color:rgb(70,150,255);">토</th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
<table id="timeTable">
	<tr><th>시간별 예약현황</th></tr>
	<tr>
		<td>09:00</td>
	</tr>
</table>
</div>
<script>
$(function(){
	var today= new Date();
	var date= new Date();
	$("#prevM").click(function(){
		$("#calendar>tbody td").remove();
		$("#calendar>tbody tr").remove();
		today = new Date(today.getFullYear(),today.getMonth()-1,today.getDate());
		buildCal();
	});
	$("#nextM").click(function(){
		$("#calendar>tbody td").remove();
		$("#calendar>tbody tr").remove();
		today= new Date(today.getFullYear(),today.getMonth()+1,today.getDate());
		buildCal();
	});
	buildCal();
	function buildCal(){
		nowY= today.getFullYear();
		nowM= today.getMonth();
		firstDate= 1;
		firstDay= new Date(nowY,nowM,1).getDay();
		lastDate= new Date(nowY,nowM+1,0).getDate();
		
		if((nowY%4===0 && nowY%100!==0)|| nowY%400===0) lastDate[1]=29;
		
		$("#nowM").text(nowY+"년 "+(nowM+1)+"월");
		$("#calendar>tbody").append("<tr>");
		for(i=0;i<firstDay;i++) $("#calendar>tbody>tr:last").append("<td></td>");
		for(i=1;i<=lastDate;i++){
			plusDate= new Date(nowY,nowM,i).getDay();
			if(plusDate==0) $("#calendar>tbody:last").append("</tr><tr>");
			$("#calendar>tbody>tr:last").append("<td class='date' align='center'>"+i+"</td>");
		}
		if($("#calendar>tbody>tr>td").length%7!=0)
			for(i=1;i<=$("#calendar>tbody>tr>td").length%7;i++)
				$("#calendar>tbody>tr:last").append("<td></td>");
		$("#calendar>tbody:last").append("</tr>");
		$(".date").each(function(index){
			if(nowY==date.getFullYear() && nowM==date.getMonth() && $(".date").eq(index).text()==date.getDate())
				$(".date").eq(index).attr('id','target');
		});
	}
});
</script>
</body>
</html>