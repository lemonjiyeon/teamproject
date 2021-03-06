<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
   
        <!-- bxslider슬라이더 -->
        <script src="./resources/js/jquery.1.12.4.js" type="text/javascript"></script>
        <script src="./resources/plugins/bxslider/js/jquery.bxslider.js" type="text/javascript"></script>
        <script> $(document).ready(function(){$('.slider').bxSlider({controls:false,pager:false,auto:true});}); </script>
</head>
<style>
   .img-fluid{
      width:650px;
      height:400px;
   }
   #menucontainer{
      margin:0 auto;
   }
   #menuwrap{
      color:blue;
   
   }
   .tab-content{
      margin:0 auto;
   }
   .card{
      float:left;
      margin:0 auto;
      height:380px;
   }
   #cardwrap{
      width:1200px;
      height:400px;
      margin:0 auto;
      padding:5px;
   }
   #menuwrap .nav-link{
      color:black;
      margin:0 auto;
      width:600px;
   }   
   .nav-tabs {
    width:1200px;
    border-bottom: 1px solid #ecb807;
    margin:0 auto;
}
   #dang{
      width:1200px;
      margin:0 auto;
      color: black;
   }
   #dang ul li button{
      width:600px;
      margin:0 auto;
      color:black;
   }
   .card-text{
   		font-size: 14px;
   }
</style>
<body id="page-top">

   

<div class="up">
<%-- nabvar --%>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
   
   <div class="slider">
      <header class="masthead1 d-flex align-items-center">
         <div class="container px-4 px-lg-5 text-center">       
            <h3 class="mb-5">
               <em></em>
            </h3>
         </div>
      </header>
      <header class="masthead2 d-flex align-items-center">
         <div class="container px-4 px-lg-5 text-center">           
            <h3 class="mb-5">
               <em></em>
            </h3>
         </div>
      </header>
      <header class="masthead3 d-flex align-items-center">
         <div class="container px-4 px-lg-5 text-center">         
            <h3 class="mb-5">
               <em></em>
            </h3>
         </div>
      </header>
   </div>
   </div>
   <p>
   <div class="content-section-heading text-center">
      <h3 class="text-secondary mb-0">Portfolio</h3>
      <h2 class="mb-5">내륙/섬 AND 제주도</h2>
   </div>

<nav>
 <div id="menuwrap">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true">내륙/섬</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">제주도</button>
  </div>
 </div>
</nav>
<div class="tab-content" id="nav-tabContent">
<div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile">
<!-- 내륙시작 -->
	<div id="cardwrap">
	
	<c:forEach var="tlist" items="${tourList }" end="3" varStatus="status">
		<c:if test="${tlist.toChoice eq 'island' }">		
		<div class="card" style="width: 18rem;">		  		  		  	
		  	<c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
		  	<c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/>		  				  	
		  	<img src="/display?fileName=${originPath }" class="card-img-top" alt="...">		  
		  <div class="card-body">
		    <h5 class="card-title">${tlist.toPrice }원</h5>
		    <p class="card-text">${tlist.toTitle }</p>
		    <a href="" class="btn btn-primary">예약 하러가기</a>
		  </div>
		</div>
		</c:if>
	</c:forEach>	
	</div>		
</div> <!-- end cardwrap --> 
  <!-- 제주도 -->
<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact">
    <div id="cardwrap">	
	<c:forEach var="tlist" items="${tourList }" varStatus="status">
		<c:if test="${tlist.toChoice eq 'jeju' }">
		<div class="card" style="width: 18rem;">
		  <c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
		  	<c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/>		  				  	
		  	<img src="/display?fileName=${originPath }" class="card-img-top" alt="...">	
		  <div class="card-body">
		    <h5 class="card-title">${tlist.toPrice }원</h5>
		    <p class="card-text">${tlist.toTitle }</p>
		    <a href="" class="btn btn-primary">예약 하러가기</a>
		  </div>
		</div>
		</c:if>
	</c:forEach>	
	</div>
 </div>

</div><!-- teb content 절때 지우지마시오 -->

<p>
<div class="content-section-heading text-center">
      <h3 class="text-secondary mb-0">Portfolio</h3>
      <h2 class="mb-5">당일치기 vs 1박2일</h2>
   </div>
<!-- 당일치기과 1박이일 영역 -->
<div id="dang">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">당일치기</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">1박2일</button>
  </li>
</ul>
</div>
<div class="tab-content" id="myTabContent">
  <!-- 당일치기카드 -->
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <!-- 당일시자악 -->
<div id="cardwrap">	
	<c:forEach var="tlist" items="${tourList }" varStatus="status">
		<c:if test="${tlist.toChoice eq 'fewdays' }">
		<div class="card" style="width: 18rem;">
		  <c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
		  	<c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/>		  				  	
		  	<img src="/display?fileName=${originPath }" class="card-img-top" alt="...">	
		  <div class="card-body">
		    <h5 class="card-title">${tlist.toPrice }원</h5>
		    <p class="card-text">${tlist.toTitle }</p>
		    <a href="" class="btn btn-primary">예약 하러가기</a>
		  </div>
		</div>
		</c:if>
	</c:forEach>	
</div>
</div> <!-- end cardwrap -->   
<!-- 1박2일카드 -->  
<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
     <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile">
<div id="cardwrap">
 	<c:forEach var="tlist" items="${tourList }" varStatus="status">
		<c:if test="${tlist.toChoice eq 'today' }">
		<div class="card" style="width: 18rem;">
		  <c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
		  	<c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/>		  				  	
		  	<img src="/display?fileName=${originPath }" class="card-img-top" alt="...">	
		  <div class="card-body">
		    <h5 class="card-title">${tlist.toPrice }원</h5>
		    <p class="card-text">${tlist.toTitle }</p>
		    <a href="" class="btn btn-primary">예약 하러가기</a>
		  </div>
		</div>
		</c:if>
	</c:forEach>
</div> <!-- end cardwrap --> 
  </div>  
 </div>     
   <!-- Portfolio-->
   <section class="content-section" id="portfolio">
      <div class="container px-4 px-lg-5">
         <div class="content-section-heading text-center">
            <h3 class="text-secondary mb-0">Portfolio</h3>
            <h2 class="mb-5">테마 여행지</h2>
         </div>
         <div class="row gx-0">
            
          <c:forEach var="tlist" items="${tourList }" varStatus="status">
          <c:if test="${tlist.toChoice eq 'theme' }">  
            <div class="col-lg-6">
               <a class="portfolio-item" href="#!">
                  <div class="caption">
                     <div class="caption-content">
                        <div class="h2">꼭 맞는 테마여행</div>
                        <p class="mb-0">${tlist.toTitle }</p>
                     </div>
                  </div>
                  <c:set var="fileCallPath" value="${ adList[status.index].uploadpath }/s_${ adList[status.index].uuid }_${ adList[status.index].filename }"/>
		  		 <c:set var="originPath" value="${ adList[status.index].uploadpath }/${adList[status.index].uuid }_${ adList[status.index].filename }"/> 
                  <img src="/display?fileName=${originPath }" class="card-img-top" alt="...">
               </a>
            </div>
            </c:if>
           </c:forEach>
            
            
         </div><!-- end row gx-0ㄴㅇㅁㄴ-->
      </div>
   </section>
   <nav>
</nav>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"><i
      class="fas fa-angle-up"></i></a>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="./resources/js/scripts.js"></script>
   
</body>
    
</html>