<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="../css/resetPwd.css">
</head>
<body>
    <div id="container">
        <img src="../img/logo_main.png" alt="logo">
        <form action="">
            <h1>비밀번호 재설정</h1>
            <input type="password" name="pwd" id="pwd" placeholder="새로운 비밀번호">
            <input type="password" name="pwd_confirm" id="pwd_confirm" placeholder="비밀번호 확인">
            <button type="submit" id="submit">재설정</button>
            <hr>
        </form>
    </div>
</body>
</html>