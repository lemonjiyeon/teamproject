<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
   
        <!-- bxslider슬라이더 -->
        <script src="../resources/js/jquery.1.12.4.js" type="text/javascript"></script>
        <script src="../resources/plugins/bxslider/js/jquery.bxslider.js" type="text/javascript"></script>
        <script> $(document).ready(function(){$('.slider').bxSlider({controls:false,pager:false,auto:true});}); </script>
        
        <!-- slick -->
        <link rel="stylesheet" type="text/css" href="../resources/css/slick.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css">
</head>
<style>
	#themecontainer{
		margin:auto;
		text-align: center;
		width:1200px;
	}
	.autoplay{
		width:1200px;
	}
	.autoplay img{
		width:380px;
		height:300px;	
	}
</style>
<body id="page-top">
<%-- nabvar --%>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
	<div id="themecontainer">
	<div class="slider">
		<header class="masthead4 d-flex align-items-center">
			<div class="container px-4 px-lg-5 text-center">
				<h1 class="mb-1">welcome to 경주 its your world</h1>
				<h3 class="mb-5">
					<em>A Free Bootstrap Theme by Start Bootstrap</em>
				</h3>
			</div>
		</header>
		<header class="masthead5 d-flex align-items-center">
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
	<p>
	<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">테마별 여행지</h3>
				<h2 class="mb-5">테마별 여행지</h2>
			</div>
	<div class="autoplay">
  		<div><img src="../resources/assets/images/geyu1.jpg"></div>
  		<div><img src="../resources/assets/images/geyu2.jpg"></div>
  		<div><img src="../resources/assets/images/gaya1.jpg"></div>
  		<div><img src="../resources/assets/images/gaya2.jpg"></div>
  		<div><img src="../resources/assets/images/backje.png"></div>
  		<div><img src="../resources/assets/images/backje2.jpg"></div>
  		
	</div>
</div>		
	<script src="../resources/js/slick.min.js"></script>	
	<script>
	$(document).ready(function(){
		$('.autoplay').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 1000
			});
		
		$('.multiple-items').slick({
			  infinite: true,
			  autoplay:true,
			  slidesToShow: 2,
			  slidesToScroll: 2
			});
	});
	</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	
</body>
    
</html>