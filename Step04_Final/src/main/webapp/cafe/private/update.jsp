<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 수정할 글의 정보를 얻어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	//CafeDto 객체에 담고
	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	//DB에 수정반영
	boolean isSuccess = CafeDao.getInstance().update(dto);
	//응답하기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess) {%>
		<p>수정완료되었습니다.</p>
		<a href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=num%>">글 자세히보기 </a>
	<%}else{ %>
		<p>수정에 실패했습니다</p>
		<a href="updateform.jsp?num=<%=dto.getNum()%>">수정하기</a>
	<%} %>
</body>
</html>




