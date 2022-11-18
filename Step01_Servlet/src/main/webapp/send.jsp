<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String msg_th = request.getParameter("msg_th");
	
	System.out.println("msg_th:"+msg_th);
%>
	<p>msg_th:<%=msg_th %></p>
	<p>메세지가 잘 전달되었습니다.</p>
</body>
</html>