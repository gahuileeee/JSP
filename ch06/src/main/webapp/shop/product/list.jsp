<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	List<ProductDTO> lists = new ArrayList<>();
	try{
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/shop"); //lookup("name")
		Connection conn= ds.getConnection();
		
		// 3단계 : SQL 실행 객체 생성
		String sql="Selelect * from product";
		Statement stmt = conn.createStatement();	
		
		// 4단계 : SQL 실행
		ResultSet rs= stmt.executeQuery(sql);
		
		// 5단계 : 결과처리 (Select 경우)
		while(rs.next()){
			ProductDTO dto = new ProductDTO();
			dto.setProdNo(rs.getString(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setProdNo(rs.getString(5));
		}
		// 6단계 : 데이터베이스 종료(커넥션 반납)
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>product::list</title>
	</head>

	<body>
		<h3>Customer 목록</h3>
		<a href="../../2.DBCP.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>		
		<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>재고량</th>
			<th>가격</th>
			<th>제조사</th>
			<th>관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>새우깡</td>
			<td>5000</td>
			<td>1500</td>
			<td>농심</td>
			<td>
				<a href="./modify.jsp">수정</a>
				<a href="./delete.jsp">삭제</a>
			</td>
		</tr>
		</table>
	</body>
</html>