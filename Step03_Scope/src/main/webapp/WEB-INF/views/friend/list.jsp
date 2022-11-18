<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>친구목록 불러오기</p>
	<ul>
		<%for(int i=0; i<list.size(); i++){
			String tmp = list.get(i);%>
			<li><%= tmp %></li>
		<%}%>
		
		<%for(String tmp:list){ %>
			<li><%= tmp %></li>
		<%} %>
	</ul>
</body>
</html>