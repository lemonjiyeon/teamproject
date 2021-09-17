<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<!-- css resources -->
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/popup.css" rel="stylesheet">
<link href="../resources/css/content.css" rel="stylesheet">


<form name="form" id="form" method="post">
	<input type="hidden" name="regType" id="regType" value="H" /> <input
		type="hidden" name="statCd" id="statCd" value="UCF" /> <input
		type="hidden" name="cstEmail" id="cstEmail" value="" /> <input
		type="hidden" name="venueDt" id="venueDt" value="">
	<div class="content" id="content">
		<h3 class="tit_con_title">견적문의</h3>
		<div class="con_page_info"></div>
		<p class="txt_tbl_info">
			<span class="ico_tbl_must" title="필수입력 아이콘"></span> 는 필수입력 정보입니다.
		</p>
		<table class="tbl_basic" id="travelType">
			<caption>선택하신 상품</caption>
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
										id="rdo_TRAVRV_TYPE_CD1" name="travrvTypeCd" value="FFC"
										onclick="fn_setTravrvType('FFC');"> <label
										for="rdo_TRAVRV_TYPE_CD1"><span></span>자유여행[해외]</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD2" name="travrvTypeCd" value="HYM"
										onclick="fn_setTravrvType('HYM');"> <label
										for="rdo_TRAVRV_TYPE_CD2"><span></span>허니문</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD3" name="travrvTypeCd" value="GOLF"
										onclick="fn_setTravrvType('GOLF');" checked="checked">



										<label for="rdo_TRAVRV_TYPE_CD3"><span></span>골프</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD4" name="travrvTypeCd" value="HYL"
										onclick="fn_setTravrvType('HYL');"> <label
										for="rdo_TRAVRV_TYPE_CD4"><span></span>성지순례</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD5" name="travrvTypeCd"
										value="COMP_GROUP" onclick="fn_setTravrvType('COMP_GROUP');">


										<label for="rdo_TRAVRV_TYPE_CD5"><span></span>기업/단체</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD6" name="travrvTypeCd" value="FDMA"
										onclick="fn_setTravrvType('FDMA');"> <label
										for="rdo_TRAVRV_TYPE_CD6"><span></span>국내여행[제주]-단체</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD7" name="travrvTypeCd" value="FDMI"
										onclick="fn_setTravrvType('FDMI');"> <label
										for="rdo_TRAVRV_TYPE_CD7"><span></span>국내여행[내륙]-단체</label></span></li>

								<li><span class="form_block"> <input type="radio"
										id="rdo_TRAVRV_TYPE_CD8" name="travrvTypeCd" value="TREK"
										onclick="fn_setTravrvType('TREK');"> <label
										for="rdo_TRAVRV_TYPE_CD8"><span></span>트레킹/산악회</label></span></li>

							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 라디오버튼에 따라 변경되는 내용 들어가는 자리 -->
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
						placeholder="이름을 입력하세요." value="" readonly="readonly"></td>
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


						<div class="select disabled yb_select" id="callTmDiv"
							style="width: 150px">
							<select title="시간선택" name="callTm" id="callTm">
								<option value="">시간선택</option>

								<option value="TM1">09:00~10:00</option>

								<option value="TM2">10:00~11:00</option>

								<option value="TM3">11:00~12:00</option>

								<option value="TM4">12:00~13:00</option>

								<option value="TM5">13:00~14:00</option>

								<option value="TM6">14:00~15:00</option>

								<option value="TM7">15:00~16:00</option>

								<option value="TM8">16:00~17:00</option>

								<option value="TM9">17:00~18:00</option>

							</select>
						</div>
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
					<th scope="row"><label>여행기간<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td><span class="txt_at">출발일</span> <input type="text"
						title="출발일선택" class="insert_calendar" value="" id="startDt"
						name="startDt" readonly> <span class="txt_at">~&nbsp;&nbsp;(한국)
							도착일</span> <input type="text" title="도착일 선택" class="insert_calendar"
						value="" id="endDt" name="endDt" readonly></td>
				</tr>

				<tr id="tr_Item_FDMI_3"
					class="tr_Item tr_Item_FDMI tr_Item_trafficServ" style="">
					<th scope="row"><label>교통</label> <input type="hidden"
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
<!-- //고객센터 -->
</div>
</div>
</div>

<script>
	
</script>
</body>

<!--  =========================================================================================== -->

</html>