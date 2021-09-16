<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts and Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
<link href="../resources/css/styles.css" rel="stylesheet">
</head>
<body>
	<section class="content-section bg-primary text-white
		text-center" id="services">
		<div class="container px-4 px-lg-5">
			<div class="content-section-heading">
				<h2 class="mb-5">여행 후기</h2>
			</div>

			<div class="container">

				<form action="/board/write" method="POST">
					<div class="input-group mb-2">
						<label class="p-2" for="id">아이디</label> 
						<input type="text" class="form-control in" id="id" name="mid"
							value="${ sessionScope.id }" readonly>
					</div>

					<div class="input-group mb-2">
						<label class="p-3" for="subject">제목</label> <input type="text"
							class="form-control in" id="subject" name="subject" autofocus>
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
								<i class="material-icons align-middle">clear</i> <span
									class="align-middle">삭제</span>
							</button>
						</div>

					</div>


					<div class="my-4 text-center">
						<button type="submit" class="btn btn-primary">
							<i class="material-icons align-middle">create</i> <span
								class="align-middle">새글등록</span>
						</button>
						<button type="reset" class="btn btn-primary ml-3">
							<i class="material-icons align-middle">clear</i> <span
								class="align-middle">초기화</span>
						</button>
						<button type="button" class="btn btn-primary ml-3"
							onclick="location.href = '/board/list?pageNum=${ pageNum }';">
							<i class="material-icons align-middle">list</i> <span
								class="align-middle">글목록</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>