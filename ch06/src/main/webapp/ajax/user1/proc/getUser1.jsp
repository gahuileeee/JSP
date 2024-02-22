<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.User1DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<% 
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	User1DTO user = null;
	try {
		// 1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		// 2단계 - 커넥션풀 객체 생성 후 접속객체 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User1` where `uid` =?");
		psmt.setString(1, uid);
	
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			user = new User1DTO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setBirth(rs.getString(3));
			user.setHp(rs.getString(4));
			user.setAge(rs.getInt(5));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		

	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
		Gson gson = new Gson();
		String strJson = gson.toJson(user);	
		out.print(strJson);	
%>