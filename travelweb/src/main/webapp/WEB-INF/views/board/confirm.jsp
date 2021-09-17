<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirm</title>

<link href="../resources/css/booking.css" rel="stylesheet">
<link href="../resources/css/booking2.css" rel="stylesheet">
</head>
<body>
<br><br>


	<div class="content" id="content">
		<div class="container">

				<h4 class="stit_con_title">예약확인</h4>
				<br>
				<table class="tbl_basic">
					<caption>여행타입 선택</caption>
					<colgroup>
						<col style="width: 170px">
						<col style="width: 285px">
						<col style="width: 170px">
						<col style="width: 285px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label>이름</label></th>
							<td>김세형</td>
							<th scope="row"><label>전화번호</label></th>


							<td>※ 개인정보 수정에서 전화번호를 등록하시기 바랍니다.</td>
						</tr>
						<tr>
							<th scope="row"><label>예약번호</label></th>
							<td colspan="3"><input type="text"
								placeholder="예) RB2018120110001" title="상품 정보를 입력하세요"
								maxlength="20" style="width: 680px" id="rervNo" value="">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_area">
					<button type="button" class="btn_cof cfrm" id="btnok">예약확인</button>
				</div>

				

				<div id="resGoodInfo" style="display: none">

					<div class="rsv_results_tit">
						<p class="results_tit">
							<strong>조회된 예약내역</strong>입니다.
						</p>
						<p class="txt_normal">하단의 예약매칭 버튼을 클릭하여 예약매칭을 진행하시기 바랍니다.</p>
					</div>

					<!-- 여행상품 정보 -->
					<h4 class="stit_con_title">여행상품 정보</h4>
					<table class="tbl_basic">
						<caption>예약한 여행상품 정보</caption>
						<colgroup>
							<col style="width: 170px">
							<col style="width: 285px">
							<col style="width: 170px">
							<col style="width: 285px">
						</colgroup>
						<tbody id="goodDetail">
							<tr>
								<th scope="row"><label>예약번호</label></th>
								<td></td>
								<th scope="row"><label>예약일</label></th>
								<td>()</td>
								<input type="hidden" name="memberRervNo" id="memberRervNo"
									value="">
								<input type="hidden" name="memberRervSeq" id="memberRervSeq"
									value="">

							</tr>
							<tr>
								<th scope="row"><label>상품명</label></th>
								<td colspan="3"></td>
							</tr>

							<!-- 투어 -->
							<tr>
								<th scope="row"><label>투어일</label></th>
								<td>()</td>
								<th scope="row"><label>옵션</label></th>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!-- //여행상품 정보 -->


					<!-- 예약자 정보 -->
					<div class="block_tit_area">
						<h4 class="stit_con_title">예약자 정보</h4>

						<div class="btn_tit_area" id="matchYn"></div>
					</div>
					<table class="tbl_basic">
						<caption>예약자 정보</caption>
						<colgroup>
							<col style="width: 11%">
							<col style="width: 23%">
							<col style="width: 11%">
							<col style="width: 22%">
							<col style="width: 11%">
							<col style="width: 22%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label>회원구분</label></th>
								<td id="memberYn">비회원</td>
								<th scope="row"><label>이름</label></th>
								<td id="memberNm"></td>
								<th scope="row"><label>생년월일</label></th>
								<td id="memberBt"></td>
							</tr>
						</tbody>
					</table>

					<!-- //예약자 정보 -->

					<!-- 여행자 정보 -->
					<h4 class="stit_con_title">
						여행자 정보 <span class="people">(성인 <em class="emp_blue"></em>
							/ 아동 <em class="emp_blue"></em> / 유아 <em class="emp_blue"></em>)
						</span>
					</h4>
					<table class="tbl_vertical" id="tureTabe">
						<caption>여행자 정보</caption>
						<colgroup>
							<col style="width: 200px">
							<col style="width: 202px">
							<col style="width: 115px">
							<col style="width: 151px">
							<col style="width: 95px">
							<col style="width: 147px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><label>회원구분</label></th>
								<th scope="col"><label>이름</label></th>
								<th scope="col"><label>생년월일</label></th>
								<th scope="col"><label>여권사본</label></th>
								<th scope="col"><label>연령구분</label></th>
								<th scope="col"><label>금액</label></th>
							</tr>
						</thead>
						<tbody id="tourInfo">

						</tbody>
					</table>
					<!-- //여행자 정보 -->

				</div>
			</div>
		</div>
	</div>




</body>
</html>