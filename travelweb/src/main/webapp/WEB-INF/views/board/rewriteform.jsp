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
				<strong>여행 후기</strong>
			</h1>

			<div class="container">

				<form action="/board/rewriteform" method="POST">
					<div class="input-group mt-3 mb-2">
						<label class="p-3" for="subject">제목</label> <input type="text"
							class="form-control in" id="subject" name="subject" autofocus>
					</div>
					
					<div class="input-group mb-2">
						<label class="p-2" for="id">아이디</label> 
						<input type="text" class="form-control in" id="id" name="mid"
							value="${ sessionScope.id }" readonly>
					</div>

					<div class="input-group mb-2">
						<label class="p-3" for="content">내용</label>
						<textarea class="form-control in" id="content" rows="10"
							name="content"></textarea>
					</div>

				<div align="left">
					<button type="button" class="btn btn-primary my-3" id="btnAddFile">파일
						추가</button>
				</div>
				
					<div align="left">
						<span>첨부 파일</span>
					</div>
					<div id="fileBox">

						<div class="my-2" align="left">
							<input type="file" name="files" multiple>
							<button type="button" class="btn btn-warning btn-sm delete-file">
								<i class="material-icons align-middle">clear</i> 삭제
							</button>
						</div>

					</div>

					<div class="my-4 text-center">
						<button type="submit" class="btn btn-primary">
							<i class="material-icons align-middle">create</i> 새글등록
						</button>
						<button type="reset" class="btn btn-primary ml-3">
							<i class="material-icons align-middle">clear</i> 초기화
						</button>
						<button type="button" class="btn btn-primary ml-3"
							onclick="location.href = '/board/list?pageNum=${ pageNum }';">
							<i class="material-icons align-middle">list</i> 글목록
						</button>
					</div>
				</form>
			</div>
	</section>
	
	<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
</body>
</html>