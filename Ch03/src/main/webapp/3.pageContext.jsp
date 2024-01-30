<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.pageContext</title>
		<!-- 
			
		 -->
	</head>
	<body>
		<h3>3.pageContext 내장객체</h3>
		<h4>forward </h4>
		<a href="./proc/forward1.jsp">포워드 요청1</a>
		<a href="./proc/forward2.jsp">포워드 요청2</a>
		<h4>include </h4>
		<%
			pageContext.include("./inc/_header.jsp");
			pageContext.include("./inc/_footer.jsp");
		%>
	</body>
</html>