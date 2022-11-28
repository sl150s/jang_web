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
					<img src="https://img.freepik.com/free-photo/seoraksan-mountains-is-covered-by-morning-fog-and-sunrise-in-seoul-korea_335224-313.jpg?w=900&t=st=1669598345~exp=1669598945~hmac=f1c42d9970fc2c897dd572a5e0178a3c31041aa140a33562035900cea0a9e8b1" class="d-block w-100" alt="...">
				</div>
				<div class="visual-item carousel-item">
					<img src="https://img.freepik.com/free-photo/south-korea-skyline-of-seoul-the-best-view-of-south-korea-with-lotte-world-mall-at-namhansanseong-fortress_335224-496.jpg?w=900&t=st=1669598357~exp=1669598957~hmac=8e6ffa8bb8cb7eb2cc0d5e428cbf21e526caa7e9656435d3de8b01d75266f235" class="d-block w-100" alt="...">
				</div>
				<div class="visual-item carousel-item">
					<img src="https://img.freepik.com/free-photo/wooden-bridge-at-koh-nangyuan-island-in-surat-thani-thailand_335224-1082.jpg?w=900&t=st=1669598370~exp=1669598970~hmac=0b41bc541abe230bc7c09810bf361f12cbb322e0d01ca24a1bb28ee114420900" class="d-block w-100" alt="...">
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
			<h1>인덱스 페이지 입니다.</h1>
			<ul class="row">
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> 글목록 </a></li>
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> 자료실 </a></li>
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> 글목록 </a></li>
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> 글목록 </a></li>
				<li class="col-lg-3 col-md-4 col-sm-6"><a href="#"> 글목록 </a></li>
			</ul>
		</div>
		<!-- main -->
		<div class="con2-sec section">
			
		</div>

	</div>
	<!-- main_container -->

	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>