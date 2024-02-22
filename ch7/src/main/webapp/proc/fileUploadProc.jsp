<%@page import="ch7.FileDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // 파일업로드 디렉터리 경로 설정 (내장 객체 application사용해서 잡기)
    // application 사용 안 할거면, 실제 server에 서 구동되는 .metadata ...... 잡아야 함.
    String uploadsPath = application.getRealPath("/uploads");

    // 파일업로드 처리 객체 생성
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    
    // 인코딩 설정
    upload.setHeaderEncoding("utf-8");
    
    // 최대 파일크기 설정
    upload.setSizeMax(1024 * 1024 * 10); //10MB\
    
    // 파일 객체 생성
    FileDTO fileDTO = new FileDTO();
    
    try{
    // 파일 업로드 스트림 작업
    List<FileItem> items = upload.parseRequest(request);
    Iterator<FileItem> iter = items.iterator();
    
    while(iter.hasNext()){
        FileItem item = iter.next();
        
        if(!item.isFormField()){
            //확장자 추출
            String fileName = item.getName(); //original file name
            int idx = fileName.lastIndexOf(".");
            String ext = fileName.substring(idx);
            
            //중복될 수 없는 파일명 생성 
            String savedFileName =UUID.randomUUID().toString()+ext; //save name
	        
            fileDTO.setoName(fileName);
            fileDTO.setsName(savedFileName);
            
            //파일쓰기
        	File uploadedFile  = new File(uploadsPath + "/" +savedFileName);
        	item.write(uploadedFile);
        	
            System.out.println("File upload!");
            
        }else{
            //일반 데이터 처리
            String fieldName = item.getFieldName();
            String value = item.getString("utf-8"); 
            //getString = getParameter

            System.out.println(fieldName+ " : "+value);
            if(fieldName.equals("title")){
            	fileDTO.setTitle(value);
            }
        }

    }
    try{
//    	DB처리
        Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/studydb"); //lookup("name")
		Connection conn= ds.getConnection();
		
		PreparedStatement psmt= conn.prepareStatement("insert into `filetest`( `title`, `oname`, `sname`, `rdate`) values (?,?,?,now())");
		
		psmt.setString(1, fileDTO.getTitle());
		psmt.setString(2, fileDTO.getoName());
		psmt.setString(3, fileDTO.getsName());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
    }catch(Exception e){
    	e.printStackTrace();
    }
    }catch(Exception e){
    	e.printStackTrace();
    }
    
    response.sendRedirect("../2.fileDownloadTest.jsp");
%>