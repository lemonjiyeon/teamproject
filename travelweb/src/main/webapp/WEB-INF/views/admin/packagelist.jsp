<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

</head>
<body>

	<%-- nabvar --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />


	<section class="content-section text-black
		text-center">

		<h1 class="tit_head">
			<strong>패키지상품 목록</strong>
		</h1>

		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<c:choose>
					<c:when test="${ pageMaker.totalCount gt 0 }">

						<c:forEach var="tour" items="${ tourList }" varStatus="status">
							<div class="col mb-5">

								<div class="card h-100">
									<!-- Product image-->
									<c:choose>
								<c:when test="${ fn:length(adList) > 0 }"><%-- 첨부파일 있으면 --%>
										<c:if test="${ adList[status.index].filetype eq 'O' }">
												<c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/${ adList[status.index].uuid }_${adList[status.index].filename }"/>
												<a href="javascript:location.href= '/download?fileName=' + encodeURIComponent('${ fileCallPath }')">
													${ adList[status.index].filename }
												</a>
										</c:if>
										<c:if test="${ adList[status.index].filetype eq 'I' }">
											<c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
											<c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/>
												<a href="/display?fileName=${ originPath }">
													<img src="/display?fileName=${ fileCallPath }">
												</a>
										</c:if>
								</c:when>
								<c:otherwise><%-- 첨부파일 없으면 --%>
									<span>첨부파일 없음</span>
								</c:otherwise>
							</c:choose>
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder">${tour.toTitle}</h5>
											<!-- Product price-->
											${tour.toPrice}
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<button type="submit" class="btn btn-primary">
												<i class="material-icons align-middle">create</i> 수정
											</button>
											<button type="button" class="btn btn-warning delete-file">
												<i class="material-icons align-middle">clear</i> 삭제
											</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="container">
							<h3>등록된 상품이 없습니다.</h3>
						</div>
					</c:otherwise>
				</c:choose>


			</div>
		</div>
	</section>

	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>