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
						<form action="signup.jsp" method="post" id="signupForm"
						v-on:submit="onSubmit">
							<p>폼의 유효성 여부 : <strong>{{isFormValid}}</strong></p>
							<!-- id input -->
							<div class="form-outline mb-4 form-list">
								<input type="text" id="id" name="id" class="form-control"
									placeholder="아이디" v-model="id" v-on:input="onIdInput"
									v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}" />
								<label class="form-label sr-only" for="id">아이디</label> <small
									class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로
									입력하세요</small>
								<div class="valid-feedback">사용할 수 있습니다.</div>
								<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4 form-list">
								<input type="password" id="pwd" name="pwd" class="form-control"
									placeholder="비밀번호" 
									v-model="pwd"
									v-on:input="onPwdInput"
									v-bind:class="{'is-valid':isPwdValid,'is-invalid':!isPwdValid && isPwdDirty}"
									/> <label class="form-label sr-only"
									for="pwd">비밀번호</label> <small class="form-text text-muted">특수문자를
									하나이상 조합하세요.</small>
								<div class="invalid-feedback">비밀번호를 확인하세요</div>
							</div>

							<div class="form-outline mb-4 form-list">
								<input type="password" id="pwd2" name="pwd2"
									class="form-control" placeholder="비밀번호 확인" 
									v-model="pwd2"
									v-on:input="onPwdInput"
									/> <label
									class="form-label sr-only" for="pwd2">비밀번호 확인</label>
							</div>

							<!-- Email input -->
							<div class="form-outline mb-4 form-list">
								<input type="email" id="email" name="email" class="form-control"
									placeholder="이메일" v-model="email" v-on:input="onEmailInput"
									v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}" />
								<label class="form-label sr-only" for="email">이메일</label>
							</div>
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4 " v-bind:disabled="!isFormValid">
								회원가입 하기</button>
							<!-- v-bind:disabled="!isFormValid": form이 유요하지 않으면 disabled를 추가하겠다는 뜻  -->

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


	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		new Vue(
				{
					el : "#signupForm",
					data : {
						isIdValid : false,
						isPwdValid : false,
						isEmailValid : false,
						id : "",
						email : "",
						pwd:"",
						pwd2:"",
						isIdDirty : false,
						isEmailDirty : false,
						isPwdDirty:false,
						
					},
					computed:{
						isFormValid(){
							//모델을 활용해서 얻어낼 값이 있으면
							let result = this.isIdValid && this.isPwdValid && this.isEmailValid;
							//함수에서 리턴해주는 값을 모델처럼 사용하면된다. 
							return result;
						}
						
					},
					methods : {
						onSubmit:function(e){
							//폼 전체의 유효성 여부 
							//const isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
							
							//만일 폼이 유효 하지 않으면
							if(!this.isFormValid){
								alert("로그인, 비밀번호를 다시 확인해주세요");
								e.preventDefault();//폼전송 막기
							}
							
						},
						
						onPwdInput(){
							this.isPwdDirty=true;
							//비밀번호를 검증할 정규 표현식============================
							const pwdReg = /[\W]/; 
							//만일 정규 표현식 검증을 통화하지 못했다면 
							const isPwdReg = pwdReg.test(this.pwd); 
							if(!isPwdReg){
								this.isPwdValid=false;
								return;// 함수를 여기서 끝내라 
							}
							//만일 비밀번호 입력란과 확인란이 다르다면
							if (this.pwd != this.pwd2) {
								this.isPwdValid=false;
							} else {//같다면 
								this.isPwdValid=true;
							}
						},
						
						onIdInput : function() {
							//아이디를 한번이라도 입력하면 아이디가 더럽혀졌는지 여부를 true로 바꿔준다.
							this.isIdDirty = true;

							//아이디를 검증할 정규표현식
							const reg = /^[a-z].{4,9}$/;
							//입력한 아이디가 정규표현식과 매칭이 되는지(통과 되는지) 확인한다. 
							const isMatch = reg.test(this.id);
							//만일 매칭되지 않는다면
							if (!isMatch) {
								this.isIdValid = false;
								return; //함수를 여기서 끝내라
							}

							//Vue 객체의 참조값을 self에 담기 또는 Vue 객체 참조값을 변수에 담아놓고 사용가능 
							const self = this;

							//2. 서버에 페이지 전환없이 전송을하고 응답을 받는다. 
							fetch("checkid.jsp?inputId=" + this.id).then(
									function(response) {
										return response.json();
									}).then(function(data) {
								//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
								console.log(data);
								if (data.isExist) {
									//self.classList.add("is-invalid"); 
									//->>>> vue에선 쓸 필요가 없다 이유-> v-bind:class=""를 이용해 true, false 일 경우 클래스 추가삭제가 가능하기 때문
									self.isIdValid = false;
									// 여기서 this를 사용할 경우 fetch를 가리키기 때문에 미리 self라는 변수에 Vue 참조값을 넣어둔다
								} else {
									//self.classList.add("is-valid");
									self.isIdValid = true;
								}
							});
						},
						
						onEmailInput : function() {
							this.isEmailDirty = true;

							//이메일을 검증할 정규 표현식===========================
							const reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

							if (!reg.test(this.email)) {
								this.isEmailValid = false;
							} else {
								this.isEmailValid = true;
							}
						}

					}
				});
	</script>



</body>
</html>