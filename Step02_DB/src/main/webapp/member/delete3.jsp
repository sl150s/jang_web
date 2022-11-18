<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다. 
	int num = Integer.parseInt(request.getParameter("num"));

	//1. 회원 한명의 정보를 삭제하기(몇번 회원을 삭제하지?)
	MemberDao dao = MemberDao.getInstance();
	boolean delete = dao.delete(num);
	
	/*
	요청을 한 클라이언트의 웹브라우저에게 새로운 경로로 요청을 다시하라고 강요하는 응답을 
	HttpSercletResponse객체(response.sendRedirect(location))를 이용해서 할 수 있다. 
	이것이 바로 리다일렉트 응답니다.
	리다일렉트 응답은 "새로운 경로로 요청을 다시 하라고 강요"하는 응답이다. 
	이것 자체가 응답이기 때문에 아래의 html 형식의 문자열은 의미가 없다(지워도된다.)
	*/



	//java code 영역에서 context path는 HttpSevletRequest 객체의 메소드를 이용해서 얻어내야한다.
	String cPath = request.getContextPath(); // /Step02_DB/와 같은 context를 리턴한다.
	response.sendRedirect(cPath+"member/list.jsp");
	
	//el경로는 java코드 영역이 아닌 바깥 영역에서 의미가 있는 것이지 el경로는 java영역에서 단순히 문자열임
	
	
%>

${pageContext.request.contextPath}