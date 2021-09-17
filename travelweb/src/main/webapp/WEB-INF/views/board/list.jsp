<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ page import="mvc.model.BoardDTO"%> --%>


<%-- 
 <%
String sessionId = (String) session.getAttribute("sessionId");
List boardList = (List) request.getAttribute("list");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
 --%>


<html>
<head>
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<title>Board</title>

<link href="../resources/css/styles.css" rel="stylesheet">
<link href="../resources/css/user.css" rel="stylesheet">

<script type="text/javascript">
   function checkForm() {   
      if (${sessionId==null}) {
         alert("로그인 해주세요.");
         return false;
      }

      <%-- location.href = "./BoardWriteForm.do?id=<%=sessionId%>" --%>
   }
</script>
</head>


<body>
	<%-- <jsp:include page="../menu.jsp" /> --%>
	<section class="page-section cta">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<div class="cta-inner bg-faded text-center rounded">
						<h1 class="tit_head">
							<strong>게시판</strong>
						</h1>
						<div class="board">
							<form action="<c:url value="./BoardListAction.do"/>"  method="post">
								<div>
									<div class="text-right">
										<span class="badge badge-success">전체 <%-- <%=total_record%> --%>건
										</span>
									</div>
								</div>
								<div style="padding-top: 50px">
									<table class="table table-hover">
										<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">조회</th>
											<th scope="col">글쓴이</th>
										</tr>
									</thead> 
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>#</td>
											<td>2021</td>
											<td>5</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>#</td>
											<td>2020</td>
											<td>7</td>
											<td>@mdo1</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>#</td>
											<td>2023</td>
											<td>9</td>
											<td>@mdo2</td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>#</td>
											<td>2023</td>
											<td>9</td>
											<td>@mdo2</td>
										</tr>
										<tr>
											<th scope="row">5</th>
											<td>#</td>
											<td>2023</td>
											<td>5</td>
											<td>@mdo2</td>
										</tr>
										<tr>
											<th scope="row">6</th>
											<td>#</td>
											<td>2023</td>
											<td>46</td>
											<td>@mdo2</td>
										</tr>
									</tbody>
									</table>
								</div>

								

								<div class="row">
									<div class="col">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
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
	<%-- <jsp:include page="../footer.jsp" /> --%>
</body>
</html>




