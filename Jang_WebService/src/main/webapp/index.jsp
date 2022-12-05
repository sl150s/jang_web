<%@page import="java.util.List"%>
<%@page import="test.coment.Dao.ComentDao"%>
<%@page import="test.coment.Dto.ComentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	ComentDto dto = new ComentDto();
	dto.getName();
	dto.getComent();
	
	List<ComentDto> list = ComentDao.getInstance().list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	
	<!-- 익명코멘트 / 내가 쓴 코멘트는 지울수 있도록 하기  -->
	<div class="container">
		<div class="coment">
			<h2>코멘트를 남겨주세요.</h2>
			<div>
				<form action="coment/comentform.jsp" method="post">
					<label>
						<input type="text" id="name" name="name" placeholder="이름" />
					</label>
					<label>
						<input type="text" id="coment" name="coment" placeholder="코멘트를 입력하세요" />
					</label>
					<button type="submit">확인</button>
				</form>
			</div>
			<ul>
				<%for(ComentDto tmp:list){ %>
					<li>
						<strong><%=tmp.getName() %></strong>
						<p><%=tmp.getComent() %></p>
						<span><%=tmp.getComentDate() %></span>
					</li>
				<%} %>
				
			</ul>
		</div>
		
	</div>
</body>
</html>