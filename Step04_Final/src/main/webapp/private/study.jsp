<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디가 있는지 확인해서 
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<h1>게임 페이지입니다.</h1>
	<p><%=id %>님 열심히 게임해요!</p>
</body>
</html>