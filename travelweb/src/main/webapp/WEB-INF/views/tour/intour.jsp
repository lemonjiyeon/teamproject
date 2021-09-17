<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="../resources/js/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="../resources/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
</head>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
<body>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../resources/assets/images/tour1.jpg" height="600" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/assets/images/tour2.jpg" height="600" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/assets/images/tour3.jpg" height="600" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Nexttesting</span>
  </a>
</div>
<!-- Portfolio-->
	<section class="content-section" id="portfolio">
		<div class="container px-4 px-lg-5">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">내륙여행</h3>
				<h2 class="mb-5">가성비 갑! 내륙여행</h2>
			</div>
			<div class="row gx-0">
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
							
							</div>
						</div> <img class="img-fluid"
						src="../resources/assets/images/tour4.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
							
							</div>
						</div> <img class="img-fluid"
						src="../resources/assets/images/tour5.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								
							</div>
						</div> <img class="img-fluid"
						src="../resources/assets/images/tour6.jpg" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								
								
							</div>
						</div> <img class="img-fluid"
						src="../resources/assets/images/tour7.jpg" alt="..." />
					</a>
				</div>
			</div>
		</div>
	</section>
</body>

</html>