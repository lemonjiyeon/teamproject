/**
 * 노랑풍선 Web Utile UserAgent Script
 * 
 * ----------------------------------------------------------------------
 * 작성자		: kgi0412
 * 작성일		: 2020.11.05
 * ----------------------------------------------------------------------
 * 1.0	2020.11.05	최초작성.
 * 
 */
(function($){
//	var _ua = navigator.userAgent;
	/* IE Version : https://msdn.microsoft.com/ko-kr/library/hh869301(v=vs.85).aspx */
	$.extend({
		UAUtil : {
			ua : navigator.userAgent,
			IE : (function(_ua){
				var _msie = _ua.match(/MSIE (\d+\.\d*)/i);
				var _trident = _ua.match(/Trident\/(\d+\.\d*)/i);
				var _rv = _ua.match(/rv:(\d+\.\d*)/i);

				var version = 0;
				_msie && _msie[1] >= 8.0 && (version = 8);
				_msie && _msie[1] >= 9.0 && _trident && _trident[1] >= 5.0 && (version = 9);
				_msie && _msie[1] >= 10.0 && _trident && _trident[1] >= 6.0 && (version = 10);
				_trident && _trident[1] >= 7.0 && _rv && _rv[1] >= 11.0 && (version = 11);

				return version;
			})(navigator.userAgent)
		}
	});

//	console.log("UA.IE", $.UAUtil.IE);
})(jQuery);
