<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking</title>

<link href="../resources/css/booking.css" rel="stylesheet">
<link href="../resources/css/booking2.css" rel="stylesheet">

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />


</head>
<body>
	<%-- nabvar --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

	<br>
	<br>
	<br>
	<br>
	<section class="page-section cta">
		<div id="container">
			<div class="content_block">

				<div class="container">

					<div class="row">
						<div class="cta-inner bg-faded text-center rounded">
							<h1 class="tit_head">
								<strong>예약하기</strong>
							</h1>

							<br> <br>

							<h4 class="stit_con_title">예약자 정보</h4>
							<table class="tbl_basic">
								<caption>문의고객 정보</caption>
								<colgroup>
									<col style="width: 170px">
									<col>
									<col style="width: 170px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th><label for="cstNm">이름<span
												class="ico_tbl_must" title="필수입력"></span></label></th>
										<td><input type="text" name="cstNm" id="cstNm"
											maxlength="40" placeholder="이름을 입력하세요." value=""></td>
										<th><label for="cstTel">휴대폰 번호<span
												class="ico_tbl_must" title="필수입력"></span></label></th>
										<td><input type="number" name="cstTel" id="cstTel"
											placeholder="'-'제외 숫자만 입력" value=""></td>
									</tr>

									<tr>
										<th><label>이메일<span class="ico_tbl_must"
												title="필수입력"></span></label></th>
										<td colspan="3"><input type="text" title="이메일 아이디 입력"
											name="cstEmail1" id="cstEmail1" maxlength="40"
											placeholder="이메일 아이디" value=""><span class="txt_at">@</span><input
											type="text" title="이메일 도메인 입력" name="cstEmail2"
											id="cstEmail2" maxlength="40" value="" placeholder="이메일 도메인">
											<div class="select normal yb_select" style="width: 150px">
												<select title="이메일 도메인 선택" name="cstEmail3" id="cstEmail3">
													<option value="">직접입력</option>

<<<<<<< HEAD
													<option value="naver.com">naver.com</option>
=======
										<col style="width: 28px">
										<col style="width: 170px">
										<col style="width: 100px">
										<col style="width: 110px">
										<col>
										<col style="width: 110px">
										<col style="width: 110px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">출발/도착 일시</th>
											<th scope="col">교통</th>
											<th scope="col">기간</th>
											<th scope="col">상품명</th>
											<th scope="col">가격</th>
											<th scope="col">예약상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><span class="form_block"> <input
													type="checkbox" id="index0" name="h" title="선택"> <label
													for="index0"><span></span></label>
											</span></td>
											<td><span class="date">2021.09.26(일) </span><br>2021.09.27(월)
											</td>
											<td>버스</td>
											<td>1박2일</td>
											<td class="pdt_name"><span class="tag"></span> <a
												href="#">[라한셀렉트경주숙박]경주라한호텔1박+경주시티투어까지한번에!!</a></td>
											<td class="price">190,000</td>
											<td><button type="button" class="btn_nor cfrm">예약접수</button></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><span class="form_block"> <input
													type="checkbox" id="index1" name="h" title="선택"> <label
													for="index1"><span></span></label>
											</span></td>
											<td><span class="date">2021.09.27(월) </span><br>2021.09.28(화)
											</td>
											<td>버스</td>
											<td>1박2일</td>
											<td class="pdt_name"><span class="tag"></span> <a
												href="#">[라한셀렉트경주숙박]경주라한호텔1박+경주시티투어까지한번에!!</a></td>
											<td class="price">190,000</td>
											<td><button type="button" class="btn_nor cfrm">예약접수</button></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><span class="form_block"> <input
													type="checkbox" id="index2" name="h" title="선택"> <label
													for="index2"><span></span></label>
											</span></td>
											<td><span class="date">2021.09.28(화) </span><br>2021.09.29(수)
											</td>
											<td>버스</td>
											<td>1박2일</td>
											<td class="pdt_name"><span class="tag"></span> <a
												href="#">[라한셀렉트경주숙박]경주라한호텔1박+경주시티투어까지한번에!!</a></td>
											<td class="price">190,000</td>
											<td><button type="button" class="btn_nor cfrm">예약접수</button></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><span class="form_block"> <input
													type="checkbox" id="index3" name="h" title="선택"> <label
													for="index3"><span></span></label>
											</span></td>
											<td><span class="date">2021.09.29(수) </span><br>2021.09.30(목)
											</td>
											<td>버스</td>
											<td>1박2일</td>
											<td class="pdt_name"><span class="tag"></span> <a
												href="#">[라한셀렉트경주숙박]경주라한호텔1박+경주시티투어까지한번에!!</a></td>
											<td class="price">190,000</td>
											<td><button type="button" class="btn_nor cfrm">예약접수</button></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><span class="form_block"> <input
													type="checkbox" id="index4" name="h" title="선택"> <label
													for="index4"><span></span></label>
											</span></td>
											<td><span class="date">2021.09.30(목) </span><br>2021.10.01(금)
											</td>
											<td>버스</td>
											<td>1박2일</td>
											<td class="pdt_name"><span class="tag"></span> <a
												href="#">[라한셀렉트경주숙박]경주라한호텔1박+경주시티투어까지한번에!!</a></td>
											<td class="price">190,000</td>
											<td><button type="button" class="btn_nor cfrm">예약접수</button></td>
										</tr>
									</tbody>
								</table>
							</div>
>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject.git

													<option value="nate.com">nate.com</option>

													<option value="hanmail.net">hanmail.net</option>

													<option value="gmail.com">gmail.com</option>

												</select>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>

					<div class="container">
						<div class="board mt-4">
							<h4 class="stit_con_title">예약 정보</h4>

							<div class="d-inline-block">
								<img class="packageimg" src="../resources/assets/images/신라_문화재.jpg" alt="노랑풍선">
							</div>
							<div class="d-inline-block">
								<table class="tbl_basic margin">
									<tr>
										<th>패키지명</th>
										<td>
											<span>[제주버스패키지/신라스테이]노팁노옵션 전일정식사포함 3일</span>
										</td>
									</tr>
									<tr>
										<th>여행날짜</th>
										<td><span class="txt_at">출발일</span> <input type="date"
											title="출발일선택" class="insert_calendar" value="" id="startDt"
											name="startDt"> <span class="txt_at">~&nbsp;&nbsp;
												도착일</span> <input type="date" title="도착일 선택"
											class="insert_calendar" value="" id="endDt" name="endDt"></td>
									</tr>
									<tr>
										<th>항공</th>
										<td><span class="txt_at">버스</span> </td>
									</tr>
									<tr>
										<th>패키지 상품</th>
										<td><span class="txt_at">출발일</span> 1. 왕복 항공료 2. 신라스테이 호텔
										</td>
									</tr>
									<tr>
										<th>가격</th>
										<td><span class="txt_at">190,000</span></td>
									</tr>
								</table>
							</div>

						</div>


						<div align="center">
							<button type="submit" class="btn btn-primary">
								<i class="material-icons align-middle">done</i> 예약하기
							</button>
							
						</div>

					</div>
				</div>
			</div>
		</div>


	</section>


	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>