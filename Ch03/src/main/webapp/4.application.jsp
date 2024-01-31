<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4.application</title>
	</head>
	<body>
		<h3>4.application 내장객체</h3>
		<h4>서버 정보</h4>
		<p>
		<%= application.getServerInfo() %>
		</p>
		
		<h3>파라미터 정보</h3>
		<p> Param1: <%= application.getInitParameter("PARAM1")%> </p>
		<p> Param2: <%= application.getInitParameter("PARAM2")%> </p>
		
		<h4>로그정보</h4>
		<%
			application.log("4.application..로그1");
		%>
		
		<h4>자원경로</h4>
		<p>
			파일경로: <%= application.getRealPath("./4application.jsp") %>
		</p>
	</body>
</html>