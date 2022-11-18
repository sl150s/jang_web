<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_960_720.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_960_720.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://cdn.pixabay.com/photo/2013/07/25/01/31/forest-166733_960_720.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="mt-4 ">
		<div class="d-flex justify-content-center">
			<img src="${pageContext.request.contextPath}/images/7.png" alt="...">
			<img src="${pageContext.request.contextPath}/images/7.png" alt="...">
			<img src="${pageContext.request.contextPath}/images/7.png" alt="...">
		</div>
		<div class="d-flex justify-content-center mt-3 ">
			<p class="fs-3 fw-bold">Acorn Academy</p>
		</div>
	</div>
	<%--
		/include/footer.jsp 페이지를 포함시켜서 이 부분은 footer.jsp 페이지가 응답하도록 한다.
	--%>
	<jsp:include page="/include/footer.jsp"></jsp:include>


</body>
</html>