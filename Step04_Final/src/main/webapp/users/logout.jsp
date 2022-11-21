<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("id");

	//또는 
	session.invalidate(); // 세션 전체 제거, 무효화 session.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	
		
	<script>
		alert("로그아웃 되었습니다.");
		location.href= "${pageContext.request.contextPath}/index.jsp";
	</script>
</body>
</html>