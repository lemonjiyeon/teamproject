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
				<strong>문의 상세보기</strong>
			</h1>

			<div class="container">
									
					<div class="input-group mb-2">
						<label class="p-2" for="id">제목</label> 
						<input type="text" class="form-control in" id="id" name="esttitle"
							value="${listVO.esttitle }" readonly="readonly">
					</div>	
					<div class="input-group mb-2">
						<label class="p-2" for="id">이름</label> 
						<input type="text" class="form-control in" id="id" name="estname"
							value="${listVO.estname }" readonly="readonly">
					</div>
					<div class="input-group mb-2">
						<label class="p-2" for="id">전화번호</label> 
						<input type="text" class="form-control in" id="id" name="esttel"
							value="${listVO.esttel }"  readonly="readonly">
					</div>
					<div class="input-group mt-3 mb-2">
						 <label class="p-2" for="id">이메일</label> 
						 <input type="text"
							class="form-control in" id="subject" name="estemail" autofocus
							value="${listVO.estemail }"  readonly="readonly">
					</div>
					<div class="input-group mb-2">
						<label class="p-2" for="id">출발일</label> 
						<input type="date" class="form-control in" id="estday" name="estday"
							value="${listVO.estday }"  readonly="readonly">
					</div>
					<div class="input-group mb-2">

						<label for="reten3">교통편</label>
						<input type="text" class="form-control in" id="esttraffic" name="esttraffic"
							value="${listVO.esttraffic }"  readonly="readonly">		
					</div>
					<div class="input-group mb-2">
						<label class="p-3" for="content">내용</label>
						<textarea class="form-control in" id="content" rows="10"
							name="estcontent"  readonly="readonly">${listVO.estcontent }</textarea>
					</div>							
					<div class="my-4 text-center">
						<button type="submit" class="btn btn-primary" id="listform" onclick="location.href='/board/list?pageNum=${pageNum}';">
							<i class="material-icons align-middle"></i>문의목록으로 돌아가기
						</button>						
					<button type="button" class="btn btn-primary ml-3" 
						onclick="deleteEst(event)"> 
						<i class="material-icons align-middle"></i> 글삭제
					</button>
					</div>
			</div>
	</section>
	
	<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script>
		function deleteEst(event){
			event.preventDefault();
			
			let isRemove = confirm("이 글을 삭제하시겠습니까?")
			if(isRemove == true){
				location.href = '/board/deleteEst?num=${listVO.estnum}&pageNum=${pageNum}';
			}			
		}
	
	</script>	
</body>
	
</html>