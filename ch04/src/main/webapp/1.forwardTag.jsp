<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.forwardTag</title>
	</head>
	<body>
		<h3>1.forwardTag</h3>
		<%
		//pageContext.forward("./proc/target.jsp");
		%>
		<!-- 이거를 tag로 구현할 수 있도록 만들었으나 거의 사용되지 않음 -->
		<jsp:forward page="./proc/target.jsp"></jsp:forward>:
	</body>
</html>