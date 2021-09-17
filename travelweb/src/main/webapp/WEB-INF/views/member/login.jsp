<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>여행을 가볍게 노랑풍선 -계정 관리</title>
  
    <!-- css resources -->
     <link href="${pageContext.request.contextPath}/resources/css/teampro.css" rel="stylesheet">
</head>
 
<body>

<div class="container">
			
	<div id="wrap">
		<div class="container">
			<div class="content">
				<h1 class="logo">
					<img src="../resources/assets/images/고양이.png"
						alt="노랑풍선"></a>
				</h1>
				<form id="frmSignIn" class="yb-validation" method="post"
					action="/member/login" autocomplete="off">

					<input type="hidden" name="loginType" value="M"> <span
						class="input_row"> <span class="input_grp"> <input
							type="text" id="txtId" name="id" class="txt"
							placeholder="이메일 주소 혹은 ID" title="이메일 주소 혹은 ID 입력" value=""
							autofocus="autofocus" maxlength="50" required="">
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
					<li><a
						href="/accounts/nonMemberReserveAuth.yb?channelCode=011">비회원
							예약조회</a></li>
				</ul>
				<h2 class="tit_line">
					<em>간편하게 로그인하기</em>
				</h2>
				<ul class="list_sns">
					<li><button type="button" class="btn_sns naver" value="naver">
							<span>네이버 아이디로 로그인</span>
						</button></li>
					<li><button type="button" class="btn_sns kakao" value="kakao">
							<span>카카오톡 아이디로 로그인</span>
						</button></li>
					<li><button type="button" class="btn_sns facebook"
							value="facebook">
							<span>페이스북 아이디로 로그인</span>
						</button></li>
					<!-- 				<li><button type="button" class="btn_sns google" value='google'><span>구글 아이디로  로그인</span></button></li> -->
					<li><button type="button" class="btn_sns apple" value="apple">
							<span>애플 아이디로 로그인</span>
						</button></li>
				</ul>
				<h2 class="tit_line">
					<em>아직 회원이 아니세요?</em>
				</h2>
				<button type="button" class="btn_basic"
					onclick="location.href='/accounts/joinMain.yb?channelCode=011'">회원가입</button>
				<ul class="list_blt mgtb">
					<li>노랑풍선 회원으로 가입을 하시면 포인트 적립, <br>회원전용혜택 등 더 많은 서비스를 이용하실
						수 있습니다.
					</li>
				</ul>
			</div>
		</div>


		<script>
			/* 비밀번호 보이기 / 감추기 */
			$(".btn_pw_swich").on(
					'click',
					function() {
						var $inputPW = $(this).siblings(".inp_pw");
						if ($inputPW.is("[type=password]")) {
							$inputPW.attr("type", "text");
							$(this).addClass("on").children("span").text(
									"비밀번호 보이기");
						} else {
							$inputPW.attr("type", "password");
							$(this).removeClass("on").children("span").text(
									"비밀번호 감추기");
						}
					});

			var _modLogin = {
				init : function() {
					$("#txtId").val("");
					$("#txtPw").val("");
				},
				isValid : function() {
					// 		if($.isEmpty($("input[name=channelCode]").val())) {
					// // 			$('#loginMessage').text("필수 입력값을 확인해주세요.");
					// 			console.log("필수 입력값을 확인해주세요.");
					// 			return false;
					// 		}
					return true;
				}
			};
			// pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$"
			var frmValid = $('#frmSignIn').ybValidator({
				messages : {
					required : function(itm) {
						var inputId = $(itm).attr('id');
						if (inputId === "txtId") {
							return "아이디를 입력하세요.";
						} else if (inputId === "txtPw") {
							return "비밀번호를 입력하세요.";
						} else
							return false;
					}
				}
			});

			/* 회원 로그인 */
			$('#btnSignIn').on('click', function(e) {
				if (frmValid.isValid() && _modLogin.isValid()) {
					$('#frmSignIn').submit();
				} else {
					console.log("유효성 체크 중 오류가 발생하였습니다.");
					e.preventDefault();
				}
			});
			$('#txtPw').on('keypress', function(e) {
				e.keyCode == 13 && $('#btnSignIn').trigger('click');
			});

			/* 소셜 로그인 */
			$('button.btn_sns').on(
					'click',
					function(e) {
						e.preventDefault();
						location.href = "/accounts/sns/signIn.yb?snsType="
								+ $(this).val();
					});

			/* 비회원 예약하기 */
			$('#btnNonMemberReserve').on('click', function() {
				$.ybLog.d('비회원 예약하기 진행.');
				location.href = '/accounts/signInCompleteReturn.yb';
			});

			$(document).ready(function() {
				if ("" === 'ERROR') {
					// 		if ("" === 'unidentified' || "" === 'notFound') {
					// 			frmValid.showValidMessage($('#txtId'), "");
					// 		}
					// 		if ("" === 'badCredential') {
					// 			frmValid.showValidMessage($('#txtPw'), "");
					// 		}	// 정책 변경으로 메세지 출력 수정.
					frmValid.showValidMessage($('#txtPw'), "");
				}
				/* 초기화 */
				_modLogin.init();
			});
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
		<iframe name="google_cookie_match_frame"
			title="Google cookie match frame" width="1" height="1"
			src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" frameborder="0"
			marginwidth="0" marginheight="0" vspace="0" hspace="0"
			allowtransparency="true" style="display: none" scrolling="no"></iframe>
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
	<script language="javascript"
		src="https://analysis.adinsight.co.kr/emnet/trs_esc.js"></script>

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
	<div id="wp_tg_cts" style="display: none;">
		<script id="wp_tag_script_1631681815471"
			src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1gjtcm8-dtabnv-3-1&amp;wp_uid=2-93a0d2c9eeefd89e2f3c698b6386f844-s1624519292.83292%7Cwindows_10%7Cchrome-te535k&amp;ty=Home&amp;ti=42886&amp;device=web&amp;charset=UTF-8&amp;tc=1631681815471&amp;ref=https%3A%2F%2Fwww.ybtour.co.kr%2Fproduct%2Fmain.yb%3Fmenu%3DDMT%26dspSid%3DAD00000&amp;loc=https%3A%2F%2Fwww.ybtour.co.kr%2Faccounts%2FsignIn.yb%3FchannelCode%3D011"></script>
	</div>
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
	<script type="text/javascript" async=""
		src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<!-- // WIDERPLANET  SCRIPT END 2019.1.22 -->


	<!-- AceCounter Log Gathering Script V.7.5.2017020801 -->
	<script language="javascript">
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
						+ '&up='
						+ _U
						+ '&rd='
						+ (new Date().getTime());
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
	<script src="https://cdn.megadata.co.kr/js/enliple_min2.js"
		async="true" onload="mobRf()"></script>
	<!-- Withpang Tracker v3.0 [공용] end -->

	<div style="display: none; visibility: hidden;">
		<script>
			_trs_analysis();
		</script>


	</div>
</body>
</html>