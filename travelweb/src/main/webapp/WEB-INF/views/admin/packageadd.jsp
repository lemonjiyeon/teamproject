<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts and Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

</head>
<body>
	<%-- nabvar --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />


	<section class="content-section text-black
		text-center"
		id="services">
		<h1 class="tit_head">
			<strong>패키지 상품등록</strong>
		</h1>

		<div class="container">

			<form action="/admin/packageadd" method="POST" enctype="multipart/form-data">
				<div class="input-group mt-3 mb-2">
					<label class="p-3" for="subject">제목</label> <input type="text"
						class="form-control in" id="subject" name="toTitle" autofocus>
				</div>

				<div class="input-group mt-4">

					<label class="p-3" for="subject">종류</label> <span
						class="rio_circle mt-3"><input type="radio" id="reten1"
						name="toChoice" value="jeju"><label for="reten1"><span></span>제주도</label></span>

					<span class="rio_circle mt-3"><input type="radio" id="reten1"
						name="toChoice" value="island"><label for="reten1"><span></span>내륙/섬</label></span>

					<span class="rio_circle mt-3"><input type="radio"
						id="reten2" name="toChoice" value="theme"><label for="reten2"><span></span>테마여행</label></span>

					<span class="rio_circle mt-3"><input type="radio"
						id="reten2" name="toChoice" value="today"><label for="reten2"><span></span>당일</label></span>

					<span class="rio_circle mt-3"><input type="radio"
						id="reten2" name="toChoice" value="fewdays"><label for="reten2"><span></span>숙박</label></span>
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">아이디</label> <input type="text"
						class="form-control in" id="id"
						value="${ sessionScope.id }" readonly>
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">가격</label> <input type="text"
						class="form-control in" id="price" name="toPrice">
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">날짜</label> <input type="date"
						class="form-control" id="date" name="toStart">&nbsp;&nbsp;&#126;&nbsp;&nbsp;
					<input type="date" class="form-control" id="date" name="toEnd">
				</div>

				<div class="input-group mb-2">
					<label class="p-3" for="content">내용</label>
					<textarea class="form-control in" id="content" rows="10"
						name="toContent"></textarea>
				</div>

				<div class="input-group mb-2" align="left">
					<label class="p-3" for="content">첨부파일</label>
					<div class="mt-3">
						<input type="file" id="toImg" name="toImg" multiple>
					</div>
				</div>

				<div class="my-4 text-center">
					<button type="submit" id="submit" class="btn btn-primary">
						<i class="material-icons align-middle">create</i> 상품등록
					</button>
					<button type="reset" class="btn btn-primary ml-3">
						<i class="material-icons align-middle">clear</i> 초기화
					</button>
					<button type="button" class="btn btn-primary ml-3"
						onclick="location.href = '/board/list?pageNum=${ pageNum }';">
						<i class="material-icons align-middle">list</i> 상품목록
					</button>
				</div>
			</form>
		</div>
	</section>

	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<script>
		$('button#submit').on('click', function(){
			if($('input#subject').val()!=null && $('input#price').val()!=null && $('input#content').val()!=null){
				alert('상품등록 완료!');
				$('button#submit').submit;
			}else{
				alert('상품정보를 모두 입력해주세요!');
				return;
			}
			
		});
	</script>
</body>
</html>