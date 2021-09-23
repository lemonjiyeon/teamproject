<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- menu nav bar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
	<img alt="Brand" src="../resources/assets/열기구.png"> <a
		class="navbar-brand" href="/" style="color: white;">Tour rainbow</a> <a
		class="navbar-brand" href="/" style="color: white; font-size: 0.5em">in
		korea</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- main navbar -->
	<div class="collapse navbar-collapse my-sm-0" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active" id="action"><a class="nav-link"
				href="#">국내여행 <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="tour/theme">테마여행</a></li>
			<li class="nav-item"><a class="nav-link" href="board/reboard">여행
					후기</a></li>
		</ul>
	</div>
	<!-- end main navbar -->
	
	<!-- login navbar -->
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ms-auto">
			<c:choose>
				<c:when test="${not empty sessionScope.id }">
					<c:if test="${sessionScope.id eq 'admin' }">
						<li class="nav-item"><span>관리자</span> <a
						class="nav-link" href="member/logout">로그아웃</a></li>
					</c:if>
					<li class="nav-item"><span>${ sessionScope.id } 님</span> <a
						class="nav-link" href="member/logout">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="member/login">로그인</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="member/join">회원가입</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- end login navbar -->

</nav>
<div id="secondbar">
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-second">
		<div class="collapse navbar-collapse my-sm-0">
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">

				<div class="navbar-nav">
					<a class="nav-link active" href="#">국내여행<span class="sr-only">(current)</span></a>
					<a class="nav-link" href="tour/jejutour">제주도</a> <a
						class="nav-link" href="tour/intour">내륙/섬</a>
				</div>
			</div>
		</div>
	</nav>
</div>
<!-- end nav bar -->
<script>
	$(document).ready(function() {
		$("#secondbar").hide();
		$("#action").click(function() {
			$("#secondbar").show()
		});
	});
</script>
