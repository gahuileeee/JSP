<%@page import="javax.swing.text.Document"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!-- prefix는 접두어로 주로 c를 씀 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.JSTLTest</title>
	</head>
	<body>
		<h3>2.JSTL 실습</h3>
		<h4>JSTL</h4>
		
		<!-- 변수 선언 -->
		<c:set var="str" value="hello"/>
		<p>str : ${str }</p>
		
		<c:set var="num1" value="1"/>
		<c:set var="num2" value="2"/>
		<c:set var="num3" value="3"/>
		
		<!-- 조건문 -->
		<c:if test="${num1 lt num2 }">
			<p>num1은 num2보다 작다.</p>
		</c:if>
		
		<!-- else tag가 없음 -->
		<c:choose>
			<c:when test="${num1 gt num2 }">
				<p>num1은 num2보다 크다.</p>
			</c:when>
			<c:otherwise>
				<p>num1은 num2보다 작다.</p>
			</c:otherwise>
		</c:choose>
		
		<!-- 반복문 -->
		<c:forEach var="i" begin="1" end="5"> <!-- var는 반복 변수 -->
			<p>i : ${i }</p>
		</c:forEach>
		
		<!--1부터 10까지의 합 -->
		<c:set var="sum" value="0"/>
		<c:forEach var="k" begin="1" end="10">
			<c:set var="sum" value="${sum+k }"/> 
		</c:forEach>
		<p>1부터  10까지 합: ${sum }</p>
		
		<!-- 배열 -->
		<c:set var="persons">김유신, 김춘추, 장보고, 강감찬, 이순신</c:set>
		<c:forEach var="person" items="${persons}">
			<p>person : ${person}</p>
		</c:forEach>
		
		<!-- 문자열 함수 -->
		<c:set var="hello" value="hello world"/>
		<p>문자열 길이 : ${f:length(hello)}</p>
		<p>문자열 자르기 : ${f:substring(hello,6,11)}</p>
		<p>문자열 교체 : ${f:replace(hello,"world","korea")}</p>
		<p>문자열 인덱스 : ${f:indexOf(hello,"e")}</p>
	</body>
</html>