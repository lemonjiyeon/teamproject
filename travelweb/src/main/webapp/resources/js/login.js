/**
 * 노랑풍선 Web Utile Login Script
 *
 * ----------------------------------------------------------------------
 * 작성자		: kgi0412
 * 작성일		: 2019.12
 * ----------------------------------------------------------------------
 * 1.0		| 최초 작성.
 */
(function($){

	$.extend({
		_ybLogin : function(options) {
			/* ***** 초기화 ****************************** */
			var _defaults = {
					_objKey : 'ybLogin',
					channelCode : '000',
					popupType : 'only',				// only : 로그인 팝업 | rsvn : 예약하기 팝업 | rvcf : 예약확인 팝업 | custom : 개별화 팝업
					nextPage : '',
//                	nonmemberTab : ''
					title : '로그인'
//					customTitle : ''
//					customUrl : ''
//					customData : ''
			};
			options = $.extend(true, this, _defaults, options);
			/* ***** 초기화 ****************************** */
//			console.log("this", this);
			
			var _returnUrl = '/accounts/signIn.yb?channelCode='+options.channelCode;

			this.open = function(){
				if (this.popupType === 'rsvn') {
					_returnUrl = _returnUrl + '&typeCode=RSVN';
					if (!$.isEmpty(this.nextPage)) {
						_returnUrl = _returnUrl + '&returnUrl='+ encodeURIComponent(this.nextPage);
					}
					window.open(_returnUrl, this.title, "width=740,height=800,menubar=no,status=no,titlebar=yes,toolbar=no,scrollbars=no,resizable=no,location=no");
				} else {
					location.href = _returnUrl;
				}
			}
		},
		ybLogin : function(options) {
			return new $._ybLogin(options);;
		}
	});

})(jQuery);