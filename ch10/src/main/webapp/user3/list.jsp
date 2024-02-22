<%@page import="dto.User1DTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
	</head>
	<body>
		<h3>user3 목록</h3>
		
		<a href="/ch10/index.jsp">처음으로</a>
		<a href="/ch10/user3/register.do">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.getUid()}</td>
				<td>${user.getName()}</td>
				<td>${user.getBirth()}</td>
				<td>${user.hp}</td>
				<!-- 표현언어 안에서는 hp등은 private 선언되었지만 직접 참조 가능 -->
				<td>${user.getAddr()}</td>
				<td>
					<a href="/ch10/user3/modify.do?uid=${user.uid}">수정</a>
					<a href="/ch10/user3/delete.do?uid=${user.uid}">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>