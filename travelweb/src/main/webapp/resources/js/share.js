(function($){
    $.extend({
        ybShare : function(options) {

            return new $._ybShare(options);
        },

        _ybShare : function(options) {
            var _defaults = {
                _objKey : 'ybShare',	// Object
				shareType : 'naver',
				link : '',
				title : '노랑풍선',
            };
            options = $.extend(true, this, _defaults, options);
            console.log(options)

            this.open = function() {
            	var snsShareUrl;
            	if(options.type == "facebook") {
                    snsShareUrl = 'http://www.facebook.com/share.php?u='+encodeURIComponent(options.link);
                } else if(options.type == "kakaostory") {
                    snsShareUrl = 'https://story.kakao.com/s/share?url='+encodeURIComponent(options.link)
                } else if(options.type == "naver") {
                    snsShareUrl = 'https://share.naver.com/web/shareView.nhn?url='+encodeURIComponent(options.link)+'&title='+encodeURIComponent(options.title);
                } else if(options.type == "twitter") {
                    var ranNum = Math.floor(Math.random()*10);
                    snsShareUrl = 'http://twitter.com/share?url='+encodeURIComponent(options.link)+'&text='+encodeURIComponent(options.title)+"&nocache="+ranNum;
                }
                var win = window.open(snsShareUrl ,'sharer', 'toolbar=0, status=0, width=626, height=436');
                if(win){
                    win.focus();
                }
            }
        }
    });

})(jQuery);
