<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<%
	//삭제할 게시글의 번호를 받아오기 
	int num = Integer.parseInt(request.getParameter("num"));

	//글의 작성자가 로그인된 아이디와 같은지 확인해보기
	String id = (String)session.getAttribute("id"); //로그인된 아이디
	String writer=CafeDao.getInstance().getDate(num).getWriter(); // 게시글 작성자
	//글 작성자가 로그인된 아이디와 다르면
	if(!id.equals(writer)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"남의 글 삭제하기 없기!");
		return;//메소드를 여기서 끝내기
	}
		
	//DB 삭제 반영 
	boolean isSuccess = CafeDao.getInstance().delete(num);

	String cpath = request.getContextPath();
	response.sendRedirect(cpath+"/cafe/list.jsp");
%>
