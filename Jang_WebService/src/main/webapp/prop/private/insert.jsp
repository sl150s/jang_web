<%@page import="test.prop.Dao.PropoDao"%>
<%@page import="test.prop.Dto.PropoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송된 값들을 db에 저장 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String)session.getAttribute("id");
	//db에 저장후 dto 객체에 담고 
	PropoDto dto = new PropoDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	
	boolean isSuccess=PropoDao.getInstance().insert(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/prop/private/insert.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("게시글이 등록 되었습니다.");
			location.href="${pageContext.request.contextPath}/prop/board.jsp";
		<%}else{ %>
			alert("게시글 등록에 실패했습니다. 다시 등록해주세요.");
			location.href="${pageContext.request.contextPath}/prop/private/insertform.jsp";
		<%} %>
	</script>
	
</body>
</html>