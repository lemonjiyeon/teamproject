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
			<strong>패키지 상품수정</strong>
		</h1>

		<div class="container">

			<form action="/admin/packagecontent" method="POST"
				enctype="multipart/form-data">

				<div class="input-group mt-3 mb-2">
					<label class="p-3" for="subject">제목</label> <input type="text"
						class="form-control in" value="${tourVO.toTitle}" id="subject"
						name="toTitle" autofocus>
				</div>

				<div class="input-group mt-4">

					<label class="p-3" for="subject">종류</label> <span
						class="rio_circle"><input type="text" class="form-control in" id="reten1"
						name="toChoice" value="${tourVO.toChoice}"></span>
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">아이디</label> <input type="text"
						class="form-control in" id="id" value="${ sessionScope.id }"
						readonly>
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">가격</label> <input type="text"
						class="form-control in" id="price" value="${tourVO.toPrice}"
						name="toPrice">
				</div>

				<div class="input-group mb-2">
					<label class="p-2" for="id">날짜</label> <input type="date"
						class="form-control" id="date" name="toStart"
						value="${tourVO.toStart}">&nbsp;&nbsp;&#126;&nbsp;&nbsp; <input
						type="date" class="form-control" id="date" name="toEnd"
						value="${tourVO.toEnd}">
				</div>

				<div class="input-group mb-2">
					<label class="p-3" for="content">내용</label>
					<textarea class="form-control in" id="content" rows="10"
						name="toContent">${tourVO.toContent}</textarea>
				</div>

				<div class="input-group mb-2" align="left">
					<c:choose>
						<c:when test="${ fn:length(adattachVO) > 0 }">
							<%-- 첨부파일 있으면 --%>
							<ul>

								<c:forEach var="attach" items="${ adattachVO }">
									<c:if test="${ attach.filetype eq 'O' }">
										<li><c:set var="fileCallPath"
												value="${ attach.uploadpath }/${ attach.uuid }_${ attach.filename }" />
											<a
											href="javascript:location.href= '/download?fileName=' + encodeURIComponent('${ fileCallPath }')">
												${ attach.filename } </a></li>
									</c:if>
									<c:if test="${ attach.filetype eq 'I' }">
										<c:set var="fileCallPath"
											value="${ attach.uploadpath }/s_${ attach.uuid }_${ attach.filename }" />
										<c:set var="originPath"
											value="${ attach.uploadpath }/${ attach.uuid }_${ attach.filename }" />
										<li><a href="/display?fileName=${ originPath }"> <img
												src="/display?fileName=${ fileCallPath }">
										</a></li>
									</c:if>
								</c:forEach>

							</ul>
						</c:when>
						<c:otherwise>
							<%-- 첨부파일 없으면 --%>
							<span>첨부파일 없음</span>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="my-4 text-center">
					<button type="submit" class="btn btn-primary">
						<i class="material-icons align-middle">create</i> 상품등록
					</button>
					<button type="reset" class="btn btn-primary ml-3">
						<i class="material-icons align-middle">clear</i> 초기화
					</button>
					<button type="button" class="btn btn-primary ml-3"
						onclick="location.href = '/admin/packagelist?pageNum=${ pageNum }';">
						<i class="material-icons align-middle">list</i> 상품목록
					</button>
				</div>
			</form>
		</div>
	</section>

	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>