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
						<form action="signup.jsp" method="post" id="signupForm">
							<!-- id input -->
							<div class="form-outline mb-4 form-list">
								<input type="text" id="id" name="id" class="form-control"
									placeholder="아이디" /> <label class="form-label sr-only"
									for="id">아이디</label>
								<div class="valid-feedback">사용할 수 있습니다.</div>
								<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4 form-list">
								<input type="password" id="pwd" name="pwd" class="form-control"
									placeholder="비밀번호" /> <label class="form-label sr-only"
									for="pwd">비밀번호</label>
								<div class="invalid-feedback">비밀번호를 확인하세요</div>
							</div>

							<div class="form-outline mb-4 form-list">
								<input type="password" id="pwd2" name="pwd2"
									class="form-control" placeholder="비밀번호 확인" /> <label
									class="form-label sr-only" for="pwd2">비밀번호 확인</label>
							</div>

							<!-- Email input -->
							<div class="form-outline mb-4 form-list">
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
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		//유효성 여부를 저장할 변수를 만들고 초기값 대입 - 값을 다르게 넣을 수 있기 때문에 변수 let을 쓴다
		let isIdValid=false;
		let isPwdValid=false;
		let isEmailValid=false;
		
		//아래의 코드를 jQuery를 홀용한 구조로 변경해보세요
		
		//id가 email인 요소에 input 이벤트가 일어 났을 때 실행할 함수 등록
		$("#email").on("input",function(){
			//두개의 클래스 제거하기 
			$(this).removeClass("is-valid is-invalid"); 
			//입력한 이메일
			const inputEmail = $(this).val();
			//이메일을 검증할 정규 표현식  
			const reg = /@/; //골뱅이가 포함되어있는지 
			if(!reg.test(inputEmail)){
				$(this).addClass("is-inval");
				isEmailValid=fasle;
			}else{
				$(this).addClass("is-valid");
				isEmailValid=true;
			}
		});


		function checkPwd() {
			//먼저 2개의 클래스를 제거하고 
			$("#pwd").removeClass("is-valid is-invalid");

			//입력한 두 개의 비밀번호를 읽어와서
			const pwd = $("#pwd").val;
			const pwd2 = $("#pwd2").val;
			

			//만일 비밀번호 입력란과 확인란이 다르다면
			if (pwd != pwd2) {
				$("#pwd").addClass("is-invalid");
				isPwdValid=fasle;
			} else {//같다면 
				$("#pwd").addClass("is-valid");
				isPwdValid=true;
			}
		}
		
		//비밀번호를 입력할때마다 호출되는 함수 등록(다중 선택도 할 수 있다.)
		$("#pwd, #pwd2").on("input",function(){
			checkPwd();
		});
		
		//id를 입력할때마다 호출되는 함수 등록 
		$("#id").on("input",function(){
			const self = this;
			//두개의 클래스 제거하기 
			$(this).removeClass("is-valid is-invalid"); 
			//1. 입력한 아이디를 읽어와서 
			const inputId = $(self).val();
			
			//2. 서버에 페이지 전환없이 전송을하고 응답을 받는다. 
			$.ajax({
				url:"checkid.jsp?inputId=" + inputId,
				success:function(data){ //해당 요청이 성공했을 때 사용되는 콜백함수 
					//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
					console.log(data);
					if (data.isExist) {
						$(self).addClass("is-invalid");
						isIdValid=fasle;
					} else {
						$(self).addClass("is-valid");
						isIdValid=true;

					}
				}
			}) ;//jquery에서의 $는 함수이기도하고$(), 오브젝트$.이기도 하다. 
			
			<%--fetch("checkid.jsp?inputId=" + inputId).then(function(response) {
				return response.json();
			}).then(function(data) {
				//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
				console.log(data);
				if (data.isExist) {
					$(self).addClass("is-invalid");
					isIdValid=fasle;
				} else {
					$(self).addClass("is-valid");
					isIdValid=true;

				}
			});--%>
			
			
		});
		
		
		
		  //폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
		  $("#signupForm").on("submit",function(){

		         //아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야 한다.
		         //폼 전체의 유효성 여부
		         const isFormValid = isIdValid && isPwdValid && isEmailValid;
		         //만일 폼이 유효하지 않으면
		         if(!isFormValid){
		            return false //폼 전송을 막는다.
		         }
		  });
		  
	</script>







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