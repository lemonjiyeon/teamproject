<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
   
        <!-- bxslider슬라이더 -->
        <script src="./resources/js/jquery.1.12.4.js" type="text/javascript"></script>
        <script src="./resources/plugins/bxslider/js/jquery.bxslider.js" type="text/javascript"></script>
        <script> $(document).ready(function(){$('.slider').bxSlider({controls:false,pager:false,auto:true});}); </script>
</head>



<body id="page-top">

<%-- nabvar --%>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
	
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

<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
	
</body>
    
</html>