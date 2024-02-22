<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.awt.image.DataBufferDouble"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch7.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fNo = request.getParameter("fno");
	FileDTO dto = null;
	try{
		Context initCtx = new InitialContext();  
		Context ctx=(Context) initCtx.lookup("java:comp/env"); 
		DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); 
		Connection conn= ds.getConnection();
		Statement stmt= conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from `filetest` where fno="+fNo);

		if(rs.next()){
			dto = new FileDTO();
			dto.setFno(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setoName(rs.getString(3));
			dto.setsName(rs.getString(4));
			dto.setRdate(rs.getString(5));
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//	다운로드 헤더 설정 
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(dto.getoName() , "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 파일 스트림 작업
	String uploadsPath =application.getRealPath("/uploads");
	File file = new File( uploadsPath+File.separator+dto.getsName());
	//여기서 File.separator는 /와 같은 역할. 형식에 따라 // 이렇게도 될 수 있어서.
	
	out.clear(); //출력 객체 초기화
	out = pageContext.pushBody();
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		int data = bis.read();
		if( data ==-1){
			break;
		}
		bos.write(data);
	}
	bos.close();
	bis.close();
	%>