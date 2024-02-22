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
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	int result=0;
	try{
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); //lookup("name")
		Connection conn= ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("Update `user1` set `name`=?, `birth`=?, `hp`=?, `age`=? where `uid`=? ");
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		psmt.setString(5, uid);
		
		result = psmt.executeUpdate();
		
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