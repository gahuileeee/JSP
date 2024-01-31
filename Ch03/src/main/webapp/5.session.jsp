<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5.session</title>
	</head>
	<body>
		<h3>5.session 내장객체 실습</h3>
		
		<h4>session id 확인</h4>
		<%= session.getId() %>
		<h4>session 설정</h4>
		<%
		String agent = request.getHeader("User-Agent");
		if(agent.contains("Edg")){ UserDTO user = new UserDTO("a101","김유신","010-1234-5678",23);
		//session 값 설정
		session.setAttribute("user", user);	
		}else{
			UserDTO user = new UserDTO("a102","김춘추","010-1234-5677",21);
			//session 값 설정
			session.setAttribute("user", user);
		}
		// session 값 반환
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		%>
		<p>
		  아이디: <%= userDTO.getUid() %>
		  이름: <%= userDTO.getName() %>
		  나이: <%= userDTO.getAge() %>
		  주소: <%= userDTO.getHp() %>
		</p>
	</body>
</html>