<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   =request.getParameter("uid");
	String name  =request.getParameter("name");
	String birth =request.getParameter("birth");
	String addr    =request.getParameter("addr");

	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";

	try{
		//1단계 : JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계 : 데이터베이스 접속
		Connection conn= DriverManager.getConnection(host,user,pass);
		
		//3단계 : SQL 실행 객체 생성
		String sql="Update `user2` set `uid`=?, `name`=?,`birth`=?, `addr`=? where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, birth);
		psmt.setString(4, addr);
		psmt.setString(5, uid);
		
		//4단계 : SQL 실행
		psmt.executeUpdate();
		
		//5단계 : 결과 처리(Select 경우)
		
		//6단계 : DB 종료
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("./list.jsp");
%>