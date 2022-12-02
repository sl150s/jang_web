<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//session scope에 id라는 키값으로 저장된 값이 있는지 읽어와 본다(없으면 null)
	String id = (String)session.getAttribute("id");
%> 
<header>
	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Jang-page</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
				aria-controls="offcanvasDarkNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
				id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Jang-page</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
						<li class="nav-item"><a class="dropdown-item"
							href="${pageContext.request.contextPath}/write/test.jsp">써보기</a></li>
						<li class="nav-item"><a class="dropdown-item"
							href="${pageContext.request.contextPath}/file/list.jsp">자료실</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 회원전용공간 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/private/study.jsp">공부공간</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/private/game.jsp">놀이공간</a></li>

							</ul></li>
					</ul>
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-success" type="submit">Search</button>
					</form>
					<div class="navbar-nav justify-content-end flex-grow-1 pe-3 mt-3">
						<%if (id != null) {%>
						<p class="nav-item">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id%>님,
								환영합니다!</a> <a class="dropdown-item mt-1"
								href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
						</p>
						<%} else {%>
						<p class="nav-item">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
						</p>
						<%}%>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>
<div class="body_container">


