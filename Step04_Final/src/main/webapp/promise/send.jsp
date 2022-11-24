<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//msg 라는 파라미터명으로 전달되는 문자열을 읽어온다.
	String msg=request.getParameter("msg");
	System.out.println(msg);
%>
{"isSuccess":true}