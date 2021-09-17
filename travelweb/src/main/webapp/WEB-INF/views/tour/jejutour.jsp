<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>줴주도 여해애애앵</title>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
<script src="./resources/js/slick.js"></script>
<script src="./resources/js/slick.css"></script>
<script src="./resources/js/slick-theme.css"></script>
<script src="./resources/js/jquery-3.6.0.js" type="text/javascript"></script>
</head>
<body>
	<div class=".multiple-items">
  		<div>your content</div>
  		<div>your content</div>
  		<div>your content</div>
	</div>
</body>
<script>
$('.multiple-items').slick({
	  infinite: true,
	  slidesToShow: 3,
	  slidesToScroll: 3
	});
</script>
</html>