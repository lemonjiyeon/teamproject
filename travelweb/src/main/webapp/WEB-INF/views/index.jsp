<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Stylish Portfolio - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/styles.css" rel="stylesheet" />
<!-- bxslider슬라이더 -->
<script src="./resources/js/jquery.1.12.4.js" type="text/javascript"></script>
<script src="/resources/plugins/bxslider/js/jquery.bxslider.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			controls : false,
			pager : false,
			auto : true
		});
	});
</script>
</head>

<!-- end second nav bar -->
<body id="page-top">

    <!-- menu nav bar -->         	  
	  <div class="navarea">
	  <nav class="navbar navbar-expand-lg navbar-light bg-light my-2 my-sm-0 p-3 mb-2">
	  <a class="navbar-brand" href="#">노랑풍선</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse my-sm-0" id="navbarNav">
	    <ul class="navbar-nav">	           
	      <li class="nav-item active" id="action">
	        <a class="nav-link" href="#">국내여행 <span class="sr-only">(current)</span></a>
	      </li>	    
	      <li class="nav-item">
	        <a class="nav-link" href="#">테마여행</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="board/write">여행 후기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="member/login">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="member/join">회원가입</a>
	      </li>
	    </ul>
	  </div>
		</nav>
	</div>
	<!-- end nav bar -->
	<!-- second nav bar -->
	<div id="secondbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">

				<div class="navbar-nav">
					<a class="nav-link active" href="#">국내여행<span class="sr-only">(current)</span></a>
					<a class="nav-link" href="#">제주도</a> <a class="nav-link" href="#">내륙/섬</a>
				</div>
			</div>
		</nav>
	</div>
	<!-- end nav bar -->

	<div class="slider">
		<header class="masthead1 d-flex align-items-center">
			<div class="container px-4 px-lg-5 text-center">
				<h1 class="mb-1">welcome to 경주 its your world</h1>
				<h3 class="mb-5">
					<em>A Free Bootstrap Theme by Start Bootstrap</em>
				</h3>
			</div>
		</header>
		<header class="masthead2 d-flex align-items-center">
			<div class="container px-4 px-lg-5 text-center">
				<h1 class="mb-1">hello nice to meet ya</h1>
				<h3 class="mb-5">
					<em>A Free Bootstrap Theme by Start Bootstrap</em>
				</h3>
			</div>
		</header>
		<header class="masthead3 d-flex align-items-center">
			<div class="container px-4 px-lg-5 text-center">
				<h1 class="mb-1">와 여기 정말 좋은 곳이구나</h1>
				<h3 class="mb-5">
					<em>A Free Bootstrap Theme by Start Bootstrap</em>
				</h3>
			</div>
		</header>
	</div>
	
	<!-- Portfolio-->
	<section class="content-section" id="portfolio">
		<div class="container px-4 px-lg-5">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">Portfolio</h3>
				<h2 class="mb-5">Recent Projects</h2>
			</div>
			<div class="row gx-0">
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">Stationary</div>
								<p class="mb-0">A yellow pencil with envelopes on a clean,
									blue backdrop!</p>
							</div>
						</div> <img class="img-fluid"
						src="./resources/assets/images/portfolio-1.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">Ice Cream</div>
								<p class="mb-0">A dark blue background with a colored
									pencil, a clip, and a tiny ice cream cone!</p>
							</div>
						</div> <img class="img-fluid"
						src="./resources/assets/images/portfolio-2.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">Strawberries</div>
								<p class="mb-0">Strawberries are such a tasty snack,
									especially with a little sugar on top!</p>
							</div>
						</div> <img class="img-fluid"
						src="./resources/assets/images/portfolio-3.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">Workspace</div>
								<p class="mb-0">A yellow workspace with some scissors,
									pencils, and other objects.</p>
							</div>
						</div> <img class="img-fluid"
						src="./resources/assets/images/portfolio-4.jpg" alt="..." />
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container px-4 px-lg-5">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"><i
						class="icon-social-facebook"></i></a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"><i
						class="icon-social-twitter"></i></a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white" href="#!"><i
						class="icon-social-github"></i></a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; Your Website
				2021</p>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
	<script>
	   $(document).ready(function(){
           $("#secondbar").hide();              
           $("#action").click(function(){
              $("#secondbar").show()
           });
        });
	</script>
</body>
    
</html>