<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
<title>Tour rainbow - 로그인</title>

<!-- css resources -->
<link
	href="${pageContext.request.contextPath}/resources/css/teampro.css"
	rel="stylesheet">

<link href="../resources/css/styles.css" rel="stylesheet">

</head>

<body>
	<div class="container">

		<div id="wrap">
				
				<div class="content">
					<h1 class="logo">
						<a href="/"><img src="../resources/assets/열기구.png" alt="노랑풍선"></a>
						<span>TOUR RAINBOW</span>
					</h1>
				</div>

				<div class="content">
					<form id="frmSignIn" class="yb-validation" method="post"
						action="/member/login" autocomplete="off">

						<input type="hidden" name="loginType" value="M"> <span
							class="input_row"> <span class="input_grp"> <input
								type="text" id="id" name="id" class="txt" placeholder="ID"
								title="ID 입력" value="" autofocus="autofocus" maxlength="50"
								required>
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="password" id="passwd" name="passwd" class="inp_pw"
								placeholder="PASSWORD" title="비밀번호 입력" required minlength="8"
								maxlength="20">
								<button type="button" class="btn_pw_swich">
									<span>비밀번호 보이기s</span>
								</button>
						</span>
						</span>
					</form>
					<span class="btn_area">
						<button type="submit" id="btnSignIn" class="btn_submit"
							form="frmSignIn">로그인</button>

					</span>
					<ul class="list_bar">
						<li><a href="/accounts/accountFindMain.yb">아이디/비밀번호 찾기</a></li>
						<li><a href="/">비회원 예약조회</a></li>
					</ul>

					<h2 class="tit_line">
						<em>아직 회원이 아니세요?</em>
					</h2>
					<button type="button" class="btn_basic"
						onclick="location.href='/member/join'">회원가입</button>
				</div>
			</div>
		</div>
</body>
</html>