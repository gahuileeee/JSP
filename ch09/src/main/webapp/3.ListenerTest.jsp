<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sessUid =(String)session.getAttribute("sessUid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.ListenerTest</title>
	</head>
	<body>
		<h3>3.리스너</h3>
		<%if(sessUid ==null){ %>
		<form action="/ch09/login.do" method="post">
			<input type="text" name="uid"><br>
			<input type="password" name="pass"><br>
			<input type="submit" name="submit" value="로그인"><br>
		</form>
		<%}else{ %>
			<p>
				<%=sessUid %>님 반갑습니다.
			</p>
			<a href="/ch09/logout.do">로그아웃</a>
		<%} %>
	</body>
</html>