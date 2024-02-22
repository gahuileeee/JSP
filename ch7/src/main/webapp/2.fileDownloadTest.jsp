<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch7.FileDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%    
Context initCtx = new InitialContext();  
Context ctx=(Context) initCtx.lookup("java:comp/env"); 
DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); 
Connection conn= ds.getConnection();
List<FileDTO> files = new ArrayList<FileDTO>();

Statement stmt= conn.createStatement();
ResultSet rs= stmt.executeQuery("select * from `filetest`");

while(rs.next()){
	FileDTO dto = new FileDTO();
	dto.setFno(rs.getInt(1));
	dto.setTitle(rs.getString(2));
	dto.setoName(rs.getString(3));
	dto.setsName(rs.getString(4));
	dto.setRdate(rs.getString(5));
	files.add(dto);
}
rs.close();
stmt.close();
conn.close();
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.파일 다운로드</title>
	</head>
	<body>
		<h3>2. 파일다운로드</h3>
		
		<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>날짜</th>
			<th>관리</th>
		</tr>
		<%for(FileDTO file : files) {%>
		<tr>
			<td><%=file.getFno() %></td>
			<td><%=file.getTitle() %></td>
			<td><%=file.getoName() %></td>
			<td><%=file.getsName() %></td>
			<td><%=file.getRdate().substring(2,10) %></td>
			<td>
			<a href="./proc/fileDownloadProc.jsp?fno=<%= file.getFno()%>">다운로드</a>
			</td>
		</tr>
		<%} %>
		</table>
	</body>
</html>