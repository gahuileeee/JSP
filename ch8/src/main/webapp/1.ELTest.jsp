<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.ELTest</title>
	</head>
	<body>
		<%
			int num1= 1;
			int num2 =2;
			
			String str1= "hello";
			String str2= "welcome";
			String str3="";
			String str4=null;
			
			//내장 객체를 이용해서 값을 넣어줘야 표현언어에서 쓸 수 있음
			//=표현언어로 출력하기 위해 내장 객체 스코프 저장
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			session.setAttribute("num1", "100");
			application.setAttribute("str2", str2);
			request.setAttribute("str3", str3);
			request.setAttribute("str4", str4);
		%>
		<h4>표현식</h4>
		<p>
			num1 : <%= num1 %><br>
			num2 : <%= num2 %><br>
			str1 : <%= str1 %><br>
			str2 : <%= str2 %><br>
		
		</p>
		
		<h4>표현언어</h4>
		<p>
			num1 : ${num1}<br>
			num2 : ${num2}<br>
			str1 : ${str1}<br>
			str2 : ${str2}<br>
		</p>
		
		<h4>표현언어 내장객체</h4>
		<p>
			<!-- 보다 정확한 참조 대게 생략하지만
				key값이 같아 구별이 필요한 경우엔 적어준다.
			-->
			num1 : ${pageScope.num1}<br>
			num1 : ${sessionScope.num1}<br>
			num2 : ${requestScope.num2}<br>
			str1 : ${sessionScope.str1}<br>
			str2 : ${applicationScope.str2}<br>
		</p>
		
		<h4>표현언어 연산자</h4>
		<p>
			num1+num2 =${num1+num2 }<br>
			num1 - num2 =${num1-num2 }<br>
			num1*num2 =${num1*num2 }<br>
			num1num2 = ${num1/num2 }<br>
			num1%num2 =${num1%num2 }<br><br>
			
			num1 > num2 =${num1>num2 }<br>
			num1 < num2 =${num1<num2 }<br>
			num1 >= num2 =${num1>=num2 }<br>
			num1 <= num2 =${num1<=num2 }<br>
			num1 == num2 =${num1==num2 }<br>
			num1 != num2 =${num1!=num2 }<br><br>
			
			num1 gt num2 = ${num1 gt num2 }<br> <!-- greater than -->
			num1 lt num2 = ${num1 lt num2 }<br> <!-- less than -->
			num1 ge num2 = ${num1 ge num2 }<br> <!-- >= -->
			num1 eq num2 = ${num1 eq num2 }<br> <!-- equal-->
			num1 ne num2 = ${num1 ne num2 }<br><br> <!-- non equal -->
			
			<!-- null, 빈 문자 다 empty true -->
			empty str1 = ${empty str1} <br>
			empty str2 = ${empty str2}<br>
			empty str3 = ${empty str3}<br>
			empty str4 = ${empty str4}<br>
			str1 eq "hello" = ${str1 eq "hello" }<br>
		</p>
	</body>
</html>