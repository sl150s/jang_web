<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
</head>
<body>

	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image gradient-custom" style="height: 300px;"></div>
		<!-- Background image -->

		<div class="card mx-4 mx-md-5 shadow-5-strong"
			style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">회원가입</h2>
						<form action="signup.jsp" method="post">
							<!-- id input -->
							<div class="form-outline mb-4">
								<input type="text" id="id" name="id" class="form-control"
									placeholder="아이디" /> <label class="form-label sr-only"
									for="id">아이디</label>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" id="pwd" name="pwd" class="form-control"
									placeholder="비밀번호" /> <label class="form-label sr-only"
									for="pwd">비밀번호</label>
							</div>

							<!-- Email input -->
							<div class="form-outline mb-4">
								<input type="email" id="email" name="email" class="form-control"
									placeholder="이메일" /> <label class="form-label sr-only"
									for="email">이메일</label>
							</div>
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">
								회원가입 하기</button>

							<!-- Register buttons / sns 아이콘-->
							<!-- <div class="text-center">
								<p>or sign up with:</p>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-facebook-f"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-google"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-twitter"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-github"></i>
								</button>
							</div> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section: Design Block -->

	<!-- 원본  
	<div class="container">
      <h3>회원 가입 폼 입니다.</h3>
      <form action="signup.jsp" method="post">
         <div>
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
         </div>
         <div>
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
         </div>
         <div>
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
         </div>
         <button class="btn btn-outline-primary" type="submit">가입</button>
      </form>
   </div> -->
</body>
</html>