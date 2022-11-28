<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="/include/boot.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>


	<div class="visual container-fluid">
		<div id="carouselExampleControlsNoTouching" class="carousel slide"
			data-bs-touch="false">
			<div class="carousel-inner">
				<div class="visual-item carousel-item active">
					<img
						src="https://img.freepik.com/free-photo/seoraksan-mountains-is-covered-by-morning-fog-and-sunrise-in-seoul-korea_335224-313.jpg?w=900&t=st=1669598345~exp=1669598945~hmac=f1c42d9970fc2c897dd572a5e0178a3c31041aa140a33562035900cea0a9e8b1"
						class="d-block w-100" alt="...">
				</div>
				<div class="visual-item carousel-item">
					<img
						src="https://img.freepik.com/free-photo/south-korea-skyline-of-seoul-the-best-view-of-south-korea-with-lotte-world-mall-at-namhansanseong-fortress_335224-496.jpg?w=900&t=st=1669598357~exp=1669598957~hmac=8e6ffa8bb8cb7eb2cc0d5e428cbf21e526caa7e9656435d3de8b01d75266f235"
						class="d-block w-100" alt="...">
				</div>
				<div class="visual-item carousel-item">
					<img
						src="https://img.freepik.com/free-photo/wooden-bridge-at-koh-nangyuan-island-in-surat-thani-thailand_335224-1082.jpg?w=900&t=st=1669598370~exp=1669598970~hmac=0b41bc541abe230bc7c09810bf361f12cbb322e0d01ca24a1bb28ee114420900"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControlsNoTouching"
				data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControlsNoTouching"
				data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div class="container-lg ">
		<div class="index-sec section">
			<h2 class="sec-t-font">INDEX.</h2>
			<ul
				class="index-list row list-unstyled d-flex justify-content-around align-items-center">
				<li class="col-lg-2 col-md-3 col-sm-6 border-radius box-shadow">
					<a href="${pageContext.request.contextPath}/cafe/list.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
							fill="currentColor" class="bi bi-chat-left-dots"
							viewBox="0 0 16 16">
						  <path
								d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
						  <path
								d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
						</svg>
						<p>문의게시판</p>
				</a>
				</li>
				<li class="col-lg-2 col-md-3 col-sm-6 border-radius box-shadow">
					<a href="${pageContext.request.contextPath}/file/list.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
							fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
							  <path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
							  <path
								d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
						</svg>
						<p>자료실</p>
				</a>
				</li>
				<li class="col-lg-2 col-md-3 col-sm-6 border-radius box-shadow">
					<a href="${pageContext.request.contextPath}/private/study.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
							fill="currentColor" class="bi bi-file-music" viewBox="0 0 16 16">
					  <path
								d="M10.304 3.13a1 1 0 0 1 1.196.98v1.8l-2.5.5v5.09c0 .495-.301.883-.662 1.123C7.974 12.866 7.499 13 7 13c-.5 0-.974-.134-1.338-.377-.36-.24-.662-.628-.662-1.123s.301-.883.662-1.123C6.026 10.134 6.501 10 7 10c.356 0 .7.068 1 .196V4.41a1 1 0 0 1 .804-.98l1.5-.3z" />
					  <path
								d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z" />
					</svg>
						<p>놀이공간</p>
				</a>
				</li>
				<li class="col-lg-2 col-md-3 col-sm-6 border-radius box-shadow">
					<a href="${pageContext.request.contextPath}/private/game.jsp"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-book"
							viewBox="0 0 16 16">
				  <path
								d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
				</svg>
						<p>공부공간</p> </a>
				</li>
			</ul>
		</div>
		<!-- main -->
		<div class="con2-sec section">
			<h2 class="sec-t-font">CONTENTS.</h2>
			<ul class="row list-unstyled">
				<li class="col-lg-3 col-sm-4"><a href="#"> <img
						class="img-fluid"
						src="
						
					https://img.freepik.com/free-photo/beautiful-tree-in-the-middle-of-a-field-covered-with-grass-with-the-tree-line-in-the-background_181624-29267.jpg?w=1380&t=st=1669600525~exp=1669601125~hmac=fb652ff1e1f61b9bb8936deea64d1521ecd9e22a4cf7a7d341513514ad49e3d7"
						alt="풀이미지" />
				</a></li>
				<li class="col-lg-3 col-sm-4"><a href="#"> <img
						class="img-fluid"
						src="https://img.freepik.com/free-photo/closeup-shot-of-the-small-green-leaves-of-a-bush_181624-30311.jpg?w=1380&t=st=1669600535~exp=1669601135~hmac=bdf4689c3787a75931fc6cc7207a58ecf48143b5ef6e7abdbb6f1673ba2222a2"
						alt="풀이미지" />
				</a></li>
				<li class="col-lg-3 col-sm-4"><a href="#"><img
						class="img-fluid"
						src="https://img.freepik.com/free-photo/blurred-cheonjiyeon-waterfall-is-a-waterfall-on-jeju-island-sou_1258-713.jpg?w=1380&t=st=1669600594~exp=1669601194~hmac=ed61f79a9bd5a0e496dbe70b81cd5297c47a87ad56d6714ee8be1255ee531621"
						alt="풀이미지" /> </a></li>
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> <img
						class="img-fluid"
						src="https://img.freepik.com/free-photo/water-droplet-on-a-green-leaf-background_53876-104392.jpg?w=1380&t=st=1669600628~exp=1669601228~hmac=2254c625cb04c6d24c285dbfdd8491eab8310629b92a2d7e1ecb2296035d7750"
						alt="풀이미지" />
				</a></li>
				<li class="col-lg-3 col-sm-4"><a href="#"><img
						class="img-fluid"
						src="https://img.freepik.com/free-photo/row-of-yellow-ginkgo-tree-in-autumn-autumn-park-in-tokyo-japan_335224-35.jpg?w=1380&t=st=1669600603~exp=1669601203~hmac=f76ce72205e55f406145f84fc68062b136a2b7333e2ac89971dbe746a9c80833"
						alt="풀이미지" /> </a></li>
			</ul>
		</div>
		<div class="con3-sec section">
			<h2 class="sec-t-font">PLAY.</h2>
		</div>

	</div>
	<!-- main_container -->

	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>