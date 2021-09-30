<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<strong>여행 후기 수정</strong>
			</h1>

			<div class="container">

				<form action="/board/rewritemodify" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="boardnum" value="${ resultVO.boardnum }">
					<div class="input-group mt-3 mb-2">
						<label class="p-3" for="subject">제목</label> <input type="text"
							class="form-control in" id="subject" name="btitle" autofocus value="${ resultVO.btitle }" >
					</div>
					
					<div class="input-group mb-2">
						<label class="p-2" for="id">아이디</label> 
						<input type="text" class="form-control in" id="id" name="userid"
							value="${ sessionScope.id }" readonly>
					</div>

					<div class="input-group mb-2">
						<label class="p-3" for="content">내용</label>
						<textarea class="form-control in" id="content" rows="10"
							name="bcontent" >${ resultVO.bcontent }</textarea>
					</div>


					<div class="my-4 text-center">
					<button type="submit" class="btn btn-primary"  onclick="location.href = '';">
							<i class="material-icons align-middle">create</i> 수정 완료
						</button>
						<button type="submit" class="btn btn-primary ml-3" onclick="deleteboardnum(event)">
							<i class="material-icons align-middle">clear</i> 후기 삭제
						</button>
						
					</div>
				</form>
			</div>
	</section>
	
	<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<script>
	
	function deleteboardnum(event){
		event.preventDefault();
		
		let isRemove = confirm("후기를 삭제하시겠습니까?")
		if(isRemove == true){
			location.href = '/board/delete?num=$(resultVO.boardnum)';
		}
	}
</script>	
	
</body>
</html>