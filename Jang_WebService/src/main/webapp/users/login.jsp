<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.Dto.UsersDto"%>
<%@page import="test.users.Dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//파라미터를 하나라도 추출하기 전에 인코딩을 먼저 해줘야한다.(그래야 한글이 깨지지않음)
	//request.setCharacterEncoding("utf-8");
	//로그인 후 가야할 목적지 정보
	String url=request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
	//(로그인 폼jsp로 이동했다가 로그인을 완료하면 목적지로 가기위해, 목적지 경로를 저장해둔다)
	String encodeUrl=URLEncoder.encode(url);
	
	//1. 폼 전송되는 아이디, 비밀번호 읽어오기
	String id= request.getParameter("id");
	String pwd= request.getParameter("pwd");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);

	//2. DB에 실제로 존재하는 맞는 정보인지 확인한다.(맞는 정보이면 로그인 처리도 한다.)
	boolean isValid = UsersDao.getInstance().isValid(dto);
	if(isValid){
		//session scope에 id라는 키값으로 로그인된 아이디 담기
		session.setAttribute("id",id);
	}
	
	
	//3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<jsp:include page="/include/boot.jsp"></jsp:include>
<body>
   <div class="container">
      <%if(isValid) {%>
         <p class="alert alert-success">
            <strong><%=dto.getId() %></strong> 님 로그인되었습니다.
            <a href=<%=url %>>확인</a>
         </p>
      <%}else{ %>
         <p class="alert alert-danger">
            아이디 혹은 비밀번호가 틀립니다.
            <a href="${pageContext.request.contextPath}/users/loginform.jsp?url=<%=encodeUrl%>">다시 로그인 하기</a>            
         </p>
      <%} %>
   </div>
</body>

</html>