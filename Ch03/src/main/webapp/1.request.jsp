<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.request</title>
	</head>
	<body>
		<h3>1. reuqest 내장 객체</h3>
		
		<h4>Get 방식</h4>
		<form action="./proc/resultGet.jsp" method="get">
			<input type="text" name="uid"> <br>
			<input type="text" name="name"> <br>
			<input type="number" name="age"> <br>
			<input type="submit" > <br>
		</form>
		
		<h4>Post 방식</h4>
		<form action="./proc/resultPost.jsp" method="post">
			<table border="1">
				<tr>
				<td>아이디</td>
				<td> <input type="text" name="uid"></td>
				</tr>
				<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="pass"></td>
				</tr>
				<tr>
				<td>이름</td>
				<td> <input type="text" name="name"></td>
				</tr>
				<tr>
				<td>생년월일</td>
				<td> <input type="date" name="birth"></td>
				</tr>
				<tr>
				<td>성별</td>
				<td> 
				<label><input type="radio" name="gender" value="M">남</label>
				<label><input type="radio" name="gender" value="F">여</label>
				</tr>
				<tr>
				<td>주소</td>
				<td>
				 <select name="addr">
				 	<option>서울</option>
				 	<option>대전</option>
				 	<option>대구</option>
				 	<option>부산</option>
				 </td>
				</tr>
				<tr>
				<td>취미</td>
				<td>
				<label><input type="checkbox" name="hobby" value="등산">등산</label>
				<label><input type="checkbox" name="hobby" value="여행">여행</label>
				<label><input type="checkbox" name="hobby" value="독서">독서</label>
				<label><input type="checkbox" name="hobby" value="영화">영화</label>
				<label><input type="checkbox" name="hobby" value="운동">운동</label>
				</td>
				</tr>
				<tr>
				<td colspan="2" align="right">
					<input type="submit" value="전송">
									</td>
				</tr>
			</table>
		</form>
		
		<h4>request 기타</h4>
		<p>
			헤더정보#1 : <%= request.getHeader("User-Agent") %> <br>
			헤더정보#2 : <%= request.getHeader("refere") %> <br>
			헤더정보#3 : <%= request.getHeader("cookie") %> <br>
			프로토콜 : <%= request.getProtocol() %> <br>
			서버이름 : <%= request.getServerName() %> <br>
			요청주소 : <%= request.getRequestURL() %> <br>
			요청경로 : <%= request.getRequestURI() %> <br>
			IP 주소 : <%= request.getRemoteAddr() %> <br>
		</p>
	</body>
</html>