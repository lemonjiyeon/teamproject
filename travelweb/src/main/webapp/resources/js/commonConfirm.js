
$(document).ready(function() {	
	
	/* 
	 * 최근 본 상품 , 관심상품 개발 오류로 이미 이전 고객 스토리지에 갱신된 내용
	 * 초기화 작업 
	 * */
	regGoodsEventDt();
	
    // tooltip close
    $(document).mouseup(function (e){
        var tooltipClose = $(".tooltip_area");

        if (!tooltipClose.is(e.target) && tooltipClose.has(e.target).length == 0) {
            tooltipClose.children().removeClass("open");
        }

        return false;
    });
    
    /*UIButton : 비밀번호 보이기*/
    $('button.btn_pw_swich').on('click', function() {
    	var $inputPW = $(this).siblings("input.inp_pw");
    	if($inputPW.is("[type=password]")){
    		$inputPW.attr("type","text");
    		$(this).addClass("on").children("span").text("비밀번호 보이기");
    	} else {
    		$inputPW.attr("type","password");
    		$(this).removeClass("on").children("span").text("비밀번호 감추기");
    	}
    });
    
    /***************************/
    /* 공통에 있어서 문제를 일으키고있던 스크립트 수정 언젠간 없애도록 해야함.. */
    $("ul.tab_sub li").click(function() {
     	event.preventDefault();
     	var idx 	= $(this).index();
     	var wrap 	= $(this).parent();
     	$('span',wrap).removeClass('on').eq(idx).addClass("on");
     	wrap.next().find(' > div').hide().eq(idx).show();	 	
    });
    /***************************/
	
});


/* 최근 본 상품 관련 기능 */
function regGoodsEventDt(){		
	
	if( undefined === localStorage.myGoodsEventDate ){
		localStorage.removeItem('ybGoodsList');
		localStorage.removeItem('ybEventList');
		var data = { reg_dt : new Date() , update_dt : new Date() }	
		localStorage.setItem("myGoodsEventDate", JSON.stringify(data) )
	}else{
		updateGoodsEventDt()
	}	
}

function updateGoodsEventDt(){
	var getData = JSON.parse( localStorage.myGoodsEventDate );	
	localStorage.setItem("myGoodsEventDate", JSON.stringify( $.extend( getData , { update_dt : new Date() } ) ) )
}

/* 최근 본 상품 관련 기능 END */

/* 상품전시 태그 공통기능 */
function prdtTag(data){
	
	/*
	 * 공통코드 네임을 가져오긴 하나 실제 사용하는 이름과 달라 일단은 이쪽에서 이름을 지정해 주는걸로..
	 * */	
	var goodsTp = {
			 C : ["cruise","크루즈"]
	       	,E : ["ticket","입장권"]
	       	,F : ["fit","에어텔"]
	       	,G : ["golf","골프"]
	       	,H : ["honey","허니문"]
	       	,J : ["local","현지투어"]
	       	,L : ["hotel","호텔"]
	       	,M : ["biz","기업단체"]
	       	,P : ["pkg","해외 패키지"]
	       	,R : ["pilgrimage","성지순례"]
	       	,S : ["discount","특가상품"]
	       	,T : ["air","항공권"]		
	       	,D : ["dmt","국내여행"]
			,K : ["semi","세미 패키지"]
  	}
	
	var brandTp = { 
			//10 : ""
			 //20 : "Blue Lavande"
			30  : ["pre","프리미엄"]
			,40 : ["light","라이트팩"]
			,50 : ["signature","시그니처 유럽"]
			
	}
	
	/*
	 * 브랜드(프리미엄,라이트팩)+우수여행상품+상품구분(해외패키지,자유여행 등) 
	 * */	
	var $fragment = $("<span/>");	//$(document.createDocumentFragment());
	var $goodsTp = ""
	var $brandTp = ""
		
	if( null != data.goodsTp && undefined != goodsTp[data.goodsTp.toUpperCase()] ){
		$goodsTp = $("<span/>", { "class" : "tag_square "+goodsTp[data.goodsTp.toUpperCase()][0] }).append( $("<span/>",{ "text" : goodsTp[data.goodsTp.toUpperCase()][1] }) )
	}
		
	if( null != data.goodsBrandCd &&  undefined != brandTp[data.goodsBrandCd] ){
		$brandTp = $("<span/>", { "class" : "tag_square "+brandTp[data.goodsBrandCd][0] }).append( $("<span/>",{ "text" : brandTp[data.goodsBrandCd][1] }) )
	}
	
	$goodsTravel =  data.goodTravelYn === "Y" ? $("<span/>",{ "class" : "tag_square good" }).append( $("<span/>",{ "text" : "우수여행" }) ) : "";
	
	
	$fragment
		.append( $("<span/>", { "class" : "tag" })
				.append( $brandTp )	
				.append( $goodsTravel )
				.append( $goodsTp ) 
		);
	
	
	return $fragment.html();
		
}

function cmmnMiniSquareTag(data){
	
	var emphasisCd = {
		"1"	 : ["bargain", "특가" ]
		,"2" : ["supply", "실속" ]
		,"3" : ["class", "품격" ]
		,"4" : ["pre" , "프리미엄"]
		,"5" : ["weekend", "주말상품"]
		,"6" : ["sale", "땡처리"]
		,"7" : ["arrival", "선착순"]
		,"8" : ["highhotel", "특급호텔"]
		,"9" : ["luxuryhotel", "초특급호텔"]
		,"A" : ["prior", "선발권특가"]
		,"B" : ["prior", "연휴"]
		,"C" : ["prior", "선발권"]
		,"D" : ["intensive", "집중"]
	}
	
	var evProgDivi = {
		"03"  : "impending"
		,"07" : "decided"	
		,"08" : "planning"
	}
	
	var $span = $("<span>",{ "class" : "tag" });
	
	if( null != data.emphasisCd && emphasisCd[data.emphasisCd.toUpperCase()] ){
		$span.append( $("<span>",{ "class" : "tag_rect "+emphasisCd[data.emphasisCd.toUpperCase()][0], "text" : emphasisCd[data.emphasisCd.toUpperCase()][1] }) )
	}
	
	if( null != data.evProgDivi && evProgDivi[data.evProgDivi] ){
		$span.append( $("<span>",{ "class" : "tag_rect "+evProgDivi[data.evProgDivi], "text" : data.evProgDiviNm }) )
	}
	
	return $("<div>").append( $span ).html(); 
}

/* 정규식 3자리마다 콤마찍기 */
function comma(str) {
    str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

/* QueryString */
function getQueryString( url ) {
    var params = {};
    url.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
}

function cmmnNoimage(obj){
	$(obj).prop("src", "/static/images/content/thumb/thumb_noimg.png");
	$(obj).prop("alt", "이미지 준비중");
}


/* 로딩 패턴 */
function callLodingBar() {	$("body").append( $("<div>").addClass("loading") ); }
function closeLodingBar() { var obj = $("body").find(".loading").remove();  }

/* 비동기 로그인체크 */
/*
 * ex)
 * cmmnlginChk().done(function(data){
	}).fail(function(data){
	})
 * */
function cmmnlginChk(){
	var deferred = $.Deferred();	
	$.ajax({
        url:'/main/lginChk.ajax',
        timeout : 0,        
        success:function(result){        	
        	if( result.CODE && result.CODE === "9999" ){
				//alert(result.CODE_MSG)//로그인 체크				
				deferred.reject(result);
        	}else{
        		deferred.resolve(result);
        	}
        },
        error:function(jqXHR, textStatus, errorThrown){
        	deferred.reject(errorThrown);
        }
    });
	return deferred.promise();
}


