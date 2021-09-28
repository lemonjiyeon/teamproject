<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				<strong>여행 후기 작성</strong>
			</h1>

			<div class="container">

				<form action="/board/rewriteform" method="POST" enctype="multipart/form-data">
					<div class="input-group mt-3 mb-2">
						<label class="p-3" for="subject">제목</label> <input type="text"
							class="form-control in" id="subject" name="bTitle" autofocus>
					</div>
					
					<div class="input-group mb-2">
						<label class="p-2" for="id">아이디</label> 
						<input type="text" class="form-control in" id="id" name="userid"
							value="${ sessionScope.id }" readonly>
					</div>

					<div class="input-group mb-2">
						<label class="p-3" for="content">내용</label>
						<textarea class="form-control in" id="content" rows="10"
							name="bContent"></textarea>
					</div>


					<div class="my-4 text-center">
						<button type="submit" class="btn btn-primary" id="submit">
							<i class="material-icons align-middle">create</i> 새글등록
						</button>
						<button type="reset" class="btn btn-primary ml-3">
							<i class="material-icons align-middle">clear</i> 초기화
						</button>
						<button type="button" class="btn btn-primary ml-3"
							onclick="location.href = '/board/reboard?pageNum=${ pageNum }';">
							<i class="material-icons align-middle">list</i> 후기 목록
						</button>
					</div>
				</form>
			</div>
	</section>
	
	<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

<script>
	$('button#submit').on('click',function(){
	 	if( $('input#subject').val() !=null && $('input#content').val() !=null ) {
			alert('등록이 완료 되었습니다.'); 		
	 		$('button#submit').submit();
	 	}else{
	 		alert('빈칸 모두 입력해 주세요.');
	 		return;
	 	}
	 		
	});
</script>
</body>
</html>