<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.includeTag</title>
	</head>
	<body>
		<h3>2.includeTag</h3>
		
		<h4>include 지시자</h4>
		<%@ include file="./inc/_header.jsp" %>
		<%@ include file="./inc/_footer.jsp" %>
		<%@ include file="./inc/_config1.jsp" %>
			<p>
			num1 : <%= num1 %> <br>
			num1 : <%= num2 %> <br>
			</p>
		<h4>include 액션태그</h4>
		
		<jsp:include page="./inc/_header.jsp"> </jsp:include>
		<jsp:include page="./inc/_footer.jsp"> </jsp:include>
		<jsp:include page="./inc/_config2.jsp"> </jsp:include>
		
		<!--include 지시자와 달리 참조되지 않음 -->
		<%--
			<p>
			var1 : <%= var1 %> <br>
			var2 : <%= var2 %> <br>
			</p>
			 --%>
	</body>
</html>