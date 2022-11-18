<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

TodoDao dao = TodoDao.getInstance();
List<TodoDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>
<body>
	<%--
		/include/navbar.jsp 포함시키기
		
		- 포함된 jsp 페이지에 파라미터를 전달할 수가 있다. 
		- 파라미터를 적절히 전달해서 포함된 jsp 페이지 내에서 해당 파라미터를 추출해서 어떤 로직을 수행할 수 있다.
		- 아래 같은 경우는 thisPage 라는 파라미터 명으로 member라는 문자열을 전달하는 것이다. 
		  그러면 마치 navbar.jsp?thisPage=member 요청한것과 비슷한 효과가 되어서 
		  navber.jsp 페이지 내부에서 
		  String thisPage = request.getParameter("thisPage"); 
		  코드를 수행하면 thisPage 안에는 "todo"이라는 문자열이 들어있게된다. 
	 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>할일 목록</h1>
		<a href="${pageContext.request.contextPath}/todo/insertform.jsp">할일
			추가하기</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>목록</th>
					<th>날짜</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (TodoDto tmp : list) {
				%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getContent()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
					<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>