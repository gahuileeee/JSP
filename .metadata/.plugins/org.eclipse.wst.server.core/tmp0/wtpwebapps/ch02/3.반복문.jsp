<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.반복문</title>
	</head>
	<body>
		<h4>3. 반목문</h4>
		<h4>for</h4>
		<% for (int i=1; i<11; i++){
			out.print("<p> i "+i+"</p>");
		}
		%>
		
		<%for (int k=1; k<=5; k++){ %>
			<p>k : <%=k %></p>
		<%} %>
		<h4>while</h4>
		<%
			int j=1;
			while(j<=5){
		%>
			<p> j : <%=j %></p>
		<%
			j++; }
		%>
		<h4>구구단</h4>
		<table border="1">
			<% for(int x=1; x<=9; x++){ %>
			<tr>
				<% for(int y=1; y<=9; y++){ %>
				<td><%=y %>x<%=x %>=<%=x*y %></td>
				<%} %>
			</tr>
			<%} %>
		</table>
	</body>
</html>