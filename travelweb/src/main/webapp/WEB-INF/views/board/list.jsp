<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<title>Board</title>
<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

<!-- <link href="../resources/css/styles.css" rel="stylesheet"> --> 
<link href="../resources/css/user.css" rel="stylesheet">

<script type="text/javascript">
   function checkForm() {   
      if (${sessionId==null}) {
         alert("로그인 해주세요.");
         return false;
      }

   }
</script>

</head>


<body>
	<%-- nabvar --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

	<br>
	<br>
	<br>
	<br>
	<section class="page-section cta">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<div class="cta-inner bg-faded text-center rounded">
						<h1 class="tit_head">
							<strong>문의 게시판</strong>
						</h1>
				<div class="board">
					<form action="<c:url value="./BoardListAction.do"/>" method="post">
						<div>
							<div class="text-right">
								<span class="badge badge-success">전체갯수(${pageMaker.totalCount})</span>
							</div>
						</div>
								<div style="padding-top: 50px">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col">교통수단</th>
												<th scope="col">글쓴이</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${pageMaker.totalCount gt 0 }">
												<c:forEach var="list" items="${listBoard }">
													<tr>
														<th scope="row">${list.estnum }</th>
														<td>${list.esttitle }</td>
														<td>${list.estday }</td>
														<td>${list.esttraffic }</td>
														<td>${list.estname }</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>																														
										</tbody>
									</table>
								</div>



		<div class="row">
				<div class="col">
					<ul class="pagination">
						<%--이전페이지 --%>
						<li class="page-item ${(pageMaker.prev)?'':'disabled' }">
						<a class="page-link" href="${(pageMaker.prev) ? '/board/list?pageNum=' +=(pageMaker.startPage -1) += '&type=' += pageMaker.cri.type += '&keyword=' +=pageMaker.cri.keyword:'' }#board">이전</a>						
						</li>
						
						<%--시작 페이지 번호 --%>						
						<c:forEach var = "i" begin="${pageMaker.startPage }" end="${pageMaker.endPage}" step="1">
						<li class="page-item ${(pageMaker.cri.pageNum eq i) ? 'active':''}">
							<a class="page-link" href="/board/list?pageNum=${i }&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}#board">${i}</a>											
						</li>
						</c:forEach>											
						<li class="page-item ${(pageMaker.next)?'':'disabled'}">
							<a class="page-link" href="${(pageMaker.next)?'/board/list?pageNum=' += (pageMaker.endPage +1) +='&type=' += pageMaker.cri.type += '&keyword' }">다음</a>		
						</li>
					</ul>
				</div>
		</div>
								<br>
								<div align="left">
									<table>
										<tr>
											<td width="100%" align="left">&nbsp;&nbsp; <select
												name="items" class="txt">
													<option value="subject">제목에서</option>
													<option value="content">본문에서</option>
													<option value="name">글쓴이에서</option>
											</select> <input name="text" type="text" /> <input type="submit"
												id="btnAdd" class="btn btn-primary " value="검색 " />
											</td>
											<td width="100%" align="right"><a href="#"
												onclick="checkForm(); return false;" class="btn btn-primary"
												style="width: 90;">&laquo;글쓰기</a></td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>




