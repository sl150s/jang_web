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
	
		String msg_fo = request.getParameter("msg_fo");
		System.out.println("msg_fo:"+msg_fo);
	%>
	<p>msg_fo:<%=msg_fo %></p>
	<p>메세지가 잘 전달되었습니다.</p>
</body>
</html>