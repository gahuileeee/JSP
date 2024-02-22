<%@page import="com.google.gson.JsonObject"%>
<%@page import="dto.User1DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line=reader.readLine())!=null){
		requestBody.append(line);
	}
	reader.close();
	
	//Json 파싱
	Gson gson = new Gson();
	User1DTO user1 = gson.fromJson(requestBody.toString(), User1DTO.class);
	// 문자열, 원하는 class 선언

	int result=0;
	//DB 처리
	try{
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); //lookup("name")
		Connection conn= ds.getConnection();
		
		String sql="Insert into `user1` values(?,?,?,?,?)";
		PreparedStatement psmt= conn.prepareStatement(sql);
		psmt.setString(1, user1.getUid());			
		psmt.setString(2, user1.getName());			
		psmt.setString(3, user1.getBirth());			
		psmt.setString(4, user1.getHp());	
		psmt.setInt(5, user1.getAge());	
		
		 result = psmt.executeUpdate(); 
		 //몇 개 등록되었는지(row count) return// 하나도 insert되지 않으면 0을 return
			
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	//JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
	
%>