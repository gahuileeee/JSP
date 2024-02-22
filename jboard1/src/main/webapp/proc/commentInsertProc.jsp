<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String content =request.getParameter("content");
	String parent = request.getParameter("parent");
	String writer = request.getParameter("writer");
	
	//댓글 등록 및 부모 튜플의 comment 값을 1 증가시키기
	ArticleDAO dao = ArticleDAO.getInstance();
	
	ArticleDTO comment = new ArticleDTO();
	comment.setContent(content);
	comment.setParent(parent);
	comment.setWriter(writer);
	comment.setRegip(request.getRemoteAddr());
	
	dao.insertComment(comment);
	
	response.sendRedirect("/jboard1/view.jsp?no="+parent);
%>