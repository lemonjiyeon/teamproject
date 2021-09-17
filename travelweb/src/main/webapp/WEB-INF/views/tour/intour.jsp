<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/slick.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css">			
</head>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
<style>
	#intourcontainer{
		margin:auto;
		text-align: center;
		width:1200px;
	}
	.multiple-items{
		width:1200px;
	}
	
	.multiple-items img{
		width:590px;
		height:430px;
	}
</style>
<body>
	<div id="intourcontainer">
	<div class="multiple-items" align="center">
		<div><img src="../resources/assets/images/tour4.jpg"></div>
  		<div><img src="../resources/assets/images/tour5.jpg"></div>
  		<div><img src="../resources/assets/images/tour6.jpg"></div>
  		<div><img src="../resources/assets/images/tour7.jpg"></div>
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
	</div>	
	<script src="../resources/js/slick.min.js"></script>
	<script>
	$(document).ready(function(){				
		$('.multiple-items').slick({
			  infinite: true,
			  autoplay:true,
			  slidesToShow: 2,
			  slidesToScroll: 2
			});
	});
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
</body>	
</html>