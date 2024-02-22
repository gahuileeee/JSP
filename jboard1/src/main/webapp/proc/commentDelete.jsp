<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArticleDAO dao = ArticleDAO.getInstance();
	request.setCharacterEncoding("utf-8");
	String parent= request.getParameter("parent");
	String no= request.getParameter("no");
	dao.deleteComment(parent, no);

	response.sendRedirect("/jboard1/view.jsp?no="+parent);
%>