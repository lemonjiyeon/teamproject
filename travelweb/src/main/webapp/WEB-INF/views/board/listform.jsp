<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>

</head>
<body>
<%-- nabvar --%>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>


	<section class="content-section text-black
		text-center" id="services">
			<h1 class="tit_head">
				<strong>문의 하기</strong>
			</h1>

			<div class="container">

				<form action="/board/listform" method="POST">
					
					<div class="input-group mb-2">
						<label class="p-2" for="id">제목</label> 
						<input type="text" class="form-control in" id="id" name="esttitle"
							value="">
					</div>	
					<div class="input-group mb-2">
						<label class="p-2" for="id">이름</label> 
						<input type="text" class="form-control in" id="id" name="estname"
							value="">
					</div>
					<div class="input-group mb-2">
						<label class="p-2" for="id">전화번호</label> 
						<input type="text" class="form-control in" id="id" name="esttel"
							value="">
					</div>
					<div class="input-group mt-3 mb-2">
						 <label class="p-2" for="id">이메일</label> 
						 <input type="text"
							class="form-control in" id="subject" name="estemail" autofocus>
					</div>
					<div class="input-group mb-2">
						<label class="p-2" for="id">출발일</label> 
						<input type="date" class="form-control in" id="estday" name="estday"
							value="estday">
					</div>
					<div class="mt-4">

							<label for="reten3" style="font-size: 20px;"><span>교통편</span></label>

							<input type="hidden" id="memberReten" name="memberReten" /> <span
								class="rio_circle"><input type="radio" id="reten1"
								name="esttraffic" value="버스"><label for="reten1"><span></span>버스</label></span>

							<span class="rio_circle"><input type="radio" id="reten2"
								name="esttraffic" value="배"><label for="reten2"><span></span>배</label></span>
					</div>
					<div class="input-group mb-2">
						<label class="p-3" for="content">내용</label>
						<textarea class="form-control in" id="content" rows="10"
							name="estcontent"></textarea>
					</div>							
					<div class="my-4 text-center">
						<button type="submit" class="btn btn-primary" id="listform">
							<i class="material-icons align-middle">create</i> 문의등록
						</button>
						<button type="reset" class="btn btn-primary ml-3">
							<i class="material-icons align-middle">clear</i> 초기화
						</button>						
<!-- 						<button type="button" class="btn btn-primary ml-3" -->
<%-- 							onclick="location.href = '/board/list?pageNum=${ pageNum }';"> --%>
<!-- 							<i class="material-icons align-middle">list</i> 글목록 -->
<!-- 						</button> -->
					</div>
				</form>
			</div>
	</section>
	
	<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</body>
	<script>
		$('#listform').on('click',function(event){
			alert('문의가 등록되었습니다.');
		})
	
	</script>
</html>