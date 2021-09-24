<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<!-- css resources -->
<link href="../resources/css/common.css" rel="stylesheet">

</head>
<body>
	<%-- nabvar --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />


	<section class="content-section text-black
		text-center"
		id="services">
		<h1 class="tit_head">
			<strong>개인정보 수정</strong>
		</h1>

		<div class="container mt-3">

			<form action="/board/rewriteform" method="POST">
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
								<li><span class="form_block"><input type="radio"
										id="gender1" name="gender"><label for="gender1"><span></span>남</label></span></li>
								<li><span class="form_block"><input type="radio"
										id="gender2" name="gender"><label for="gender2"><span></span>여</label></span></li>
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
				<button type="submit" class="btn btn-primary">
					<i class="material-icons align-middle">create</i> 수정
				</button>
				<button type="button" class="btn btn-warning delete-file">
					<i class="material-icons align-middle">clear</i> 탈퇴
				</button>
			</div>
<<<<<<< HEAD
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
							<input type="text" name="mid" id="mid" value="${ id.userid }" title="아이디 입력">
						</div>
					</td>
					<th scope="row"><label>비밀번호<span class="ico_tbl_must"
							title="필수입력"></span></label></th>
					<td colspan="1">
						<div class="tbl_line">
							<input type="password" name="password" id="password" value="${ userVO.uPwd }"
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
							<li><span class="form_block"><input type="radio"
									id="gender1" name="gender"><label for="gender1"><span></span>남</label></span></li>
							<li><span class="form_block"><input type="radio"
									id="gender2" name="gender"><label for="gender2"><span></span>여</label></span></li>
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
		<div class="btn_area">
			<button type="button" class="btn_cof" id="btncancel">수정</button>
			<button type="button" class="btn_cof cfrm" id="btnok"
				onclick="save();">탈퇴</button>
=======
>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject
		</div>
<<<<<<< HEAD
		</form>

	 </div> 
=======
	</section>

>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject


	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>

</html>