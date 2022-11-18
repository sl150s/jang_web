<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트의 웹브라우저에 문자열을 출력할수 있는 객체의 참조값 얻어내기
	List<String> names=new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
%>


   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	<%
	//확장 for문을 활용하면
	for(String tmp:names) { 
		%><li><%= tmp%></li><%
	}
	%>
	</ul>
	<ul>
	<%
		for(String tmp:names){
			out.print("<li>"+tmp+"</li>");
		}
	%>
	</ul>
	<ul>
		<%for(String tmp:names){%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	
	
	

</body>
</html>