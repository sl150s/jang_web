<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와본다.
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후 인덱스 페이지로 갈 수 있도록 한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<!-- 로그인 성공 후 어디로 갈지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록한다. -->
			<input type="hidden" name="url" value="<%=url%>"/>
			<div>
				<label for="form-label" for="id">아이디</label>
				<input type="text" class="form-control" name="id" id="id"/>
			</div>
			<div>
				<label for="form-label">비밀번호</label>
				<input type="text" class="form-control" name="pwd" id="pwd"/>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
</body>
</html>