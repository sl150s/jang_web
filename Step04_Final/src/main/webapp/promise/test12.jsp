<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test12.jsp</title>
</head>
<body>
	<h3>ajax form 예제</h3>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="name" placeholder="이름 입력.." />
		<input type="text" name="addr" placeholder="주소 입력.." />
		<button type="submit">추가</button>
	</form>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//id가 myForm인 요소에 "submit"이벤트가 일어나면 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit",function(event){
			//폼 제출을 강제로 막기 
			event.preventDefault();
			
			//gura_util.js에 있는 함수를 이용해서 폼에 입력한 내용을 ajax 요청을 통해 전송한다. 
			//this 대신에 document.querySelector("#myForm")해도된다.
			ajaxFormPromise(this) //여기서 this는 submit 이벤트가 일어난 폼의 참조값 
			//ajaxFormPromise(form) : form 요소에 입력한 모든 내용을 전송해주는 함수
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
			});
		});
	</script>
</body>
</html>