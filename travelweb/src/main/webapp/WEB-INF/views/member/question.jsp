<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

	<!-- css resources -->
	<link href="/static/css/common.css?20210916" rel="stylesheet">
	<link href="/static/css/popup.css" rel="stylesheet">


<link href="/static/css/content.css" rel="stylesheet">


		<form name="form" id="form" method="post">
			<input type="hidden" name="regType" id="regType" value="H" />
			<input type="hidden" name="statCd" id="statCd" value="UCF" />
			<input type="hidden" name="cstEmail" id="cstEmail" value="" />
			<input type="hidden" name="venueDt" id="venueDt" value="">
			<div class="content" id="content">				
				<h3 class="tit_con_title">견적문의</h3>
				<div class="con_page_info">
					<h4 class="tit_time_info">운영시간</h4>
					<ul class="con_info_list">
						<li>문의주신 내용의 답변은 업무일(평일)기준으로 순차적으로 메일이 발송되며, 카카오 알림톡으로 처리 결과를 발송해 드립니다.</li>
						<li>노랑풍선 회원이신 경우, 로그인 후 사용하시면 더욱 편리하게 마이페이지에서도 답변을 확인하실 수 있습니다.</li>
						<li>주말, 공휴일의 경우는 평일 업무시간 개시 이후 순차적으로 답변 진행해드립니다.</li>
						<li>항공권 문의는 <a href="/cs/qnaGuide.yb" class="btn_go_page">1:1 문의</a>를 이용해주세요.</li>
					</ul>
					
					
					
				</div>
				<p class="txt_tbl_info"><span class="ico_tbl_must" title="필수입력 아이콘"></span> 는 필수입력 정보입니다.</p>
				<table class="tbl_basic" id="travelType">
				<caption>
					여행타입 선택
				</caption>
				<colgroup>
				<col style="width:170px">
				<col>
				</colgroup>
				<tbody>
				<tr>
					<th><label>여행타입<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td>
						<div class="tbl_line">
							<ul class="list_align_category">
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD1" name="travrvTypeCd" value="FFC" onclick="fn_setTravrvType('FFC');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD1"><span></span>자유여행[해외]</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD2" name="travrvTypeCd" value="HYM" onclick="fn_setTravrvType('HYM');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD2"><span></span>허니문</label></span>
											</li>
								
											<li><span class="form_block">
									
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD3" name="travrvTypeCd" value="GOLF" onclick="fn_setTravrvType('GOLF');" checked="checked">
										
										
									
												<label for="rdo_TRAVRV_TYPE_CD3"><span></span>골프</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD4" name="travrvTypeCd" value="HYL" onclick="fn_setTravrvType('HYL');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD4"><span></span>성지순례</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD5" name="travrvTypeCd" value="COMP_GROUP" onclick="fn_setTravrvType('COMP_GROUP');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD5"><span></span>기업/단체</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD6" name="travrvTypeCd" value="FDMA" onclick="fn_setTravrvType('FDMA');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD6"><span></span>국내여행[제주]-단체</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD7" name="travrvTypeCd" value="FDMI" onclick="fn_setTravrvType('FDMI');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD7"><span></span>국내여행[내륙]-단체</label></span>
											</li>
								
											<li><span class="form_block">
									
										
										
												<input type="radio" id="rdo_TRAVRV_TYPE_CD8" name="travrvTypeCd" value="TREK" onclick="fn_setTravrvType('TREK');">
										
									
												<label for="rdo_TRAVRV_TYPE_CD8"><span></span>트레킹/산악회</label></span>
											</li>
															
							</ul>
						</div>
					</td>
				</tr>
				</tbody>
				</table>
				<!-- 라디오버튼에 따라 변경되는 내용 들어가는 자리 -->
				<h4 class="stit_con_title">문의고객 정보</h4>
				<table class="tbl_basic">
				<caption>
					문의고객 정보
				</caption>
				<colgroup>
				<col style="width:170px">
				<col>
				<col style="width:170px">
				<col>
				</colgroup>
				<tbody>
				<tr>
					<th><label for="cstNm">이름<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td><input type="text" name="cstNm" id ="cstNm" maxlength="40" placeholder="이름을 입력하세요." value="박준석" readonly="readonly"></td>
					<th><label for="cstTel">휴대폰 번호<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td><input type="number" name="cstTel" id="cstTel" placeholder="'-'제외 숫자만 입력" value="01057565050"></td>
				</tr>
				<tr>
					<th><label>이메일<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td colspan="3"><input type="text" title="이메일 아이디 입력" name="cstEmail1" id="cstEmail1" maxlength="40" placeholder="이메일 아이디" value=""><span class="txt_at">@</span><input type="text" title="이메일 도메인 입력" name="cstEmail2" id="cstEmail2" maxlength="40" value="" placeholder="이메일 도메인">
					<div class="select normal yb_select" style="width:150px">
						<select title="이메일 도메인 선택" name="cstEmail3" id="cstEmail3">
							<option value="">직접입력</option>
							
								<option value="naver.com" >naver.com</option>
							
								<option value="nate.com" >nate.com</option>
							
								<option value="hanmail.net" >hanmail.net</option>
							
								<option value="dreamwiz.com" >dreamwiz.com</option>
							
								<option value="lycos.co.kr" >lycos.co.kr</option>
							
								<option value="gmail.com" >gmail.com</option>
							
								<option value="hotmail.com" >hotmail.com</option>
							
								<option value="paran.com" >paran.com</option>
							
								<option value="yahoo.co.kr" >yahoo.co.kr</option>
							
								<option value="empal.com" >empal.com</option>
							
								<option value="unitel.co.kr" >unitel.co.kr</option>
							
								<option value="korea.com" >korea.com</option>
							
								<option value="chol.com" >chol.com</option>
							
								<option value="freechal.com" >freechal.com</option>
											
						</select>
					</div>					
					</td>
				</tr>
                
                	
                	
					<tr>
						<th><label>통화가능시간<span class="ico_tbl_must" title="필수입력"></span></label></th>
						<td colspan="3">
							<ul class="list_one_category">
	                            <li><span class="form_block"><input type="radio" id="callDiviCd02" name="callDiviCd" value="" checked="checked" onclick="clickCallTmButton('');"><label for="callDiviCd02"><span></span>상관없음</label></span></li>
	                            <li><span class="form_block"><input type="radio" id="callDiviCd01" name="callDiviCd" value="X" onclick="clickCallTmButton('X');"><label for="callDiviCd01"><span></span>안함</label></span></li>
	                            <li><span class="form_block"><input type="radio" id="callDiviCd03" name="callDiviCd" value="C" onclick="clickCallTmButton('C');"><label for="callDiviCd03"><span></span>선택</label></span></li>                            
							</ul>
						
							
							
								<div class="select disabled yb_select" id="callTmDiv" style="width:150px">
									<select title="시간선택" name="callTm" id="callTm">
										<option value="">시간선택</option>
											
											<option value="TM1" >09:00~10:00</option>
											
											<option value="TM2" >10:00~11:00</option>
											
											<option value="TM3" >11:00~12:00</option>
											
											<option value="TM4" >12:00~13:00</option>
											
											<option value="TM5" >13:00~14:00</option>
											
											<option value="TM6" >14:00~15:00</option>
											
											<option value="TM7" >15:00~16:00</option>
											
											<option value="TM8" >16:00~17:00</option>
											
											<option value="TM9" >17:00~18:00</option>
															
									</select>
								</div>
							
												
						</td>				
					</tr>
		
					
					<tr>
						<th><label>여행인원<span class="ico_tbl_must" title="필수입력"></span></label></th>
						<td colspan="3">
							<span class="txt_at">성인</span>
							<div class="select num yb_select">
								<select title="인원 선택" id="rervAdtCnt" name="rervAdtCnt">
									<option value="">선택</option>
									
										
									
										
											<option value="1" >1명</option>
										
									
										
											<option value="2" >2명</option>
										
									
										
											<option value="3" >3명</option>
										
									
										
											<option value="4" >4명</option>
										
									
										
											<option value="5" >5명</option>
										
									
										
											<option value="6" >6명</option>
										
									
										
											<option value="7" >7명</option>
										
									
										
											<option value="8" >8명</option>
										
									
										
											<option value="9" >9명</option>
										
									
										
											<option value="10" >10명</option>
										
									
										
											<option value="11" >11명</option>
										
									
										
											<option value="12" >12명</option>
										
									
										
											<option value="13" >13명</option>
										
									
										
											<option value="14" >14명</option>
										
									
										
											<option value="15" >15명</option>
										
									
										
											<option value="16" >16명</option>
										
									
										
											<option value="17" >17명</option>
										
									
										
											<option value="18" >18명</option>
										
									
										
											<option value="19" >19명</option>
										
									
										
											<option value="20" >20명</option>
										
									
										
											<option value="21" >21명</option>
										
									
										
											<option value="22" >22명</option>
										
									
										
											<option value="23" >23명</option>
										
									
										
											<option value="24" >24명</option>
										
									
										
											<option value="25" >25명</option>
										
									
										
											<option value="26" >26명</option>
										
									
										
											<option value="27" >27명</option>
										
									
										
											<option value="28" >28명</option>
										
									
										
											<option value="29" >29명</option>
										
									
										
											<option value="30" >30명</option>
										
									
										
											<option value="31" >31명</option>
										
									
										
											<option value="32" >32명</option>
										
									
										
											<option value="33" >33명</option>
										
									
										
											<option value="34" >34명</option>
										
									
										
											<option value="35" >35명</option>
										
									
										
											<option value="36" >36명</option>
										
									
										
											<option value="37" >37명</option>
										
									
										
											<option value="38" >38명</option>
										
									
										
											<option value="39" >39명</option>
										
									
										
											<option value="40" >40명</option>
										
									
										
											<option value="41" >41명</option>
										
									
										
											<option value="42" >42명</option>
										
									
										
											<option value="43" >43명</option>
										
									
										
											<option value="44" >44명</option>
										
									
										
											<option value="45" >45명</option>
										
									
										
											<option value="46" >46명</option>
										
									
										
											<option value="47" >47명</option>
										
									
										
											<option value="48" >48명</option>
										
									
										
											<option value="49" >49명</option>
										
									
										
											<option value="50" >50명</option>
										
									
										
											<option value="51" >51명</option>
										
									
										
											<option value="52" >52명</option>
										
									
										
											<option value="53" >53명</option>
										
									
										
											<option value="54" >54명</option>
										
									
										
											<option value="55" >55명</option>
										
									
										
											<option value="56" >56명</option>
										
									
										
											<option value="57" >57명</option>
										
									
										
											<option value="58" >58명</option>
										
									
										
											<option value="59" >59명</option>
										
									
										
											<option value="60" >60명</option>
										
									
										
											<option value="61" >61명</option>
										
									
										
											<option value="62" >62명</option>
										
									
										
											<option value="63" >63명</option>
										
									
										
											<option value="64" >64명</option>
										
									
										
											<option value="65" >65명</option>
										
									
										
											<option value="66" >66명</option>
										
									
										
											<option value="67" >67명</option>
										
									
										
											<option value="68" >68명</option>
										
									
										
											<option value="69" >69명</option>
										
									
										
											<option value="70" >70명</option>
										
									
										
											<option value="71" >71명</option>
										
									
										
											<option value="72" >72명</option>
										
									
										
											<option value="73" >73명</option>
										
									
										
											<option value="74" >74명</option>
										
									
										
											<option value="75" >75명</option>
										
									
										
											<option value="76" >76명</option>
										
									
										
											<option value="77" >77명</option>
										
									
										
											<option value="78" >78명</option>
										
									
										
											<option value="79" >79명</option>
										
									
										
											<option value="80" >80명</option>
										
									
										
											<option value="81" >81명</option>
										
									
										
											<option value="82" >82명</option>
										
									
										
											<option value="83" >83명</option>
										
									
										
											<option value="84" >84명</option>
										
									
										
											<option value="85" >85명</option>
										
									
										
											<option value="86" >86명</option>
										
									
										
											<option value="87" >87명</option>
										
									
										
											<option value="88" >88명</option>
										
									
										
											<option value="89" >89명</option>
										
									
										
											<option value="90" >90명</option>
										
									
										
											<option value="91" >91명</option>
										
									
										
											<option value="92" >92명</option>
										
									
										
											<option value="93" >93명</option>
										
									
										
											<option value="94" >94명</option>
										
									
										
											<option value="95" >95명</option>
										
									
										
											<option value="96" >96명</option>
										
									
										
											<option value="97" >97명</option>
										
									
										
											<option value="98" >98명</option>
										
									
										
											<option value="99" >99명</option>
										
									
										
											<option value="100" >100명</option>
										
														
								</select>
							</div>
							<span class="txt_at">아동</span>
							<div class="select num yb_select">
								<select title="인원 선택" id="rervChdCnt" name="rervChdCnt">
									<option value="">선택</option>
									
										<option value="0" >0명</option>
									
										<option value="1" >1명</option>
									
										<option value="2" >2명</option>
									
										<option value="3" >3명</option>
									
										<option value="4" >4명</option>
									
										<option value="5" >5명</option>
									
										<option value="6" >6명</option>
									
										<option value="7" >7명</option>
									
										<option value="8" >8명</option>
									
										<option value="9" >9명</option>
									
										<option value="10" >10명</option>
									
										<option value="11" >11명</option>
									
										<option value="12" >12명</option>
									
										<option value="13" >13명</option>
									
										<option value="14" >14명</option>
									
										<option value="15" >15명</option>
									
										<option value="16" >16명</option>
									
										<option value="17" >17명</option>
									
										<option value="18" >18명</option>
									
										<option value="19" >19명</option>
									
										<option value="20" >20명</option>
									
										<option value="21" >21명</option>
									
										<option value="22" >22명</option>
									
										<option value="23" >23명</option>
									
										<option value="24" >24명</option>
									
										<option value="25" >25명</option>
									
										<option value="26" >26명</option>
									
										<option value="27" >27명</option>
									
										<option value="28" >28명</option>
									
										<option value="29" >29명</option>
									
										<option value="30" >30명</option>
									
										<option value="31" >31명</option>
									
										<option value="32" >32명</option>
									
										<option value="33" >33명</option>
									
										<option value="34" >34명</option>
									
										<option value="35" >35명</option>
									
										<option value="36" >36명</option>
									
										<option value="37" >37명</option>
									
										<option value="38" >38명</option>
									
										<option value="39" >39명</option>
									
										<option value="40" >40명</option>
									
										<option value="41" >41명</option>
									
										<option value="42" >42명</option>
									
										<option value="43" >43명</option>
									
										<option value="44" >44명</option>
									
										<option value="45" >45명</option>
									
										<option value="46" >46명</option>
									
										<option value="47" >47명</option>
									
										<option value="48" >48명</option>
									
										<option value="49" >49명</option>
									
										<option value="50" >50명</option>
									
										<option value="51" >51명</option>
									
										<option value="52" >52명</option>
									
										<option value="53" >53명</option>
									
										<option value="54" >54명</option>
									
										<option value="55" >55명</option>
									
										<option value="56" >56명</option>
									
										<option value="57" >57명</option>
									
										<option value="58" >58명</option>
									
										<option value="59" >59명</option>
									
										<option value="60" >60명</option>
									
										<option value="61" >61명</option>
									
										<option value="62" >62명</option>
									
										<option value="63" >63명</option>
									
										<option value="64" >64명</option>
									
										<option value="65" >65명</option>
									
										<option value="66" >66명</option>
									
										<option value="67" >67명</option>
									
										<option value="68" >68명</option>
									
										<option value="69" >69명</option>
									
										<option value="70" >70명</option>
									
										<option value="71" >71명</option>
									
										<option value="72" >72명</option>
									
										<option value="73" >73명</option>
									
										<option value="74" >74명</option>
									
										<option value="75" >75명</option>
									
										<option value="76" >76명</option>
									
										<option value="77" >77명</option>
									
										<option value="78" >78명</option>
									
										<option value="79" >79명</option>
									
										<option value="80" >80명</option>
									
										<option value="81" >81명</option>
									
										<option value="82" >82명</option>
									
										<option value="83" >83명</option>
									
										<option value="84" >84명</option>
									
										<option value="85" >85명</option>
									
										<option value="86" >86명</option>
									
										<option value="87" >87명</option>
									
										<option value="88" >88명</option>
									
										<option value="89" >89명</option>
									
										<option value="90" >90명</option>
									
										<option value="91" >91명</option>
									
										<option value="92" >92명</option>
									
										<option value="93" >93명</option>
									
										<option value="94" >94명</option>
									
										<option value="95" >95명</option>
									
										<option value="96" >96명</option>
									
										<option value="97" >97명</option>
									
										<option value="98" >98명</option>
									
										<option value="99" >99명</option>
									
								</select>
							</div>
							<span class="txt_at">유아</span>
							<div class="select num yb_select">
								<select title="인원 선택" id="rervInfCnt" name="rervInfCnt">
									<option value="">선택</option>
									
										<option value="0" >0명</option>
									
										<option value="1" >1명</option>
									
										<option value="2" >2명</option>
									
										<option value="3" >3명</option>
									
										<option value="4" >4명</option>
									
										<option value="5" >5명</option>
									
										<option value="6" >6명</option>
									
										<option value="7" >7명</option>
									
										<option value="8" >8명</option>
									
										<option value="9" >9명</option>
									
										<option value="10" >10명</option>
									
										<option value="11" >11명</option>
									
										<option value="12" >12명</option>
									
										<option value="13" >13명</option>
									
										<option value="14" >14명</option>
									
										<option value="15" >15명</option>
									
										<option value="16" >16명</option>
									
										<option value="17" >17명</option>
									
										<option value="18" >18명</option>
									
										<option value="19" >19명</option>
									
										<option value="20" >20명</option>
									
										<option value="21" >21명</option>
									
										<option value="22" >22명</option>
									
										<option value="23" >23명</option>
									
										<option value="24" >24명</option>
									
										<option value="25" >25명</option>
									
										<option value="26" >26명</option>
									
										<option value="27" >27명</option>
									
										<option value="28" >28명</option>
									
										<option value="29" >29명</option>
									
										<option value="30" >30명</option>
									
										<option value="31" >31명</option>
									
										<option value="32" >32명</option>
									
										<option value="33" >33명</option>
									
										<option value="34" >34명</option>
									
										<option value="35" >35명</option>
									
										<option value="36" >36명</option>
									
										<option value="37" >37명</option>
									
										<option value="38" >38명</option>
									
										<option value="39" >39명</option>
									
										<option value="40" >40명</option>
									
										<option value="41" >41명</option>
									
										<option value="42" >42명</option>
									
										<option value="43" >43명</option>
									
										<option value="44" >44명</option>
									
										<option value="45" >45명</option>
									
										<option value="46" >46명</option>
									
										<option value="47" >47명</option>
									
										<option value="48" >48명</option>
									
										<option value="49" >49명</option>
									
										<option value="50" >50명</option>
									
										<option value="51" >51명</option>
									
										<option value="52" >52명</option>
									
										<option value="53" >53명</option>
									
										<option value="54" >54명</option>
									
										<option value="55" >55명</option>
									
										<option value="56" >56명</option>
									
										<option value="57" >57명</option>
									
										<option value="58" >58명</option>
									
										<option value="59" >59명</option>
									
										<option value="60" >60명</option>
									
										<option value="61" >61명</option>
									
										<option value="62" >62명</option>
									
										<option value="63" >63명</option>
									
										<option value="64" >64명</option>
									
										<option value="65" >65명</option>
									
										<option value="66" >66명</option>
									
										<option value="67" >67명</option>
									
										<option value="68" >68명</option>
									
										<option value="69" >69명</option>
									
										<option value="70" >70명</option>
									
										<option value="71" >71명</option>
									
										<option value="72" >72명</option>
									
										<option value="73" >73명</option>
									
										<option value="74" >74명</option>
									
										<option value="75" >75명</option>
									
										<option value="76" >76명</option>
									
										<option value="77" >77명</option>
									
										<option value="78" >78명</option>
									
										<option value="79" >79명</option>
									
										<option value="80" >80명</option>
									
										<option value="81" >81명</option>
									
										<option value="82" >82명</option>
									
										<option value="83" >83명</option>
									
										<option value="84" >84명</option>
									
										<option value="85" >85명</option>
									
										<option value="86" >86명</option>
									
										<option value="87" >87명</option>
									
										<option value="88" >88명</option>
									
										<option value="89" >89명</option>
									
										<option value="90" >90명</option>
									
										<option value="91" >91명</option>
									
										<option value="92" >92명</option>
									
										<option value="93" >93명</option>
									
										<option value="94" >94명</option>
									
										<option value="95" >95명</option>
									
										<option value="96" >96명</option>
									
										<option value="97" >97명</option>
									
										<option value="98" >98명</option>
									
										<option value="99" >99명</option>
									
								</select>
							</div>
						</td>				
					</tr>
					
										

				<tr>
					<th scope="row"><label>여행경비(1인당)<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td colspan="3">
						<div class="select normal yb_select" style="width:150px">
							<select title="경비 선택" name="travrvMny" id="travrvMny">
								<option value="">선택</option>
									
									<option value="AT1" >50만원 미만</option>
									
									<option value="AT2" >50만 ~ 100만원</option>
									
									<option value="AT3" >100만 ~ 200만원</option>
									
									<option value="AT4" >200만 ~ 300만원</option>
									
									<option value="AT5" >300만 ~ 400만원</option>
									
									<option value="AT6" >400만원 이상</option>
																	
							</select>
						</div>
					</td>				
				</tr>	

				</tbody>
				</table>
			
				<h4 class="stit_con_title">여행기본 정보</h4>
				<table class="tbl_basic">
				<caption>
					여행기본 정보
				</caption>
				<colgroup>
				<col style="width:170px">
				<col>
				</colgroup>
				<tbody>
		
				<tr>
					<th scope="row"><label>여행기간<span class="ico_tbl_must" title="필수입력"></span></label></th>
					<td>
						<span class="txt_at">출발일</span>
						<input type="text" title="출발일선택" class="insert_calendar" value="" id="startDt" name="startDt" readonly>
						<span class="txt_at">~&nbsp;&nbsp;(한국) 도착일</span>
						<input type="text" title="도착일 선택" class="insert_calendar" value="" id="endDt" name="endDt" readonly>
					</td>
				</tr>
				
				
							<tr id="tr_Item_FDMI_3" class="tr_Item tr_Item_FDMI tr_Item_trafficServ" style="">
								<th scope="row"><label>교통</label>
									<input type="hidden" class="item_korName" name="trafficServNm" id="trafficServNm" value="교통">
									<input type="hidden" class="item_title" name="trafficServ" id="trafficServ" value="">
									<input type="hidden" class="item_other" name="trafficServOther" id="trafficServOther" value="">
								</th>
								

										<td>
											<div class="tbl_line">
												<ul class="list_one_category">
									
											
												<li>
											
										
											<span class="form_block">
												
													
													
														<input type="radio" name="rdo_trafficServ" id="rdo_Item_FDMI_3_11" value="11" >
														<label for="rdo_Item_FDMI_3_11"><span></span>항공</label>
														
	
												
											</span>
										</li>
																

												<li>
											
										
											<span class="form_block">
												
													
													
														<input type="radio" name="rdo_trafficServ" id="rdo_Item_FDMI_3_12" value="12" >
														<label for="rdo_Item_FDMI_3_12"><span></span>버스</label>
														
	
												
											</span>
										</li>
																
							
											
												<li class="last">
												
											
										
											<span class="form_block">
												
													
													
														<input type="radio" name="rdo_trafficServ" id="rdo_Item_FDMI_3_13" value="13" >
														<label for="rdo_Item_FDMI_3_13"><span></span>렌트</label>
														
	
												
											</span>
										</li>
																
						
									
											</ul>
										</div>
									
									
								</td>
							</tr>																				
							
				
				<tr>
					<th scope="row"><label>요청사항</label></th>
					<td>
						<div class="tbl_line">	
							
								
								
									<textarea id="contents" name="contents" placeholder="원하는 일정, 도시 등 간략 일정을 작성해 주세요.&#13;&#10;(최대 1,000자까지 입력 가능합니다.)" title="내용입력" maxlength="1300"></textarea>
								
							
							
						</div>
					</td>
				</tr>
				</table>
				
				<div class="btn_area">
					<button type="button" class="btn_cof cfrm" onclick="saveEstimateChk()">문의하기</button>
				</div>
			</div>
		</form>

		</div>	
	</div>
	<!-- //고객센터 -->
	
	

	<div id="customerAgreePopup" class="popup_wrap">
		<div class="regular popup_block">
            <div class="popup_top">            
				<h2 class="tit_popup">개인정보 수집/이용 동의 안내</h2>
				<button type="button" class="btn_pop_close"><span>레이어팝업 닫기</span></button>
			</div>
			<div class="popup_area">
				<p class="txt_popup">원활한 견적 문의 답변을 위해 아래와 같이 고객님의 개인정보를 수집 이용 합니다.<br>동의해 주셔야만 견적 문의가 완료됩니다.</p>
				<div class="agree_box">
					<div class="agree_txt">
						<h5 class="tit_list_block">개인정보 수집/이용 동의 안내</h5>
						<p class="txt_normal">입력하신 개인정보는 견적문의 회원 관리에 사용되며 보유/이용기간 후 폐기됩니다.</p>
						<ul class="agree_info_list">
							<li>개인정보의 수집 목적 : 견적 문의에 대한 회원 관리</li>
							<li>수집하는 개인정보의 항목 : 성명, 연락처, 이메일, 휴대폰 번호</li>
							<li>보유 및 이용기간 : <em class="emp_blue">작성일로부터 6개월</em></li>
							<li>고객님은 동의를 거부 하실 수 있으며, 거부 시 견적 문의에 대한 회신을 받아보실 수 없습니다.</li>
						</ul>
					</div>
					<div class="agree_check">
						<span class="form_block"><input type="checkbox" id="agree1" name="agree"><label for="agree1"><span></span><em class="emp_black">개인정보 수집/이용 동의</em></label></span>
					</div>
				</div>
				<div class="btn_poparea">
					<button type="button" class="btn_cof cfrm" onclick="saveEstimate()">문의하기</button>
				</div>
			</div>		
		</div>
	</div>

<script>



</script>
	

</body>

<!--  =========================================================================================== -->

</html>