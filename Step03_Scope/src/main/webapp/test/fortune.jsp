<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request scope에 "fortuneTody"라는 키 값으로 저장된 값을 읽어와서
	// 원래 type으로 cating해서 변수에 대입하기
	String foruneToday = (String)request.getAttribute("fortuneToday");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<p>오늘의 운세 : <strong><%=foruneToday %></strong></p>
</body>
</html>