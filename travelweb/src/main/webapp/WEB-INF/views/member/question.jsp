<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>

<!-- css resources -->

<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/content.css" rel="stylesheet">


</head>
<body>

<%-- nabvar --%>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>

<div id="container">
<div class="content_block">
<form name="form" id="form" method="post">
	<input type="hidden" name="regType" id="regType" value="H" /> <input
		type="hidden" name="statCd" id="statCd" value="UCF" /> <input
		type="hidden" name="cstEmail" id="cstEmail" value="" /> <input
		type="hidden" name="venueDt" id="venueDt" value="">
	<div class="content" id="contit_con_titletent">
		<div id="question">
		<h1 class="">견적문의</h1>
		<br>
		</div>

		<h4 class="stit_con_title">문의고객 정보</h4>
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
					<th><label for="cstNm">이름<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td><input type="text" name="cstNm" id="cstNm" maxlength="40"
						placeholder="이름을 입력하세요." value=""></td>
					<th><label for="cstTel">휴대폰 번호<span
							class="ico_tbl_must" title="필수입력"></span></label></th>
					<td><input type="number" name="cstTel" id="cstTel"
						placeholder="'-'제외 숫자만 입력" value=""></td>
				</tr>

				<tr>
					<th><label>이메일<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td colspan="3"><input type="text" title="이메일 아이디 입력"
						name="cstEmail1" id="cstEmail1" maxlength="40"
						placeholder="이메일 아이디" value=""><span class="txt_at">@</span><input
						type="text" title="이메일 도메인 입력" name="cstEmail2" id="cstEmail2"
						maxlength="40" value="" placeholder="이메일 도메인">
						<div class="select normal yb_select" style="width: 150px">
							<select title="이메일 도메인 선택" name="cstEmail3" id="cstEmail3">
								<option value="">직접입력</option>

								<option value="naver.com">naver.com</option>

								<option value="nate.com">nate.com</option>

								<option value="hanmail.net">hanmail.net</option>

								<option value="gmail.com">gmail.com</option>

							</select>
						</div></td>
				</tr>

				<tr>
					<th><label>통화가능시간<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td colspan="3">
						<ul class="list_one_category">
							<li><span class="form_block"><input type="radio"
									id="callDiviCd02" name="callDiviCd" value="" checked="checked"
									onclick="clickCallTmButton('');"><label
									for="callDiviCd02"><span></span>상관없음</label></span></li>
							<li><span class="form_block"><input type="radio"
									id="callDiviCd01" name="callDiviCd" value="X"
									onclick="clickCallTmButton('X');"><label
									for="callDiviCd01"><span></span>안함</label></span></li>
							<li><span class="form_block"><input type="radio"
									id="callDiviCd03" name="callDiviCd" value="C"
									onclick="clickCallTmButton('C');"><label
									for="callDiviCd03"><span></span>선택</label></span></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>

		<h4 class="stit_con_title">여행기본 정보</h4>
		<table class="tbl_basic">
			<caption>여행기본 정보</caption>
			<colgroup>
				<col style="width: 170px">
				<col>
			</colgroup>

			<tbody>
				<tr>
					<th><label>여행타입<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td>
						<div class="tbl_line">
							<ul class="list_align_category">

								<li><span class="form_block"> <input type="radio"
										id="tourjeju" name="tourjeju" value="jeju"
										onclick="fn_setTravrvType('FDMA');"> <label
										for="tourjeju"><span></span>국내여행[제주]</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="tourdomestic" name="tourdomestic" value="domestic"
										onclick="fn_setTravrvType('FDMI');"> <label
										for="tourdomestic"><span></span>국내여행[내륙/섬]</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="tourtheme" name="tourtheme" value="theme"
										onclick="fn_setTravrvType('TREK');"> <label
										for="tourtheme"><span></span>테마여행</label></span></li>

							</ul>
						</div>
					</td>
				</tr>
			</tbody>

			<tbody>

				<tr>
					<th scope="row"><label>여행기간<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td><span class="txt_at">출발일</span> <input type="date"
						title="출발일선택" class="insert_calendar" value="" id="startDt"
						name="startDt" > <span class="txt_at">~&nbsp;&nbsp;
							도착일</span> <input type="date" title="도착일 선택" class="insert_calendar"
						value="" id="endDt" name="endDt" ></td>
				</tr>

				<tr id="tr_Item_FDMI_3"
					class="tr_Item tr_Item_FDMI tr_Item_trafficServ" style="">
					<th scope="row"><label>교통</label> <in3put type="hidden"
						class="item_korName" name="trafficServNm" id="trafficServNm"
						value="교통"> <input type="hidden" class="item_title"
						name="trafficServ" id="trafficServ" value=""> <input
						type="hidden" class="item_other" name="trafficServOther"
						id="trafficServOther" value=""></th>

					<td>
						<div class="tbl_line">
							<ul class="list_one_category">
								<li><span class="form_block"> <input type="radio"
										name="rdo_trafficServ" id="rdo_Item_FDMI_3_11" value="11">
										<label for="rdo_Item_FDMI_3_11"><span></span>항공</label>
								</span></li>
								<li><span class="form_block"> <input type="radio"
										name="rdo_trafficServ" id="rdo_Item_FDMI_3_12" value="12">
										<label for="rdo_Item_FDMI_3_12"><span></span>버스</label>
								</span></li>
								<li class="last"><span class="form_block"> <input
										type="radio" name="rdo_trafficServ" id="rdo_Item_FDMI_3_13"
										value="13"> <label for="rdo_Item_FDMI_3_13"><span></span>렌트</label>
								</span></li>
							</ul>
						</div>
					</td>
				</tr>


				<tr>
					<th scope="row"><label>요청사항</label></th>
					<td>
						<div class="tbl_line">

							<textarea id="contents" name="contents"
								placeholder="원하는 일정, 도시 등 간략 일정을 작성해 주세요.&#13;&#10;(최대 1,000자까지 입력 가능합니다.)"
								title="내용입력" maxlength="1300"></textarea>

						</div>
					</td>
				</tr>
		</table>

		<div class="btn_area">
			<button type="button" class="btn_cof cfrm"
				onclick="saveEstimateChk()">문의하기</button>
		</div>
	</div>
</form>
</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</body>

<!--  =========================================================================================== -->

</html>