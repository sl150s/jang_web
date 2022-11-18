<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다. 
	int num = Integer.parseInt(request.getParameter("num"));

	//1. 회원 한명의 정보를 삭제하기(몇번 회원을 삭제하지?)
	MemberDao dao = MemberDao.getInstance();
	boolean delete = dao.delete(num);

	//2. 응답하기(무슨 응답을 하면 적절할까?)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
	<!-- 응답 첫번째  -->
	<p>
		<strong><%=num %>번 회원을 삭제 했습니다.</strong>
		<a href="list.jsp">확인</a>
	</p>
</body>
</html>