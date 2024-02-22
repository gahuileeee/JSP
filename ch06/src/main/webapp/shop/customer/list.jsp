<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	try{
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/shop"); //lookup("name")
		Connection conn= ds.getConnection();
		
		// 3단계 : SQL 실행 객체 생성
		String sql="Selelect * from product";
		PreparedStatement psmt= conn.prepareStatement(sql);
		psmt.setString(1, custId);			
		psmt.setString(2, name);			
		psmt.setString(3, hp);			
		psmt.setString(4, addr);	
		
		// 4단계 : SQL 실행
		psmt.executeUpdate();
		
		// 5단계 : 결과처리 (Select 경우)
			
		// 6단계 : 데이터베이스 종료(커넥션 반납)
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>customer::list</title>
	</head>

	<body>
		<h3>Customer 목록</h3>
		<a href="../../2.DBCP.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>		
		<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		<tr>
			<td>a101</td>
			<td>홍길동</td>
			<td>010-1234-5678</td>
			<td>부산</td>
			<td>2024-02-02</td>
			<td>
				<a href="./modify.jsp">수정</a>
				<a href="./delete.jsp">삭제</a>
			</td>
		</tr>
		</table>
	</body>
</html>