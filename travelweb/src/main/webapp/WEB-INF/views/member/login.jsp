<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>여행을 가볍게 노랑풍선 -계정 관리</title>

<!-- css resources -->
<link
	href="${pageContext.request.contextPath}/resources/css/teampro.css"
	rel="stylesheet">

<link href="../resources/css/styles.css" rel="stylesheet">

</head>

<body>
	<div class="container">

		<div id="wrap">
			<div class="container">
				<div class="top_block">
					<a href="/"><img src="../resources/assets/열기구.png" alt="노랑풍선"
						class="top_logo"></a>
				</div>
				
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link active" href="#">Active</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#" style="color: black">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#" style="color: black" >Link</a></li>
					
				</ul>
				
				
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
								type="text" id="txtId" name="id" class="txt" placeholder="ID"
								title="ID 입력" value="" autofocus="autofocus" maxlength="50"
								required="">
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="password" id="txtPw" name="password" class="inp_pw"
								placeholder="비밀번호" title="비밀번호 입력" required="" minlength="8"
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


	</div>


</body>
</html>