<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="coment">
			<h2>코멘트를 남겨주세요.</h2>
			<div>
				<form action="coment.jsp" method="post">
					<label>
						<input type="text" id="name" name="name" placeholder="이름" />
					</label>
					<label>
						<input type="text" id="coment" name="coment" placeholder="코멘트를 입력하세요" />
					</label>
					<button type="submit">확인</button>
				</form>
			</div>
			<ul>
				<li>
					<strong>이름</strong>
					<p>본문</p>
					<span>날짜</span>
				</li>
			</ul>
		</div>
		
	</div>
</body>
</html>