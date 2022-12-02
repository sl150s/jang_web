<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/write/test.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/style.css" />
</head>
<body>
	<div id="editor">
		<div class="editor-page" contenteditable="true" >
			<p v-bind:style="{fontWeight:weight+'px'}">입력해<br>보세요</p>
		</div>
		<ul>
			<li>
				<span>굵기</span>
				<input type="range" min="100" max="900" value="300" 
				v-on:input="onWeightInput"
				v-model="weight"/>
			</li>
			<li>
				<span>크기</span>
				<input type="range" min="18" max="220" value="100"
				v-on:input="onSizeInput"
				v-model="size"
				/>
			</li>
			<li>
				<button type="button" class="reset">새로고침</button>
			</li>
		</ul>
	</div>
	
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
	<script>
		new Vue({
			//음.. input의 수정된 값이 editor-page 클래스의 inner text에 적용되어야함. 
			el:"#editor",
			data:{
				weight:"300";
				size:"12";
			},
			methods:{
				onWeightInput:function(){
					console.log(weight);
				}
			}
		});
	</script>
</body>
</html>