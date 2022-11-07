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
    <link rel="stylesheet" href="../css/resetPwdForm.css">
</head>
<body>
    <div id="container">
        <img src="../img/logo_main.png" alt="logo">
        <form action="">
            <h1>비밀번호 재설정</h1>
            <input type="text" name="email" id="email" placeholder="이메일">
            <input type="text" name="name" id="name" placeholder="이름">
            <input type="text" name="phone" id="phone" placeholder="휴대폰 번호">
            <button type="submit" id="submit">계정 조회</button>
            <div id="result">
                <a href="#">이메일 찾기</a> |
                <a href="#">로그인</a>
            </div>
        </form>
    </div>
</body>
</html>