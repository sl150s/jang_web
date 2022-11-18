<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//1. GET 방식 파라ㅣ터로 전달되는 수정할 회원의 번호(primary key)를 읽어온다.
int num = Integer.parseInt(request.getParameter("num"));
//2. MemberDao 객체를 이용해서 회원 한명의 정보를 얻어온다.
MemberDto dto = MemberDao.getInstance().getData(num);
//3. 수정할 회원의 정보를 수정폼에 출력해서 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 폼</h1>
		<!-- breadcrumb(사이트맵) : 사용자가 길을 잃지 않도록 navigation 정보 제공  -->
		<nav class="mt-2">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
				</li>
				<li class="breadcrumb-item active">회원 추가 페이지</li>
			</ol>
		</nav>
		<form action="update.jsp" method="post">
			<!-- 
				disabled 된 input 요소는 폼을 제출했을 때 전송이 안되기 때문에
				input type="hidden" 요소를 이용해서 회원의 번호가 폼을 제출했을 때 전송되도록 한다.	
			 -->
			<input type="hidden" name="num" value="<%=dto.getNum()%>" />
			<div>
				<label for="num" class="from-label mb-1">번호</label> 
				<input type="text" id="num"
					value="<%=dto.getNum()%>" class="form-control" disabled />
			</div>
			<div class="mt-2">
				<label for="name" class="from-label mb-1">이름</label> 
				<input type="text" name="name"
					id="name" value="<%=dto.getName()%>" class="form-control"/>
			</div>
			<div class="mt-2">
				<label for="addr" class="from-label mb-1">주소</label> 
				<input type="text" name="addr"
					id="addr" value="<%=dto.getAddr()%>" class="form-control"/>
			</div>
			<div class=" mt-3">
				<button type="submit" class="btn btn-dark">수정확인</button>
				<button type="reset" class="btn btn-dark">취소</button>
			</div>
			
		</form>
	</div>
</body>
</html>