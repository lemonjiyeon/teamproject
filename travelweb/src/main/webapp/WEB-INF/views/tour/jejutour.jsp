<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>줴주도 여해애애앵</title>
 <jsp:include page="/WEB-INF/views/include/head.jsp"/> 
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="../resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css">
<style>
	#jejucontainer{
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
	.autoplay{
		width:1200px;
	}
	.autoplay img{
		width:380px;
		height:300px;	
	}
</style>
</head>
<body>
	<div id="jejucontainer">
	<div class="multiple-items" align="center">
		<div><img src="../resources/assets/images/tour1.jpg"></div>
  		<div><img src="../resources/assets/images/tour2.jpg"></div>
  		<div><img src="../resources/assets/images/tour3.jpg"></div>
  		<div><img src="../resources/assets/images/tourj1.jpg"></div>
	</div>
	<p>	
	<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">제주여행</h3>
				<h2 class="mb-5">제주도시 여행상품 보기</h2>
			</div>
	<div class="autoplay">
  		<!-- <div><img src="../resources/assets/images/newjeju1.jpg"></div>
  		<div><img src="../resources/assets/images/newjeju2.jpg"></div> -->
  		<div><img src="../resources/assets/images/newjeju3.jpg"></div>
  		<div><img src="../resources/assets/images/newjeju4.jpg"></div>
  		<div><img src="../resources/assets/images/newjeju55.jpg"></div>
  		<div><img src="../resources/assets/images/newjeju66.jpg"></div>
	</div>
	<p>
	<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">제주도 여행 클릭</h3>
				<h2 class="mb-5">그림을 눌러보세요!</h2>
			</div>
	<div id="jejumap">
		<div><img src="../resources/assets/images/jeju_map.jpg" usemap="#Map"></div>
		<map name="Map">
			<area shape="rect" coords="319,74,396,127" href="제주 국제공항">
			<area shape="rect" coords="347,165,440,264" href="/board/booking">
			<area shape="rect" coords="204,247,265,307" href="/board/booking">
			<area shape="rect" coords="686,133,822,181" href="/board/booking">
			<area shape="rect" coords="655,177,731,220" href="/board/booking">									
		</map>	
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
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>


</body>
</html>