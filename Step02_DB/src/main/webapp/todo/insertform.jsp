<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<div class="cotainer">
		<h1>할일목록 추가하기</h1>
		<form action="${pageContext.request.contextPath}/todo/insert.jsp" method="get">
			
			<div>
				<label for="content">할일목록</label>
				<input type="text" id="content" name="content" />
			</div>
			<button type="submit">추가하기</button>
			<button type="reset">취소</button>
		</form>
		
	</div>
</body>
</html>