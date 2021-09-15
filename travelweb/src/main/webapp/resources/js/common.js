$(document).ready(function() {	
	
 /*
  * 일반 텝
  *  한화면에 여러 탭 존재 할수 있어 name="tabView" 추가 
  *  탭요소 id="tabPageCont" 추가
  *  텝 인덱스와 동일한 컨텐츠에 name="tab_page" 추가
  *   
  * <div class="tab_wrap" name="tabView>
  * 	<ul class="tab_page_cont" id="tabPageCont">
  * 		<li><a href="#">1</a></li> 0 index
  * 		...
  * 	</ul>
  * 	<div name="tab_page" class="tab_page">
  * 	...
  * </div>
  * */ 	
	$("[name='tabView']").each(function(index){		 
		var p_obj = $(this).find("[name='tab_page']");
		 p_obj.hide();
		 p_obj.eq( 0 ).show(); 
		 $(this).find("#tabPageCont > li").click(function(){			
			$(this).parent().find("li").removeClass("on");
			$(this).addClass("on");
			p_obj.hide();
			p_obj.eq( $(this).index() ).show();
		});
	});
	
	// multi tab
    $("[data-group=tabArea]").each(function() {

    	var tabMenu = $(this);
        var tabClick = tabMenu.children("[data-name=tabList]").children("li");
        var tabCont = tabMenu.children("[data-name=tabCont]").children("[data-name=tabItem]");

        tabCont.hide().first().show();
        tabClick.first().addClass("on");

        tabClick.on("click", function(e) {

            e.preventDefault();

            var tabListNum = tabClick.index(this);
            tabClick.removeClass("on");
            $(this).addClass("on");

            tabCont.hide();
            tabCont.eq(tabListNum).show();

            // radio tabs
            if ($(this).hasClass("on")) {
                $(this).children().find("input").prop("checked", "true");

            } else{
            	$(this).children().find("input").prop("checked", "false");
            }

        });
    });
	
	//플로팅
	$(window).scroll(function () {
	   var divAddHeight = 100;
	   var divMenu  = $(".floating");
	   var divFooter = $("#footer");
	   var nowPosition = $(document).scrollTop() + window.innerHeight;
	   
	   if (divFooter && divFooter.length > 0) {

		   if(nowPosition < divFooter.offset().top - divAddHeight){
			   divMenu.css({"bottom": "40px"});
		   }else{
			   divMenu.css({"bottom": nowPosition - (divFooter.offset().top-divAddHeight)+"px"});
		   }

		   //top버튼 나오게
		   if ($(window).scrollTop() > 210) {
			   $(".scroll_top").slideDown();
		   } else {
			   $(".scroll_top").slideUp();
		   }
	    }
	});
	
/********************************************************************************************************/
/********************************************************************************************************/	
/********************************************************************************************************/	
		

	//리스트 전환 탭
//	$(".tab_list").hide();
//	$("ul.tab_list_cont li:first").addClass("on").show();
//	$(".tab_list:first").show();

	$("ul.tab_list_cont li").click(function() {
		$("ul.tab_list_cont li").removeClass("on");
		$(this).addClass("on");
		$(".tab_list").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).show();
		return false;
	});

//	$(".sub_page").hide();
//	$("ul.tab_sub li:first span").addClass("on").show();
//	$(".sub_page:first").show();

	 //관심상품_스퀘어
	/*$(".btn_mini_fav").click(function() {
		$(this).toggleClass("on");
	});*/

	//관심상품_서클
	$(".btn_fav").click(function() {
		$(this).toggleClass("on");
	});
	
	//top
	$(".float_top").click(function(){
	    $("html, body").animate({ scrollTop: 0 }, 600);
	    return false;
	});

    // search history
	$(".search_area .box_result .btn_close").click(function(){
        if ($(this).closest(".box_result").children(".result").length == 1) {
	    	$(this).closest(".box_result").remove();

		}  else {
	    	$(this).parent().remove();
		}
	});

	/* 마일리지 호출 */
	fn_getMlgInfo();

 });

/* 마일리지 */	
function fn_getMlgInfo() {	
	var _mlgJoin = YBUtil.getCookie("ybtourPopup_JOIN");
	var _mlgRecive = YBUtil.getCookie("ybtourPopup_REC");
	var _uriPath = $(location).attr('href');

	if(_mlgJoin == "none" && _uriPath == "none" ) {
		return false;
	}
	if(_uriPath.indexOf("/mypage/mileageGiftReceive.yb") != -1 ||
		_uriPath.indexOf("/mypage/mileageJoin.yb") != -1 ) {
		return false;
	}
	$.ajax({
		url : '/common/selectMlgInfo.ajax',
		type : 'get',
		success : function(result) {
			if(YBUtil.isEmpty(result.mlgInfo)) {
				return false;
			}

			var agreeMlg = result.mlgInfo.agreeMlg;
			var mlgGiftcnt = Number(result.mlgInfo.mlgGiftCnt);
			// 가입 유도
			if(agreeMlg == 'N' && _mlgJoin != "done") {
				$("#mlgJoinPop").ybPopup({
					title : '노랑풍선 마일리지 가입 안내',
					contents : {url : "/common/mileageJoinPopup.yb"},
				}).data("ybPopup").open();
			} else if(mlgGiftcnt > 0 && _mlgRecive != "done") { // 선물받기
				$("#mlgRecPop").ybPopup({
					title : '노랑풍선 마일리지 선물 도착',
					contents : {url : "/common/mileageRecPopup.yb"},
				}).data("ybPopup").open();
			}
		}
	});
}