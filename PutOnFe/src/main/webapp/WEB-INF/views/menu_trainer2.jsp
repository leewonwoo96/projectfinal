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
	<div class="uls">
		<h1><span>일정</span><span id="dateTitle"></span><span>요청</span></h1>
		<div class="ul">
			<ul id="reservationList"></ul>
			<form action="">
				<input type="hidden" id="bookedPT" name="bookedPT">
				<button id="cancel">예약취소</button>
				<button id="modify">예약변경</button>
			</form>
		</div>
		<div class="ul">
			<ul id="requestList"></ul>
			<form action="">
				<input type="hidden" id="reqedPT" name="reqedPT">
				<button id="reject">예약취소</button>
				<button id="confirm">예약확정</button>
			</form>
		</div>
	</div>
</div>
<script>
//날짜형식 데이터 포맷
function dateFm(date){
	year= date.getFullYear();
	month= date.getMonth()+1;
	day= date.getDate();
	hour= date.getHours();
	return [year,month,day].join("-")+"_"+hour;
}
//달력, 시간표 출력
var now= new Date();
var today= new Date();
// 저번달, 다음달 버튼
$("#prevM").click(function(){
	$("#calendar>tbody td").remove();
	$("#calendar>tbody tr").remove();
	now = new Date(now.getFullYear(),now.getMonth()-1,now.getDate());
	buildCal();
});
$("#nextM").click(function(){
	$("#calendar>tbody td").remove();
	$("#calendar>tbody tr").remove();
	now= new Date(now.getFullYear(),now.getMonth()+1,now.getDate());
	buildCal();
});
buildCal();
reservationList();
requestList();
function buildCal(){
	nowY= now.getFullYear();
	nowM= now.getMonth();
	
	firstDay= new Date(nowY,nowM,1).getDay();
	lastDate= new Date(nowY,nowM+1,0).getDate();
	
	if((nowY%4===0 && nowY%100!==0)|| nowY%400===0) lastDate[1]=29;
	
	$("#nowM").text(nowY+"년 "+(nowM+1)+"월");
	$("#calendar>tbody").append("<tr>");
	for(i=0;i<firstDay;i++) $("#calendar>tbody>tr:last").append("<td class='disabled'></td>");
	for(i=1;i<=lastDate;i++){
		plusDate= new Date(nowY,nowM,i).getDay();
		if(plusDate==0) $("#calendar>tbody:last").append("</tr><tr>");
		$("#calendar>tbody>tr:last").append("<td class='date'><p>"+i+"</p><p><span class='books'></span> | <span class='requests'></span></p></td>");
	}
	if($("#calendar>tbody>tr>td").length%7!=0)
		for(i=1;i<=$("#calendar>tbody>tr>td").length%7;i++)
			$("#calendar>tbody>tr:last").append("<td class='disabled'></td>");
	$("#calendar>tbody:last").append("</tr>");
	
	// 각 날짜에 맞는 속성 부여하기(선택불가, 선택된 날짜)
	$(".date").each(function(index){
		if(nowY==today.getFullYear() && nowM==today.getMonth() && $(".date").eq(index).find("p:first").text()==today.getDate()){
			$(".date").eq(index).attr('id','today');
			$(".date").eq(index).addClass('selected');
		}
	});
	// 날짜 클릭 시
	$(".date").click(function(){
		$(".date").removeClass('selected');
		$(this).addClass('selected');
		$("#bookedPT").val("-");
		$("#reqedPT").val("-");
		now=new Date(nowY,nowM,$(this).find('p:first').text());
		reservationList();
		requestList();
	});
}
function reservationList(){
	nowY = now.getFullYear();
	nowM = now.getMonth();
	nowD = now.getDate();
	ul = $("#reservationList");
	
	ul.find("li").remove();
	$("#dateTitle").text(nowY+"-"+(nowM+1)+"-"+nowD);
	for(i=9;i<21;i++) ul.append('<li class="time" id="'+dateFm(now).split("_")[0]+'_'+i+'"><span>'+i+':00</span><span>님</span></li>');
	
	//시간 선택 시 이벤트
	$(".time").click(function(){
		$(".time").removeClass("selected");
		$(this).addClass("selected");
		$("#bookedPT").val($(this).attr("id"));
	});
}
function requestList(){
	nowY = now.getFullYear();
	nowM = now.getMonth();
	nowD = now.getDate();
	ul = $("#requestList");
	
	ul.find("li").remove();
}
</script>
</body>
</html>