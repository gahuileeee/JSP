<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="dto.User1DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	int result = 0;
	try{
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); //lookup("name")
		Connection conn= ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("delete from `user1` where `uid`=?");
		psmt.setString(1, uid);
		
		result = psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);
%>