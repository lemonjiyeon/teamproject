<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<%-- header --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<link
	href="${pageContext.request.contextPath}/resources/css/teampro.css"
	rel="stylesheet">
<title>Tour rainbow - 회원가입</title>

</head>
<body>
	<div id="wrap">

		<div class="container">
			<div class="top_block">
				<a href="/"><img src="../resources/assets/열기구.png" alt=""
					class="top_logo"></a>
				<button type="button" class="top_login" id="btnGoSignIn">로그인</button>
			</div>
			<div class="top_block">
				<a href="/">Tour rainbow</a>
			</div>

			<h1 class="tit_head">
				<strong>회원가입</strong>
			</h1>
			<div class="content">

				<div class="block">

					<form id="frm" method="post" action="/member/join"
						autocomplete="on">
						<span class="input_grp email_grp"> <input type="text"
							placeholder="아이디 입력" class="item_lft" id="userid" name="userid"
							required>

							<button type="button" class="btn_nor item_last"
								id="btnDoubleCheck" tabindex="3">중복확인</button>

						</span> <span class="input_row"> <span class="input_grp"> <input
								type="password" class="txt"
								placeholder="비밀번호(영문 숫자 특수문자 조합, 8~16자리) " name="uPwd"
								id="custPw1" tabindex="6" required>
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="password" class="txt" placeholder="비밀번호 확인" name="custPw2"
								id="custPw2" tabindex="6" value="" required> <small
								id="passwdHelp" class="form-text text-muted">비밀번호는 필수
									입력요소 입니다.</small>
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="text" class="txt" placeholder="이름(실명)" title="이름 입력"
								id="custNmKor" name="uName" tabindex="6" value="" required>
						</span>
						</span>
						
						<span class="input_row">
							<span class="input_grp"> 
									<span class="align-middle">생년월일</span>
									<input type="date" class="form-control" id="birthday"
										name="uBirth">
							</span>
						</span>
						
						<span class="input_row"> <span class="input_grp"> <input
								type="text" class="txt" placeholder="이메일" title="이메일"
								id="custemail" name="uEmail" tabindex="6" value="" required>
						</span>
						</span>
						<!-- 얼럿메시지 시 해당 엘리먼트에 wrong 클래스 추가-->
						<span class="input_row"></span> <span class="input_grp item"></span>
						<input type="number" style="width:300px" class="item" placeholder="휴대폰번호(숫자만 입력)"
							name="uTel" id="custTel">
		
						<div class="mt-4">

							<label for="reten3" style="font-size: 20px;"><span>성별</span></label>

							<input type="hidden" id="memberReten" name="memberReten" /> <span
								class="rio_circle"><input type="radio" id="reten1"
								name="uGender" value="M"><label for="reten1"><span></span>남</label></span>

							<span class="rio_circle"><input type="radio" id="reten2"
								name="uGender" value="W"><label for="reten2"><span></span>여</label></span>
						</div>
						<div class="btn_block">
							<button type="submit" class="btn_submit" id="btnJoinSubmit">가입완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />


</body>
<!-- ============================================================ -->

<script>
	$('button#btnDoubleCheck').on(
			'click',
			function() {

				let userid = $('input#userid').val();
				if (userid.length == 0) {
					return;
				}

				//ajax 함수 호출
				$.ajax({
					url : '/api/members/' + userid + '.json',
					method : 'GET',
					success : function(data) {
						console.log(typeof data); // object
						console.log(data); // {}

						if (data.count == 0) {
							alert('사용가능한 아이디 입니다.')

						} else { // data.count ==1
							alert('이미 사용중인 아이디 입니다.')
						}
					},
					error : function(request, status, error) {
						alert('code: ' + request.status + '\n message: '
								+ request.responseText + '\n error: ' + error);
					}
				});
			});

	$('input#custPw2').on(
			'focusout',
			function() {

					if ($('input#custPw1').val() == $('input#custPw2').val()) {
						$('small#passwdHelp').html('비밀번호가 일치합니다.').removeClass(
								'text-muted').removeClass('text-danger').addClass(
								'text-success');
					} else {
						$('small#passwdHelp').html('비밀번호가 일치하지 않습니다.').removeClass(
								'text-muted').removeClass('text-success').addClass(
								'text-danger');
					}
				
				
			});
	
	
	$('button#btnJoinSubmit').on('click', function(){
		if($('input#custPw1').val().length >= 8){
			$('button#btnJoinSubmit').submit();
		}
		else{
			alert('비밀번호를 8자 이상 입력해주세요.');
			return false;
		}
	});
	
</script>



</html>