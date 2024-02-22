<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//Gmail SMTP server setting
	Properties props = new Properties();
	//프로퍼티스는 문자열 키 벨류로 이뤄진 구조체
	props.put("mail.smtp.host","smtp.gmail.com");
	props.put("mail.smtp.port","465");
	props.put("mail.smtp.auth","true");
	props.put("mail.smtp.ssl.enable","true");
	props.put("mail.smtp.ssl.trust","smtp.gmail.com");
	
	//Gmail STMP session create
	String password ="bwyj apiz cjng yltd";
	
	//mail.session
	// 여기서 sender가 앱 비밀번호 설정한 메일과 일치해야 인증이 됨
	Session gmailSession = Session.getInstance(props,new Authenticator(){
		
		@Override
		protected PasswordAuthentication getPasswordAuthentication(){
			//return new PasswordAuthentication(sender, "앱비밀번호");
			return new PasswordAuthentication(sender, password);
		}
	});
	
	//메세지 객체 생성
	Message message = new MimeMessage(gmailSession);
	
//	message.setFrom(new InternetAddress(sender, "보내는 사람","utf-8"));
	message.setFrom(new InternetAddress(sender, sender,"utf-8"));
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); //받는 사람
	message.setSubject(title); //제목설정
	message.setContent(content, "text/html;charset=UTF-8");
	
	//메일 발송
	Transport.send(message); 
	
	response.sendRedirect("../3.sendMailTest.jsp");
%>