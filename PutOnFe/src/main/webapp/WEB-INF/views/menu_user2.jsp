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
    <title>철좀들어-PT예약</title>
    <link rel="stylesheet" href="${path }/resources/css/menu_user2.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="navMenu.jsp" %>
<div class="container">
<h1>PT예약</h1>
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
	<thead>
		<tr><th id="tableHead" colspan=4></th></tr>
	</thead>
	<tbody></tbody>
	<tfoot>
		<tr><td colspan=4>
			<form action="PT/reservation" method="post" onsubmit="return rightValue();">
				<input type="hidden" name="pt_datetime" id="reservDate" value="-">
				<input type="submit" value="예약하기">
			</form>
		</td></tr>
	</tfoot>
</table>
</div>

<script>
let msg="${msg}";
if(msg!="") alert(msg);
// 모델로 받은 이미 예약된 시간 목록 저장
var bookedList= new Array();
<c:forEach var="booked" items="${bookedList}">
	bookedList.push("${booked[0]}"+"_"+"${booked[1]}");
</c:forEach>
// 유저의 예약정보 리스트
var userList= new Array();
<c:forEach var="userBook" items="${userList}">
	userList.push("${userBook[0]}"+"_"+"${userBook[1]}");
</c:forEach>
//날짜형식 데이터 포맷
function dateFm(date){
	year= date.getFullYear();
	month= date.getMonth()+1;
	day= date.getDate();
	hour= date.getHours();
	return [year,month,day].join("-")+"_"+hour;
}
//전송버튼 누를 시 유효성 검사
function rightValue(){
	if($("#reservDate").val()=="-"){
		alert("날짜와 시간을 선택해주세요.");
		return false;
	} return true;
}

// 달력, 시간표 출력
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
buildTimeTable();

// 달력 만들기
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
		$("#calendar>tbody>tr:last").append("<td class='date' align='center'>"+i+"</td>");
	}
	if($("#calendar>tbody>tr>td").length%7!=0)
		for(i=1;i<=$("#calendar>tbody>tr>td").length%7;i++)
			$("#calendar>tbody>tr:last").append("<td class='disabled'></td>");
	$("#calendar>tbody:last").append("</tr>");
	
	// 각 날짜에 맞는 속성 부여하기(선택불가, 선택된 날짜)
	$(".date").each(function(index){
		if(nowY==today.getFullYear() && nowM==today.getMonth() && $(".date").eq(index).text()==today.getDate()){
			$(".date").eq(index).attr('id','today');
			$(".date").eq(index).addClass('selected');
		}
		if(nowY<today.getFullYear())
			$(".date").eq(index).addClass('disabled');
		if(nowY==today.getFullYear() && nowM<today.getMonth())
			$(".date").eq(index).addClass('disabled');
		if(nowY==today.getFullYear() && nowM==today.getMonth() && $(".date").eq(index).text()<today.getDate())
			$(".date").eq(index).addClass('disabled');
		$(userList).each(function(i,t){
			if(nowY==t.split("-")[0] && nowM==t.split("-")[1]-1 && $(".date").eq(index).text()==t.split("-")[2].split("_")[0])
				$(".date").eq(index).addClass('booked');
		});
	});
	//날짜 선택 시 이벤트
	$(".date").not(".disabled").click(function(){
		$(".date").removeClass('selected');
		$("#reservDate").val("-");
		$(this).addClass('selected');
		now = new Date(nowY,nowM,$(this).text());
		buildTimeTable();
	});
}

// 시간표 만들기
function buildTimeTable(){
	nowY = now.getFullYear();
	nowM = now.getMonth();
	nowD = now.getDate();
	
	$("#timeTable>tbody td").remove();
	$("#timeTable>tbody>tr").remove();
	
	$("#tableHead").text(nowY+"년 "+(nowM+1)+"월 "+nowD+"일");
	$("#timeTable>tbody").append("<tr>");
	for(i=9;i<21;i++){
		if(i==13 || i==17) $("#timeTable tbody:last").append("</tr><tr>");
		$("#timeTable>tbody>tr:last").append('<td class="time" id="'+dateFm(now).split("_")[0]+'_'+i+'">'+i+':00</td>');
	}
	$("#timeTable>tbody:last").append("</tr>");

	//이미 예약된 시간, 현재시각 기준 1시간후까지 비활성화
	rightNow = dateFm(new Date());
	$(".time").each(function(index,item){
		$(bookedList).each(function(i,t) {
			if($(item).attr("id")==t) $(item).addClass("disabled");
		});
		$(userList).each(function(i,t){
			if($(item).attr("id")==t){
				$(".time").addClass("disabled");
				$(item).addClass("booked");
			}
		});
		if($(item).attr("id").split("_")[0]==rightNow.split("_")[0])
			if(parseInt($(item).attr("id").split("_")[1])<=parseInt(rightNow.split("_")[1])+1)
				$(item).addClass("disabled");
	});
	// 시간 선택 시 이벤트
	$(".time").not(".disabled").click(function(){
		$(".time").removeClass("selected");
		$(this).addClass('selected');
		$("#reservDate").val($(this).attr("id"));
	});
}
</script>
</body>
</html>