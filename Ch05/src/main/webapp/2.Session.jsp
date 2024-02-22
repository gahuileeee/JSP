<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="sub1.UserDTO"%>
		<%
		//자동 로그인 여부에 따라 로그인 처리
		Cookie [] cookies=request.getCookies();
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("cid")){
				//DB 조회
				
				//사용자 생성
				String uid= cookie.getValue();
			 	UserDTO user = new UserDTO();
			 	user.setUid(uid);
			 	user.setName("홍길동");   
			 	
			 	//세션 기록
			 	session.setAttribute("sessUser", user);
			 	
			 	//로그인 성공 페이지로 이동
			 	response.sendRedirect("./proc/loginSuccess.jsp");
			 	return;
				}
		}
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.Session</title>
	</head>
	<body>
		<h3>2.세션</h3>
		<form action="./proc/loginProc.jsp" method="post">
			<input type="text" name="uid"><br>
			<input type="text" name="pass"><br>
			<label><input type="checkbox" name="auto" value="1">자동로그인</label>
			<input type="submit" name="로그인"><br>
		</form>
	</body>
</html>