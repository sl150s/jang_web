<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와본다.
String url = request.getParameter("url");
//만일 넘어오는 값이 없다면
if (url == null) {
	//로그인 후 인덱스 페이지로 갈 수 있도록 한다.
	String cPath = request.getContextPath();
	url = cPath + "/index.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">

								<h2 class="fw-bold mb-2 text-uppercase">LOGIN</h2>
								<p class="text-white-50 mb-5">아이디와 비밀번호를 입력해주세요.</p>
								<form action="login.jsp" method="post">
									<!-- 로그인 성공 후 어디로 갈지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록한다. -->
									<input type="hidden" name="url" value="<%=url%>" />
									<div class="form-outline form-white mb-4">
										<input type="text" id="id" name="id"
											class="form-control form-control-lg" placeholder="아이디" /> <label
											class="form-label sr-only" for="id">아이디</label>
									</div>

									<div class="form-outline form-white mb-4">
										<input type="password" id="pwd" name="pwd"
											class="form-control form-control-lg" placeholder="비밀번호" /> <label
											class="form-label sr-only" for="pwd">비밀번호</label>
									</div>
									<button class="btn btn-outline-light btn-lg px-5" type="submit">로그인</button>
								</form>
							</div>
							<div>
								<p class="mb-0">
									회원가입이 필요하세요? <a href="${pageContext.request.contextPath}/users/signup_form.jsp" class="text-white-50 fw-bold">회원가입</a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<!-- 로그인 성공 후 어디로 갈지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록한다. //
			<input type="hidden" name="url" value="<%=url%>" />
			<div>
				<label for="form-label" for="id">아이디</label> <input type="text"
					class="form-control" name="id" id="id" />
			</div>
			<div>
				<label for="form-label">비밀번호</label> <input type="text"
					class="form-control" name="pwd" id="pwd" />
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>  -->
</body>
</html>