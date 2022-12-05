<%@page import="test.coment.Dao.ComentDao"%>
<%@page import="test.coment.Dto.ComentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	//이름과 코멘트 내용을 가져온다.
	String name = request.getParameter("name");
	String coment = request.getParameter("coment");
	
	//dto에 넣기 
	ComentDto dto = new ComentDto();
	dto.setName(name);
	dto.setComent(coment);
	
	boolean isSuccess = ComentDao.getInstance().insert(dto);
	
	//응답하기
	if(isSuccess){
		response.sendRedirect("/Jang_WebService/index.jsp");
	}else{
		response.sendRedirect("/Jang_WebService/index.jsp");
		out.println("<script>alert('다시 작성해주세요');</script>");
	}
	System.out.println(name);
	System.out.println(coment);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/coment/comentform.jsp</title>
</head>
<body>
	
</body>
</html>