<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 id라는 키값으로 저장된 값이 있는지 읽어와 본다(없으면 null)
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
   <div class="container">
      <h1>인덱스 페이지 입니다.</h1>
      <%if(id!=null){ %>
      	<p>
	      	<strong><%=id %>님 환영합니다.</strong>
	      	<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      	</p>
      <%}else{%>
      	<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
      <%} %>
      <ul>
         <li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
      </ul>
   </div>
</body>
</html>