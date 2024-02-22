<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::register</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
	</head>
	<body>
		<h3>user5 등록</h3>
		
		<a href="/ch10/index.jsp">처음으로</a>
		<a href="/ch10/user5/list.do">목록보기</a>
		<form action="/ch10/user5/register.do" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${user.name }"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="${user.gender}"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="${user.age}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="${user.addr }"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>