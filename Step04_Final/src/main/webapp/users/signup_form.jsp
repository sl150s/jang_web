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
   </div>
</body>
</html>