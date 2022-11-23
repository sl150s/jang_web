<%@page import="test.users.Dao.UsersDao"%>
<%@page import="test.users.Dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에서 수정할 회원의 아이디를 읽어온다. 
	String id =(String)session.getAttribute("id");
	//폼 전송되는 구 비밀번호, 새 비밀번호 읽어오기
	String pwd = request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	
	//UsersDto 객체에 위의 3개 정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	
	 /*
	    위의 정보를 이용해서 DB 를 업데이트하는 UsersDao 에 메소드를 만들어 보세요.
	    메소드명은 updatePwd()
	    
	    작업 성공 여부를 리턴 받아서 
	    성공이면 로그아웃 처리를 하고  다시 로그인 하는 링크를 출력하고
	    
	    실패이면  비밀번호가 일치하지 않는다는 메세지를 띄우고 다시 비밀번호 수정폼으로 이동할수 있도록 해 보세요.
	 */
	 boolean isUpdatePwd = UsersDao.getInstance().updatePwd(dto);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<script>
	<%if(isUpdatePwd){
		session.removeAttribute("id"); %>
		alert("비밀번호 수정이 완료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
		location.href="${pageContext.request.contextPath}/users/loginform.jsp"
	<%}else{%>
		alert("구 비밀번호가 일치하지 않습니다.");
		location.href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp"
	<%}; %>
	</script>
	
</body>
</html>