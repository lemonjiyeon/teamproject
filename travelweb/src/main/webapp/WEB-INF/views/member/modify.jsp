<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<!-- css resources -->
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/content.css" rel="stylesheet">

</head>
<body>

	<!-- //lnb -->

	<div class="content" id="content">
		<h3 class="tit_con_title">개인정보 수정</h3>

		<form name="mbrFrm" id="mbrFrm" method="post">
			<input type="hidden" name="webCustNo" id="webCustNo"
				value="12017282560" /> <input type="hidden" name="email" id="email"
				value="" /> <input type="hidden" name="mobileRcpYn"
				id="mobileRcpYn" value="Y" /> <input type="hidden" name="emailYn"
				id="emailYn" value="Y" /> <input type="hidden" name="mobileChk"
				id="mobileChk" value="N" /> <input type="hidden" name="oldMobileNo"
				id="oldMobileNo" value="01057565050" /> <input type="hidden"
				name="marryYn" id="marryYn" value="" /> <input type="hidden"
				name="agreeMkt" id="agreeMkt" value="Y" /> <input type="hidden"
				name="custId" id="custId" value="mylovetjrl@naver.com"> <input
				type="hidden" name="reten" id="reten" value=""> <input
				type="hidden" name="genderCd" id="genderCd" value="">

			<div class="block_tit_area title">
				<h4 class="stit_con_title">기본정보</h4>
			</div>
			<table class="tbl_basic">
				<caption>기본정보 수정</caption>
				<colgroup>
					<col style="width: 200px">
					<col>
					<col style="width: 200px">
					<col>
				</colgroup>
				<tr>
					<th scope="row"><label>아이디<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td colspan="1">
						<div class="tbl_line">
							<input type="text" name="mid" id="mid" value="" title="아이디 입력">
						</div>
					</td>
					<th scope="row"><label>비밀번호<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td colspan="1">
						<div class="tbl_line">
							<input type="password" name="password" id="password" value=""
								title="비밀번호 입력">
						</div>
				</tr>
				<tr>
					<th scope="row"><label>이름(실명)<span
							class="ico_tbl_must" title="필수입력"></span></label></th>
					<td><input type="text" name="custNmKor" id="txtName" value=""
						title="이름 입력" placeholder="예) 주노랑"></td>
					<th scope="row"><label>성별</label></th>
					<td>
						<ul class="list_one_category">
							<li><span class="form_block"><input type="radio" id="gender1" name="gender"><label
								for="gender1"><span></span>남</label></span></li>
							<li><span class="form_block"><input type="radio" id="gender2" name="gender"><label
								for="gender2"><span></span>여</label></span></li>
						</ul>
					</td>
				</tr>

				<tr>
					<th scope="row"><label>휴대폰 번호<span
							class="ico_tbl_must" title="필수입력"></span></label></th>
					<td colspan="3">
						<div class="tbl_line">
							<input type="number" name="mobileTel" id="mobileTel" value=""
								title="휴대폰 번호 입력">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row"><label>생년월일</label></th>
					<td colspan="3"><input type="number" name="birthDt"
						id="birthDt" value="" placeholder="예) 20180101"
						oninput="maxLengthCheck(this)" minlength="8" maxlength="8"
						onkeyup="keyUpInNumber(this);"></td>
				</tr>
			</table>
		</form>

		<div class="btn_area">
			<button type="button" class="btn_cof" id="btncancel">수정</button>
			<button type="button" class="btn_cof cfrm" id="btnok"
				onclick="save();">탈퇴</button>
		</div>
	</div>
	

	<!-- //마이페이지 -->

</body>

<!--  =============================================================================  -->





</html>