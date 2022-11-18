<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

/*
1. 폼 전송되는 회원의 이름과 주소를 읽어온다. 
2. MemberDao에 MemberDto를 전달하면 DB에 저장을 하고 작업의 성공여부를 리턴하는 insert()메소드를 만든다.
   회원 번호는 시퀀스를 이용해서 들어가도록 한다.
3. 위에서 추출한 회원의 이름과 주소를 MemberDto 객채에 담는다. 
4. MemberDao 객체를 이용해서 MemberDto 객체에 담긴 회원 정보를 DB에 저장한다.
5. 작업의 성공 여부를 클라이언트에게 응답한다. 
*/
	//폼 전송되는 할일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");

	//TodoDto에 담고
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	
	//DB에 저장하고 
	TodoDao dao = TodoDao.getInstance();
	boolean isSuccess = dao.insert(dto);
	
	//응답하기

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<script>
	<%if(isSuccess){%>
		alert("추가완료했습니다");
		location.href="${pageContext.request.contextPath}/todo/list.jsp";
	<%}else{%>
		alert("추가에 실패했습니다. 다시 작성해주세요");
		location.href="${pageContext.request.contextPath}/todo/insertform.jsp";
	<%}%>
	</script>
	
	
</body>
</html>