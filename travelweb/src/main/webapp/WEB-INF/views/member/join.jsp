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
<title>여행을 가볍게 노랑풍선 -계정 관리</title>

</head>
<body>
	<div id="wrap">

		<div class="container">
			<div class="top_block">
				<a href="/"><img
					src="/static/images/content/ico/ico_user_logo.png" alt="노랑풍선"
					class="top_logo"></a>
				<button type="button" class="top_login" id="btnGoSignIn">로그인</button>
			</div>

			<h1 class="tit_head">
				<strong>빠른 회원가입</strong>
			</h1>
			<div class="content">
				<input type="hidden" id="custPassChk" /> <input type="hidden"
					id="smsCertChk" /> <input type="hidden" id="smsCertChkVal" />
				<div class="block">

					<form id="frm" method="post" action="" autocomplete="on">
						<input type="hidden" id="custId" name="custId" value="" required>
						<input type="hidden" id="joinType" name="joinType" value="" /> <input
							type="hidden" id="webCustNo" name="webCustNo" value="" /> <input
							type="hidden" name="returnUrl" value="" /> <input type="hidden"
							name="snsId" value="" /> <input type="hidden" name="snsType"
							value="" /> <input type="hidden" name="snsName" value="" /> <input
							type="hidden" name="snsEmail" value="" /> <input type="hidden"
							name="oldId" value="" /> <input type="hidden"
							name="agreePointYN" value="" /> <span
							class="input_grp email_grp"> <input type="text"
							class="item_lft" title="이메일 아이디" id="txtId" value="" tabindex="1"
							autocomplete="email" autofocus="autofocus" minlength="2" required>
						
						<button type="button" class="btn_nor item_last"
							id="btnDoubleCheck" tabindex="3">중복확인</button>
							
							
						</span>
						
						
						
						<span class="input_row"> <span class="input_grp"> <input
								type="password" class="inp_pw"
								placeholder="비밀번호(영문 숫자 특수문자 조합, 8~16자리) " title="비밀번호 입력"
								onkeyup="custPw1_onkeyup(this);" tabindex="4" name="custPw1"
								id="custPw1">
								<button type="button" class="btn_pw_swich">
									<span>비밀번호 보이기</span>
								</button>
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="password" class="inp_pw" placeholder="비밀번호 확인"
								title="비밀번호  재입력" onkeyup="custPw2_onkeyup();" tabindex="5"
								name="custPw2" id="custPw2">
								<button type="button" class="btn_pw_swich">
									<span>비밀번호 보이기</span>
								</button>
						</span>
						</span> <span class="input_row"> <span class="input_grp"> <input
								type="text" class="txt" placeholder="이름(실명)" title="이름 입력"
								id="custNmKor" name="custNmKor" tabindex="6" value="" required>
						</span>
						</span>
						<!-- 얼럿메시지 시 해당 엘리먼트에 wrong 클래스 추가-->
						<span class="input_row"></span> <span class="input_grp item"></span>
						<input type="number" class="item" placeholder="휴대폰번호(숫자만 입력)"
							name="custTel" id="custTel" tabindex="7"
							oninput="maxLengthCheck(this)" maxlength="11">

						<div class="mt-4">

							<span class="rio_circle"><input type="radio" id="reten1"
								name="reten" value="female"><label for="reten1"><span></span>여</label></span>

							<span class="rio_circle"><input type="radio" id="reten2"
								name="reten" value="male"><label for="reten2"><span></span>남</label></span>

							<span class="rio_circle"><input type="radio" id="reten3"
								name="reten" value="Y0"><label for="reten3"
								style="width: 150px"><span></span>회원 탈퇴 시 까지</label></span>
						</div>
					</form>
				</div>
				<div class="btn_block">
					<button type="button" class="btn_submit" id="btnJoinSubmit">가입
						완료</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* 로그인 페이지로 이동 */
		$('#btnGoSignIn')
				.on(
						'click',
						function() {
							location.href = "https://www.ybtour.co.kr/accounts/signIn.yb?channelCode=011";
						});

		var _IS_ID_CHECK_TF = false;
		var frmValid = $('#frm').ybValidator({
			errorTemplate : "<p class='txt_check'>#=message#</p>"
		});

		var _joinObj = {
			validEmailId : function() {
				/* 초기화 */
				var $txtEmailId = $('#txtId');
				frmValid.removeValidMessage($txtEmailId);

				var strEmailId = $txtEmailId.val().trim();
				$txtEmailId.val(strEmailId);
				if ($("#selEmailList").val() !== "NONE") {
					strEmailId += "@" + $("#selEmailList").val();
				}

				/* 유효성 검사 */
				if (!$txtEmailId.val() && strEmailId.length <= 0) {
					frmValid.showValidMessage($('#txtId'), "필수 항목 입니다.");
					return false;
				}
				if (!$.isValidEmail(strEmailId)) {
					frmValid.showValidMessage($('#txtId'), "이메일 형식이 잘못되었습니다.");
					return false;
				}
				if (/([A-Z]+[a-z0-9\.\-]*)@/g.test(strEmailId)) {
					frmValid.showValidMessage($('#txtId'),
							"이메일 아이디에 영문 대문자는 사용이 불가합니다.");
					return false;
				}

				return true;
			}
		}

		/* 중복확인 처리 */
		function procDoubleCheck() {
			/* 초기화 */
			// 		frmValid.removeValidMessage($('#txtId'));
			/* 필수항목 유효성 체크 */
			if (!_joinObj.validEmailId()) {
				return false;
			}

			/* 이메일 아이디 생성 */
			var finalEmail = $("#txtId").val();
			if ($("#selEmailList").val() !== "NONE") {
				finalEmail += "@" + $("#selEmailList").val();
			}

			/* 중복확인 처리 */
			$.ybAjax({
				url : "/accounts/selectCustIdDuplicationCheck.ajax",
				data : {
					"custId" : finalEmail
				}
			}).then(function(data, textStatus, jqXHR) {
				if (data.cnt == 0) {
					_IS_ID_CHECK_TF = true;
					$('#custId').val(finalEmail);
					alert("[ " + finalEmail + " ]\n사용 가능한 아이디입니다.");
					return;
				} else {
					_IS_ID_CHECK_TF = false;
					alert("[ " + finalEmail + " ]\n사용할 수 없는 아이디입니다.");
					return false;
				}
			}, function(jqXHR, textStatus, errorThrown) {
				alert('아이디 중복 확인 중 문제가 발생하였습니다.\n다시 시도해주세요.');
			});

		}
		/* 아이디 입력 이벤트 */
		$("#txtId").on({
			"change" : function(e) {
				if (!_joinObj.validEmailId()) {
					e.preventDefault();
				}
			},
			"keypress" : function(e) {
				if (e.charCode === 64 && $("#selEmailList").val() !== "NONE")
					e.preventDefault(); // '@' 입력 불가.
			}
		});
		/* 이메일 도메인 선택상자 변경 이벤트 */
		$("#selEmailList").on(
				'change',
				function(e) {
					$(this).val() !== "NONE"
							&& $("#txtId").val().indexOf("@") >= 0
							&& $("#txtId").val("");
					$("#txtId").trigger('change').focus();
				});
		/* 중복 확인 버튼 */
		$('#btnDoubleCheck').on("click", function(e) {
			e.preventDefault();
			procDoubleCheck();
		});

		/* 초기화 ********** */
		var _regExKoEnOnly = /[^가-힣a-zA-Z]/gi;
		if ($("#custNmKor").val().length > 0) {
			var _$nm = $("#custNmKor");
			_$nm.val(_$nm.val().replace(_regExKoEnOnly, ''));
		}

		//휴대폰 인증 처리 필요
		YBmCerti.init({
			elemTime : $('.count_num'), /* 유효시간 노출 Element/selector */
		});
		var result1 = "";
		var message = "";

		$(document)
				.ready(
						function() {
							$(".btn_pw_swich").on(
									'click',
									function() {
										if ($(this).siblings(".inp_pw").is(
												"[type=password]")) {
											$(this).siblings(".inp_pw").attr(
													"type", "text");
											$(this).addClass("on").children(
													"span").text("비밀번호 보이기");
										} else {
											$(this).siblings(".inp_pw").attr(
													"type", "password");
											$(this).removeClass("on").children(
													"span").text("비밀번호 감추기");
										}
									});

							$('#allchk').on('click', function() {
								if ($('#allchk').is(':checked')) {
									$('#agreeSav').prop('checked', true);
									$('#agreeMkt').prop('checked', true);
								} else {
									$('#agreeSav').prop('checked', false);
									$('#agreeMkt').prop('checked', false);
								}
							});

							$('#agreeSav').on('click', function() {
								if ($('#agreeSav').is(':checked')) {
									if ($('#agreeMkt').is(':checked')) {
										$('#allchk').prop('checked', true);
									}
								} else {
									$('#allchk').prop('checked', false);
								}
							});

							$('#agreeMkt').on('click', function() {
								if ($('#agreeMkt').is(':checked')) {
									if ($('#agreeSav').is(':checked')) {
										$('#allchk').prop('checked', true);
									}
								} else {
									$('#allchk').prop('checked', false);
								}
							});

							//ID 중복체크 이후 수정
							$('#txtId').on('keydown', function() {
								if (_IS_ID_CHECK_TF) {
									if (confirm("입력하신 이메일 주소를 변경하시겠습니까?")) {
										_IS_ID_CHECK_TF = false;
									} else {
										$('#txtId').val($('#custId').val());
										return false;
									}
								}
							});

							//휴대폰번호 수정
							$('#custTel')
									.on(
											'keyup',
											function(e) {
												if ($('#smsCertChk').val() == 'Y') {
													if (confirm("입력하신 휴대폰번호를 변경하시겠습니까?")) {
														$('#smsCertChk').val(
																"N");
													} else {
														$('#custTel')
																.val(
																		$(
																				'#smsCertChkVal')
																				.val());
														return false;
													}
												}

												if (!(e.keyCode >= 48 && e.keyCode <= 57)) {
													var inputVal = $(this)
															.val();
													$(this)
															.val(
																	inputVal
																			.replace(
																					/[^(0-9)]/gi,
																					''));
												}
												frmValid
														.removeValidMessage($('#custTel'));
											});

							//이름은 한글 영어만
							$('#custNmKor')
									.on(
											'change',
											function(e) {
												var inputVal = $(this).val();
												if (_regExKoEnOnly
														.test(inputVal)) {
													message = '이름은 한글 영어만 입력 가능합니다.';
													frmValid.showValidMessage(
															$('#custNmKor'),
															message);
													$(this)
															.val(
																	inputVal
																			.replace(
																					_regExKoEnOnly,
																					''));
													return false;
												} else if ($(this).val().length <= 1) {
													message = '이름은 2글자 이상 입력하셔야 합니다.';
													frmValid.showValidMessage(
															$('#custNmKor'),
															message);
													return false;
												}
												frmValid
														.removeValidMessage($('#custNmKor'));
											});

							//약관펼치기
							$(".btn_infomore")
									.click(
											function() {
												$(this).toggleClass("close");
												$(this).closest("#tg_info")
														.siblings("#tg_more")
														.slideToggle("fast");

											});

							$('#btnJoinSubmit')
									.on(
											'click',
											function() {
												if (frmValid.isValid()
														&& formValidation()) {
													$
															.ajax({
																url : "/accounts/insertMember.ajax",
																type : "POST",
																async : false,
																dataType : "json",
																data : $('#frm')
																		.serialize(),
																success : function(
																		responseData,
																		textStatus,
																		jqXHR) {
																	if (responseData.RESULT_CODE === "9999") {
																		alert(responseData.RESULT_MESSAGE);
																	} else {
																		alert("가입이 완료되었습니다.");
																		if ("" == "") {
																			$(
																					'#frm')
																					.attr(
																							"action",
																							"/accounts/joinMemberComplete.yb");
																			$(
																					'#webCustNo')
																					.val(
																							responseData.data.webCustNo);
																			$(
																					'#frm')
																					.submit();
																		} else {
																			$(
																					'#frm')
																					.attr(
																							"action",
																							"");
																			$(
																					'#frm')
																					.submit();
																		}
																	}
																},
																error : function() {
																	alert('가입이 실패하였습니다.');
																}
															});
												}
											});
						});

		/*비밀번호 체크*/
		function custPw1_onkeyup(obj) {
			if ($(obj).val().length > 0) {
				var cnt = 0;
				var format1 = /[0-9]/;
				if (format1.test($(obj).val())) {
					cnt++;
				}

				var format2 = /[a-zA-Z]/;
				if (format2.test($(obj).val())) {
					cnt++;
				}

				var format3 = /[~?!@#$%<>^&*\()\-=+_\’\:\;\.\,\"\'\[\]\{\}\/\|\`]/gi;
				if (format3.test($(obj).val())) {
					cnt++;
				}

				if ((cnt >= 2 && $(obj).val().length >= 10)
						|| (cnt >= 3 && $(obj).val().length >= 8)) {
					frmValid.removeValidMessage($('#custPw1'));
					$("#custPassChk").val("Y");
				} else {
					message = '-영문,숫자,특수문자 중 2가지 종류이상을 조합으로 10자리이상<br >-영문,숫자,특수문자 중 3가지 종류이상을 조합으로 8자리이상';
					frmValid.showValidMessage($('#custPw1'), message);
					$("#custPassChk").val("N");
				}
			} else {
				$("#custPassChk").val("N");
			}
			//custPw2_onkeyup();
		}

		function custPw2_onkeyup() {
			if ($("#custPw2").val().length > 0) {
				if ($("#custPw1").val() == $("#custPw2").val()) {
					frmValid.removeValidMessage($('#custPw2'));
				} else {
					message = '비밀번호와 비밀번호 확인이 불일치합니다.';
					frmValid.showValidMessage($('#custPw2'), message);
				}
			}
		}

		//글자수 제한
		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}

		// 인증번호 받기
		function smsEachCertNum() {
			if (!$("#custTel").val().match(
					/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/)) {
				message = '휴대폰 번호를 정확히 입력하세요.';
				frmValid.showValidMessage($('#custTel'), message);
				return false;
			}

			var rcptTel = $('#custTel').val();
			$('#smsCertChk').val("N");
			var data1 = YBmCerti.sendCertNum(rcptTel);
			if (data1.errorCode == 0) {
				alert("인증번호가 휴대폰으로 발송되었습니다.");
				result1 = data1.smsCertSeq;
				$('#inputCert').show();
				$("#btnWrite").focus();
				return;
			} else {
				alert("재전송 제한 시간(3분)이 지난 후에 다시 이용해 주세요.");
				return;
			}
		}

		//인증하기
		function smsEachCertApply() {
			if ($("#btnWrite").val() == "") {
				message = '인증번호를 입력하세요.';
				frmValid.showValidMessage($('#btnWrite'), message);
				return false;
			}

			var rcptTel = $('#custTel').val();
			var data = YBmCerti.authNum(rcptTel, $("#btnWrite").val());
			if (data.errorCode == 0) {
				$('#smsCertChk').val("Y");
				$('#inputCert').hide();
				$('#smsCertChkVal').val($('#custTel').val());
				$('#btnWrite').val("");
				alert("휴대폰 인증이 완료되었습니다.");
				frmValid.removeValidMessage($('#custTel'));
			} else {
				alert("인증번호 번호가 정확하지 않습니다. 확인 후 다시 입력하세요.");
				$("#btnWrite").focus();
				return;
			}
		}

		function formValidation() {
			//아이디 체크
			if (!_IS_ID_CHECK_TF) {
				message = 'ID 중복 확인을 해주세요.';
				frmValid.showValidMessage($('#txtId'), message);
				return false;
			}

			if ($("#joinType").val() == '') {
				if ($("#custPw1").val() == '') {
					message = '비밀번호를 입력해주세요.';
					frmValid.showValidMessage($('#custPw1'), message);
					return false;
				}
				if ($("#custPw2").val() == '') {
					message = '비밀번호 확인을 입력해주세요.';
					frmValid.showValidMessage($('#custPw2'), message);
					return false;
				}
				//비밀번호 체크
				if ($("#custPw2").val() != $("#custPw1").val()) {
					message = '비밀번호가 일치하지 않습니다.';
					frmValid.showValidMessage($('#custPw2'), message);
					return false;
				}
				//비밀번호 체크
				if ($("#custPassChk").val() != "Y") {
					message = '-영문,숫자,특수문자 중 2가지 종류이상을 조합으로 10자리이상<br >-영문,숫자,특수문자 중 3가지 종류이상을 조합으로 8자리이상';
					frmValid.showValidMessage($('#custPw1'), message);
					return false;
				}
			}

			// 이름 유효성 체크
			var _$custNm = $("#custNmKor");
			if (_regExKoEnOnly.test(_$custNm.val())) {
				_$custNm.val(_$custNm.val().replace(_regExKoEnOnly, ''));
				message = '이름은 한글 영어만 입력 가능합니다.';
				frmValid.showValidMessage(_$custNm, message);
				return false;
			}
			if (_$custNm.val().length <= 1) {
				message = '이름은 2글자 이상 입력하셔야 합니다.';
				frmValid.showValidMessage(_$custNm, message);
				return false;
			}

			//휴대폰인증 체크
			if ($('#smsCertChk').val() != "Y") {
				message = '휴대폰 인증을 완료해주세요.';
				frmValid.showValidMessage($('#custTel'), message);
				return false;
			}

			//개인정보 유효기간
			if ($('input[name="reten"]').is(':checked')) {
				$('input[name="reten"]').each(function(idx, item) {
					if ($(this).is(':checked')) {
						$('#memberReten').val($(this).val());
					}
				})
			} else {
				//체크된 값이 없다면 1년
				$('#memberReten').val('Y1');
			}

			//체크박스 체크여부
			if (!$('#agreeSav').is(':checked')) {
				alert("노랑풍선 가입 약관에 동의해 주세요.");
				$('#agreeSav').focus();
				return false;
			} else {
				$('#agreeSav').val('Y');
				if ($('#agreeMkt').is(':checked')) {
					$('#agreeMkt').val('Y');
				} else {
					$('#agreeMkt').val('N');
				}
			}

			return true;
		}
	</script>

	<!-- T:footer START-->
	<div id="footer">

		<address>Ⓒ Yellow Balloon tour. All Rights Reserved.</address>


		<script src="/js/yb.util.ua.js"></script>
		<script>
			($.UAUtil.IE !== 0 && $.UAUtil.IE < 11) && $.ybPopup({
				contents : {
					url : "/static/views/MAIN/browserUpdate.html"
				}
			}).open();
		</script>
	</div>
	<!-- T:footer END -->
	</div>
	<div class="loading" style="display: none"></div>


	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 967993111;
		var google_conversion_label = "XXSqCJHb4QgQl87JzQM";
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<div style="display: none">
		<script type="text/javascript"
			src="//www.googleadservices.com/pagead/conversion.js">
			
		</script>
	</div>
	<noscript>
		<div style="display: inline;">
			<img height="1" width="1" style="border-style: none;" alt=""
				src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967993111/?value=1.00&amp;currency_code=KRW&amp;label=XXSqCJHb4QgQl87JzQM&amp;guid=ON&amp;script=0" />
		</div>
	</noscript>
	<!-- 2014.04.02 푸터 구글 스크립트 추가 -->



	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N769DH4"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->



	<script type="text/javascript" src="//static.ybtour.com/js/nlogger.js"></script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			Nethru.Settings.serviceId = 'pk_web';
			nLogger.log();
		});
	</script>

	<script>
		//넷스루 추천 반응(클릭)로그
		function nethruSendClickUrl(url) {
			//clickurl의 값들은 인코딩이 되어있어야 합니다.
			//clickurl의 값들은 추천요청 시 제공됩니다.
			try {
				nLogger.event('ds_click', {
					service_id : "pc",
					sotype : "reaction",
					product_type : "pkg",
					clickurl : url
				});
			} catch (e) {
				console.log(e);
			}
		};

		//넷스루 추천 노출로그
		function nethruRecommend(url) {
			try {
				nLogger.event('ds_offer', {
					service_id : "pc",
					sotype : "recommend",
					product_type : "pkg",
					clickurl : url
				});
			} catch (e) {
				console.log(e);
			}
		};
	</script>

</body>
<!-- ============================================================ -->

<script>
	/* 동적 추적 스크립트 */
	var _TrackingDynamic = $.extend(true, {}, _TrackingDynamic, {
		login : function() {
			/* 이곳에 PC 채널의 로그인 동적 스크립트 추가 */
		}
	/* ... 스크립트 위치 추가 */
	});
</script>


<!-- adinsight 공통스크립트 start -->
<script type="text/javascript">
	var TRS_AIDX = 11087;
	var TRS_PROTOCOL = document.location.protocol;
	var TRS_DOMAIN = "ybtour.co.kr";
	document.writeln();
	var TRS_URL = TRS_PROTOCOL
			+ '//'
			+ ((TRS_PROTOCOL == 'https:') ? 'analysis.adinsight.co.kr'
					: 'adlog.adinsight.co.kr') + '/emnet/trs_esc.js';
	document
			.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
</script>
<!-- adinsight 공통스크립트 end -->


<!-- EDN 공통스크립트 end -->
<iframe id="hfrADCheck"
	src="https://adcheck.about.co.kr/mad/prd/view?shopid=ybtour"
	scrolling="no" frameborder="0" width="0" height="0"></iframe>



<!-- 공통 호출 하단 스크립트 : 모든페이지 하단 설치 -->
<!-- PlayD TERA Log Script v1.1 -->
<script>
	var _nSA = (function(_g, _c, _s, _p, _d, _i, _h) {
		if (_i.wgc != _g) {
			var _ck = (new Image(0, 0)).src = _p + '//' + _c + '/?cookie';
			_i.wgc = _g;
			_i.wrd = (new Date().getTime());
			var _sc = _d.createElement('script');
			_sc.src = _p + '//sas.nsm-corp.com/' + _s + 'gc=' + _g + '&rd='
					+ _i.wrd;
			var _sm = _d.getElementsByTagName('script')[0];
			_sm.parentNode.insertBefore(_sc, _sm);
			_i.wgd = _c;
		}
		return _i;
	})('TR10060001557', 'ngc1.nsm-corp.com', 'sa-w.js?', location.protocol,
			document, window._nSA || {}, location.hostname);
</script>
<noscript>
	<img src="//ngc1.nsm-corp.com/?uid=TR10060001557&je=n&" border=0
		width=0 height=0>
</noscript>
<!-- LogAnalytics Script Install -->




<!-- WIDERPLANET  SCRIPT START 2019.1.22 -->
<div id="wp_tg_cts" style="display: none;"></div>
<script type="text/javascript">
	var wptg_tagscript_vars = wptg_tagscript_vars || [];
	wptg_tagscript_vars.push((function() {
		return {
			wp_hcuid : "", /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
			 *주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
			ti : "42886", /*광고주 코드 */
			ty : "Home", /*트래킹태그 타입 */
			device : "web" /*디바이스 종류  (web 또는  mobile)*/

		};
	}));
</script>
<script type="text/javascript" async
	src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2019.1.22 -->



<!-- AceCounter Log Gathering Script V.7.5.2017020801 -->
<script language='javascript'>
	var _AceGID = (function() {
		var Inf = [ 'gtp1.acecounter.com', '8080', 'AM3A34627437260', 'AW',
				'0', 'NaPm,Ncisy', 'ALL', '0' ];
		var _CI = (!_AceGID) ? [] : _AceGID.val;
		var _N = 0;
		var _T = new Image(0, 0);
		if (_CI.join('.').indexOf(Inf[3]) < 0) {
			_T.src = (location.protocol == "https:" ? "https://" + Inf[0]
					: "http://" + Inf[0] + ":" + Inf[1])
					+ '/?cookie';
			_CI.push(Inf);
			_N = _CI.length;
		}
		return {
			o : _N,
			val : _CI
		};
	})();
	var _AceCounter = (function() {
		var G = _AceGID;
		var _sc = document.createElement('script');
		var _sm = document.getElementsByTagName('script')[0];
		if (G.o != 0) {
			var _A = G.val[G.o - 1];
			var _G = (_A[0]).substr(0, _A[0].indexOf('.'));
			var _C = (_A[7] != '0') ? (_A[2]) : _A[3];
			var _U = (_A[5]).replace(/\,/g, '_');
			_sc.src = (location.protocol.indexOf('http') == 0 ? location.protocol
					: 'http:')
					+ '//cr.acecounter.com/Web/AceCounter_'
					+ _C
					+ '.js?gc='
					+ _A[2]
					+ '&py='
					+ _A[4]
					+ '&gd='
					+ _G
					+ '&gp='
					+ _A[1]
					+ '&up=' + _U + '&rd=' + (new Date().getTime());
			_sm.parentNode.insertBefore(_sc, _sm);
			return _sc.src;
		}
	})();
</script>
<noscript>
	<img src='http://gtp1.acecounter.com:8080/?uid=AM3A34627437260&je=n&'
		border='0' width='0' height='0' alt=''>
</noscript>
<!-- AceCounter Log Gathering Script End -->


<!-- Withpang Tracker v3.0 [공용] start -->
<script type="text/javascript">
	function mobRf() {
		var rf = new EN();
		rf.setSSL(true);
		rf.sendRf();
	}
</script>
<script src="https://cdn.megadata.co.kr/js/enliple_min2.js" async="true"
	onload="mobRf()"></script>
<!-- Withpang Tracker v3.0 [공용] end -->




</html>