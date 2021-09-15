var YBUtil = {
	/**
	 * 전화번호 앞자리 eeeeeee
	 * 전화번호 앞자리.......
	 */
	arrTel : new Array(
			'010','011','016','017','018','019',
			'02', '031', '032', '033', '041', '042', '043', '044',
			'051', '052', '053', '054', '055', '061', '062', '063', '064',
			'070', '0505'),

	arrMobile : new Array('010','011','016','017','018','019'),

	/**
	 * Ajax 공통
	 *
	 * @param _method
	 * @param _url
	 * @param _jsonObj
	 *            (parameter)
	 * @param _callback
	 *            (성공, 실패시 전부 _callback 값으로 return)
	 * @param _options
	 *            (Object type)
	 * @param _header
	 */
	ajax: function (_method, _url, _jsonObj, _callback, _options, _header) {
	    var _params = {};

	    var option = {
	        async: true,
	        timeout: 0,
	        dataType : "json",
	        crossDomain : false,
	        cache : false,
	        lodingBar : true,
	        contentType : "application/x-www-form-urlencoded;charset=UTF-8"

	    };

	    option = $.extend(option, _options);

    	if (YBUtil.contain(option.contentType.toString(), "json")) {
    		_params = _jsonObj ? JSON.stringify(_jsonObj) : '';
    		// _params = _jsonObj ? JSON.stringify(jsonfy(_jsonObj)) : '';
    	} else {
    		_params = _jsonObj;
    	}

    	console.log(_params);

	    $.ajax({
	    	cache : option.cache,

	        type: _method,
	        url: _url,
	        contentType: option.contentType,
	        beforeSend: function (request) {
	            if (_header) {
	                _header(request);
	            }
	            if(option.lodingBar){
	            	YBUtil.showLodingBar();
	            }
	        },
	        crossDomain: option.crossDomain,
	        dataType: option.dataType,
	        data: _params,
	        async: option.async,
	        timeout:option.timeout,
	        success: function (data, textStatus, jqXHR) {
	            if (_callback) {
	                _callback(data, textStatus, jqXHR);
	            }
	        },
	        complete: function (data) {
	        	if(option.lodingBar){
	        		YBUtil.hidenLodingBar();
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {

	            // ResponseEntity.ok(null) 인 경우 처리.
	            if(jqXHR.status == "200"){
	                if (_callback) {
	                    _callback(null, textStatus, jqXHR);
	                }
	                return true;
	            }
	            try {
	                console.log("status : " + jqXHR.status);
	                console.log("code : " + jqXHR.responseJSON.code);
	                console.log("message : " + jqXHR.responseJSON.message);
	                console.log("detailMessage : "
	                    + jqXHR.responseJSON.detailMessage);
	            } catch (e) {
	                console.log(e);
	            }
	        }
	    });
	},

	fileupload : function(_url, _targetId, _callback, _options){

	    var option = {
	    		dataType : "json",
	    		beforesubmit : "",
	    		async : false,
	    		cache : false,
		};

	    option = $.extend(option, _options);

        $("#"+_targetId).ajaxSubmit({
			async : option.async,
			cache : option.cache,
			type : "POST",
			dataType : option.dataType,
			url : _url,
			success: function (data, textStatus, jqXHR) {
	            if (_callback) {
	                _callback(data, textStatus, jqXHR);
	            }
			},
			error : function(data) {
				alert("File check error");
				console.log(JSON.stringify(data));
				return false;
			}
		});
	},

	/**
	 * 비어있는지 확인
	 *
	 * @param str
	 * @returns {Boolean}
	 */
    isEmpty: function (_str) {
        return typeof _str == 'undefined' || _str === null
            || typeof _str == 'string' && !_str.trim();
    },

    /**
	 * 안비었는지 확인
	 *
	 * @param str
	 * @returns
	 */
    isNotEmpty: function (_str) {
        return !YBUtil.isEmpty(_str);
    },

    /**
	 * 숫자만 입력.
	 *
	 * @param obj
	 * @returns {Boolean}
	 */
	checkNum : function(_obj) {
		var flag = false;
		if (isNaN(_obj.val())) {
			_obj.val("");
			_obj.focus();
			flag = true;
		}
		return flag;
	},

    /**
     * 숫자만 입력.
     *
     * @param obj
     * @returns {Boolean}
     */
    checkKeyupNum : function(_obj) {
        var flag = false;
        if (isNaN($(_obj).val())) {
            $(_obj).val("");
            _obj.focus();
        }
    },

	keyupMoney : function(_obj) {
		var _val = $(_obj).val();
		if(_val == "0") {
			$(_obj).val("");
		}
		if (isNaN(_val+"".replace(/,/gi, ""))) {
			$(_obj).val("");
		}
		$(_obj).val(_val.replace(/,/gi, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	},

	/**
	 * 전화번호 앞자리
	 *
	 * @param _obj
	 *            적용할 엘리먼트
	 * @param _selectedVal
	 *            선택된값
	 * @param mobileYn
	 *            모바일 여부
	 */
	setPhoneNumber : function (_obj, _selectedVal, _mobileYn){

		var numberList = _mobileYn=="Y" ? YBUtil.arrMobile : YBUtil.arrTel;
		var selected = "";

		for(var i in numberList){
 			if(_selectedVal == numberList[i]){
				selected ="selected";
			}else{
				selected ="";
			}

			_obj.append("<option value='"+numberList[i]+"' "+selected+">"+numberList[i]+"</option>");
		}
	},

    /**
	 * 시간
	 *
	 * @param obj
	 */
    setHour: function(_obj){
    	var time = "";
    	for (var i = 0; i < 24; i++) {

    		if( i <= 9){
    			time = "0"+i;
    		}else{
    			time = i;
    		}

    		_obj.append("<option value='"+time+"'>"+time+" 시</option>");
		}
    },

	/**
	 * 시간 설정.
	 *
	 * @param _obj
	 * @param from
	 * @param to
	 */
    setPeriodHour: function(_obj, from, to){
    	var time = "";
    	for (var i = from; i <= to; i++) {

    		if( i <= 9){
    			time = "0"+i;
    		}else{
    			time = i;
    		}

    		_obj.append("<option value='"+time+"'>"+time+" 시</option>");
		}
    },

	/**
	 * 분
	 *
	 * @param obj
	 */
	setMinute: function(_obj){
		var time = "";
    	for (var i = 0; i < 60; i++) {

    		if( i <= 9){
    			time = "0"+i;
    		}else{
    			time = i;
    		}

    		_obj.append("<option value='"+time+"'>"+time+"분</option>");
		}
	},

	/**
	 * 일정 간격(per) 마다 분을 생성한다.
	 *
	 * @param _obj
	 * @param _per
	 */
	setPerMinute: function(_obj, _per){
		var time="";
    	for (var i = 0; i < 60; i=i+_per) {
    		if( i <= 9){
    			time = "0"+i;
    		}else{
    			time = i;
    		}
    		_obj.append("<option value='"+time+"'>"+time+"분</option>");
		}
	},

	/**
	 * 전화 번호 형식으로 변경.
	 *
	 * @param str
	 * @returns {String}
	 */
	toPhoneFormat : function(_str) {
		var returnStr = "";
		if (_str.length == 11) {
			returnStr = _str.substring(0, 3) + "-" + _str.substring(3, 7) + "-"
					+ _str.substring(7);
		} else if (_str.length == 10) {
			returnStr = _str.substring(0, 3) + "-" + _str.substring(3, 6) + "-"
					+ _str.substring(6);
		} else {
			returnStr = _str;
		}
		return returnStr;
	},

	/**
	 * 이미지 여부
	 *
	 * @param val
	 * @returns {Boolean}
	 */
    isImageFile : function (_val) {
        if (_val.length > 0) {
            var regExp = /(.jpg|.jpeg|.gif|.png)$/i;

            if (regExp.test(_val)) {
                return true;
            }
        } else if (_val == '') {
            return false;
        }
        return false;
    },

    /**
	 * jpg 파일 여부
	 *
	 * @param val
	 * @returns {Boolean}
	 */
    isJpegFile : function (_val) {
        if (_val.length > 0) {
            var regExp = /(.jpg|.jpeg)$/i;

            if (regExp.test(_val)) {
                return true;
            }
        } else if (_val === '') {
            return false;
        }

        return false;
    },

    /**
	 * zip 파일 여부
	 *
	 * @param val
	 * @returns {Boolean}
	 */
    isZipFile : function (_val) {
        if (_val.length > 0) {
            var regExp = /(.zip)$/i;

            if (regExp.test(_val)) {
                return true;
            }
        } else if (_val == '') {
            return false;
        }

        return false;
    },

    /**
	 * 엑셀 파일 여부.
	 *
	 * @param val
	 * @returns {Boolean}
	 */
    isExcelFile : function (_val) {
        if (_val.length > 0) {
            var regExp = /(.xlsx|.xls)$/i;

            if (!regExp.test(_val)) {
                return true;
            }
        } else if (_val == '') {
            return false;
        }

        return false;
    },

	/**
	 * 해당 문자열의 Bytes를 리턴한다.
	 *
	 * @param s
	 * @returns {Number}
	 */
	getByte : function(_s) {
		var sum = 0;
		var len = _s.length;
		for (var i = 0; i < len; i++) {
			var ch = _s.substring(i, i + 1);
			var en = escape(ch);
			if (en.length <= 4) {
				sum++;
			} else {
				sum += 2;
			}
		}
		return sum;
	},

	/**
	 * 입력 값이 유효한 이메일 형식인지를 검사한다.
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	checkEmail : function(_val) {
		if (_val.length > 0) {
			var regExp = /[a-z0-9.\-]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;

			if (!regExp.test(_val)) {
				return false;
			}
		} else if (_val == '') {
			return false;
		}

		return true;
	},

	/**
	 * 핸드폰 번호 유효성 체크 (format : '-' 없이)
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	checkMobile : function(_val){
		if (_val.length > 0) {
			var regExp = /^01[016789]\d{3,4}\d{4}$/;

			if (!regExp.test(_val)) {
				return true;
			}
		} else if (_val == '') {
			return true;
		}

		return false;
	},

	/**
	 * 핸드폰 번호에 '-' 를 넣는다.
	 *
	 * @param str
	 * @returns
	 */
    toMobileFormat: function (_str) {
        return _str.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
    },

    /**
	 * 일반전화 번호에 '-' 를 넣는다.
	 *
	 * @param str
	 * @returns
	 */
    toTelFormat: function (_str) {
        return _str.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
    },

	/**
	 * 일반 전화 체크(format : '-' 없이)
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	checkPhone : function(_val){
		if (_val.length > 0) {
			var regExp =  /^\d{2,3}\d{3,4}\d{4}$/;;

			if (!regExp.test(_val)) {
				return true;
			}
		} else if (_val == '') {
			return true;
		}

		return false;
	},

	/**
	 * 숫자와 . 만 입력가능. 소수점 두번째 자리까지 체크한다.
	 */
	checkPoint : function(_val) {
		var flag = false;
		var regExp = /^[0-9.]*$/i;

		if (!regExp.test(_val)) {
			alert("입력글자에 숫자와 점 이외에 다른값이 있습니다.");
			flag = true;
		} else if (5 < _val.length) {
			alert("입력글자에 길이가 5보다 큽니다.");
			flag = true;
		} else {
			var temps = _val.split(".");
			if (2 < temps.length) {
				alert("소수점이 한개 이상 존재 합니다.");
				flag = true;
			}else if(1 == temps.length){
				return false;
			}else {
				if (2 < temps[1].length) {
					alert("소수점이하 둘째 이상 존재 합니다.");
					flag = true;
				}
			}
		}
		return flag;
	},

	/**
	 * 특정 문자를 변환한다.
	 *
	 * @param _str
	 * @param _orgStr
	 *            변경될 문자
	 * @param _changeStr
	 *            변경할 문자
	 * @returns
	 */
	replaceAll : function(_str, _orgStr, _changeStr){
		return _str.split(_orgStr).join(_changeStr);
	},

	/**
	 * 한글 영문 바이트수
	 *
	 * @param val
	 * @returns {Number}
	 */
	byteLength : function(_val){
		var cnt = 0;
		for (var i = 0; i < _val.length; i++) {
			var c = escape(_val.charAt(i));

			if(c.length == 1){
				cnt++;
			}else if(c.indexOf("%u") != -1){
				cnt += 2;
			}else if(c.indexOf("%") != -1){
				cnt += c.length/3;
			}
		}
		return cnt;
	},

	/**
	 * 비밀 번호 연번 체크 영문, 숫자 혼합하여 6~20자리 이내
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	checkPassword : function(_val) {
		var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if(!reg_pwd.test(_val)){
			return false;
		}
		return true;
	},

	/**
	 * 사업자 번호 유효성 체크
	 *
	 * @param bizID
	 * @returns {Boolean}
	 */
	checkBizNum : function(_bizID){
        var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
        var i, Sum=0, c2, remander;

        _bizID = _bizID.replace(/-/gi,'');

        for (i=0; i<=7; i++){
               Sum += checkID[i] * _bizID.charAt(i);
        }

        c2 = "0" + (checkID[8] * _bizID.charAt(8));
        c2 = c2.substring(c2.length - 2, c2.length);

        Sum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));

        remander = (10 - (Sum % 10)) % 10 ;

        if(_bizID.length != 10){
               return true;
        }else if (Math.floor(_bizID.charAt(9)) != remander){
               return true;
        }else{
               return false;
        }
	},

	/**
	 * 필수값 체크
	 *
	 * @param obj
	 * @returns {Boolean}
	 */
	checkReqValue : function(_obj){
		if(_obj.val().length == 0 ){
			_obj.focus();
			return true;
		}
		return false;
	},

	/**
	 * 필수값 체크 textarea 인경우 title로 제목을 적어야 한다.
	 *
	 * @returns {Boolean}
	 */
	checkReqValid : function(){
		var flag = false;
		$("*[valid=Y]").each(function(){
			if(!$(this).is(":disabled")){

				var thisVal = $(this).val();
				var title = $(this).parents("td").prev("th").html();

				// textarea 가 필수 인경우
				if($(this).prop("tagName") == "textarea"){
					thisVal = $(this).html();
					title = $(this).attr("title");
				}

				if (YBUtil.isNotEmpty(title)) {
					title = YBUtil.replaceAll(title, "*", "").trim();
                    title = title.replace('<em class="ast"></em>', '');
				}
				if (YBUtil.isEmpty(thisVal)) {
					alert(title + " 은(는) 필수 값 입니다.");
					$(this).focus();
					flag = true;
					return false;
				}
			}
		});
		return flag;
	},

    /**
	 * 필수값 체크
	 *
	 * @params Form id
	 * @returns {Boolean}
	 */
    checkReqValidByForm : function(_formId){
        var flag = false;
        $("#" + _formId).find("*[valid=Y]").each(function(){
            if(!$(this).is(":disabled")){

                var thisVal = $(this).val();
                var title = $(this).parents("td").prev("th").html()

                // textarea 가 필수 인경우
                if($(this).prop("tagName") == "textarea"){
                    thisVal = $(this).html();
                    title = $(this).attr("title");
                }

                if(YBUtil.isNotEmpty(title)) {
                    title = YBUtil.replaceAll(title, "*", "").trim();
                }

                if (YBUtil.isEmpty(thisVal)) {
                    alert(title + " 은(는) 필수 값 입니다.");
                    $(this).focus();
                    flag = true;
                    return false;
                }
            }
        });
        return flag;
    },

	/**
	 * 전화번호 자리수 체크
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	checkPhoneNumLength : function(_val){
		if (_val.length == 11 ||  _val.length == 10 || _val.length == 9) {
			return false;
		}
		return true;
	},

	/**
	 * 널 여부 boolean
	 *
	 * @param _val
	 * @returns {Boolean}
	 */
	checkNvl : function(_val) {
		if (_val == undefined || _val.trim() == ""
			|| _val == null || _val == "null") {
			return true;
		} else {
			return false;
		}

	},

	/**
	 * null 을 "" 으로 변경.
	 *
	 * @param _val
	 * @returns
	 */
	nvl : function(_val) {
		if (_val == undefined || _val == "") {
			return "";
		} else {
			return _val;
		}
	},

   nvl2 : function(_str, dfVal) {
        var _defaultValue = "";

        if (typeof dfVal != 'undefined') {
            _defaultValue = dfVal;
        }

        if (typeof _str == "undefined" || _str == null || _str == '' || _str == "undefined") {
            return _defaultValue;
        }

        return _str;
    },

	/**
	 * null 을 _tobe 으로 변경.
	 *
	 * @param _val
	 * @returns
	 */
	nvlTo : function(_val, _tobe) {
		if (_val == undefined || _val == "") {
			return _tobe;
		} else {
			return _val;
		}
	},

	/**
	 * 마지막 문제 제거
	 *
	 * @param val
	 * @param ch
	 * @returns
	 */
	deleteLastChar : function(_val, _ch) {
		return _val.substring(0, _val.lastIndexOf(_ch));
	},

	/**
	 * Ajax 로딩바 호출
	 */
	showLodingBar : function(){
		$("div[id^=loadingAJAX]").show();
	},

	/**
	 * Ajax 로딩바 호출 제거
	 */
	hidenLodingBar : function(){
		$("div[id^=loadingAJAX]").hide();
	},

	/**
	 * 값 null 유무
	 *
	 * @param val
	 * @returns {Boolean}
	 */
	isNullValue : function(_val){
		if(_val != null && _val.length > 0){
			return false;
		}else{
			return true;
		}
	},

	/**
	 * Object null 유무
	 *
	 * @param obj
	 * @returns {Boolean}
	 */
	isNullObj : function(_obj){
		return _obj == null;
	},

	/**
	 * 문자열 포함 유무.
	 *
	 * @param findStr
	 * @param str
	 * @returns {Boolean}
	 */
	contain : function(_findStr, _str){
		return _findStr.indexOf(_str) !== -1;
	},

    /**
	 * 파일 이름 구하기
	 *
	 * @param _filePath
	 *            fullPath
	 * @returns
	 */
    getFileName : function(_fileFullPath){
    	return _fileFullPath.substring(_fileFullPath.lastIndexOf("\\")+1, _fileFullPath.length);
    },

	/**
	 * 문자열 포함 유무.
	 *
	 * @param findStr
	 * @param str
	 * @returns {Boolean}
	 */
	contain : function(_findStr, _str){
		return _findStr.indexOf(_str) !== -1;
	},


	/**
	 * popup close;
	 */
	selfClose : function(){
	    window.opener.parent.location.reload();
		window.self.close();
	},

	/**
	 * popup close;
	 */
	popupClose : function(){
		window.self.close();
	},

	imageFileCheck : function(_val){
		return _val.match(/\.(gif|jpg|jpeg|png)$/i);
	},

	/**
	 * 윈도우 팝업
	 *
	 * @param _url
	 * @param _method
	 * @param _target
	 *            (poupName)
	 * @param _formId
	 *            (post 요청시만 필요.)
	 * @param _options
	 *            (Object type)
	 */
	windowPopup: function (_url, _method, _target, _formId, _options) {
		 var option = {
			 width : 1000,
			 height : 810,
			 scrollbars : 'yes',
			 status : 'no',
			 toolbar : 'no',
		     menubar : 'no'
		 }

		option = $.extend(option, _options);


	    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

	    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

	    var left = ((width / 2) - (option.width / 2)) + dualScreenLeft;
	    var top = ((height / 2) - (option.height / 2)) + dualScreenTop;


		if(_method.toLowerCase() == 'post'){
			var popup = window.open("", _target, "top=" + top + ", left=" + left + ", width=" + option.width + ", height=" + option.height +
					", menubar="+ option.menubar +", status="+ option.status +", toolbar="+ option.toolbat +", scrollbars="+ option.scrollbars +"");
			popup.focus();

			var myForm = $("#"+_formId);
			myForm.attr("target", _target);
			myForm.attr("method", _method);
			myForm.attr("action", _url);
			myForm.submit();



		}else{
			window.open(_url, _target, "top=" + top + ", left=" + left + ", width=" + option.width + ", height=" + option.height +
					", menubar="+ option.menubar +", status="+ option.status +", toolbar="+ option.toolbat +", scrollbars="+ option.scrollbars +"");
		}

	},

	/**
	 * jquery ID 형식으로 리턴한다.
	 *
	 * @param targetId
	 * @returns
	 */
	makeJqueryId : function(targetId){
        var firstChar = targetId.substr(0, 1);
        if(firstChar == "#"){
           return targetId;
        }else{
           return "#" + targetId;
        }
     },

    /**
	 * Objcet 비교
	 *
	 * @param _x
	 * @param _y
	 * @returns {Boolean}
	 */
    ObjectEquals :
    	function( x, y ) {
    		console.log(x);
    		console.log(y);
    		  if ( x === y ) return true;
    		  if ( ! ( x instanceof Object ) || ! ( y instanceof Object ) ) return false;
    		  if ( x.constructor !== y.constructor ) return false;

    		  for ( var p in x ) {
	    		    if ( ! x.hasOwnProperty( p ) ) continue;
	    		    if ( ! y.hasOwnProperty( p ) ) return false;
	    		    if ( x[ p ] === y[ p ] ) continue;
	    		    if ( typeof( x[ p ] ) !== "object" ) return false;
	    		    if ( ! YBUtil.ObjectEquals( x[ p ],  y[ p ] ) ) return false;
    		  }

    		  for ( p in y ) {
    			  if ( y.hasOwnProperty( p ) && ! x.hasOwnProperty( p ) ) return false;
    		  }
    		  return true;
    },

	/**
	 * Date format 을 yyyy.mm.dd 형태로 변환 한다.
	 *
	 * @param date
	 * @returns {String}
	 */
	getFormatDate : function(date){
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;

		var day = date.getDate();
			day = day >= 10 ? day : '0' + day;

		return  year + '.' + month + '.' + day;
	},

	/**
	 * 특정 달의 첫일 을 구한다.
	 *
	 * @param _date
	 * @returns
	 */
	getFirstDateInMonth : function(_date){
		_date.setDate(1);
	    return DateUtil._getFormatDate(_date);
	},

	/**
	 * _year 년전
	 *
	 * @param _date
	 * @param _year
	 * @returns
	 */
	getDateAgoYear : function(_date, _year){
		_date.setYear(_date.getYear() - _year);

	    return DateUtil._getFormatDate(_date);

	},

	/**
	 * 한주의 월요일 날짜
	 *
	 * @param _date
	 * @returns
	 */
	getFirstDateInWeek : function(_date){
	    var i = _date.getDay();

	    if(i == 0) {
	        count = -6;
	    } else {
	        count = 1 - i;
	    }

	    _date.setDate(_date.getDate() + count);

	    return DateUtil._getFormatDate(_date);
	},

	/**
	 * 달력 셋팅용 오늘, 이번주, 이번달, 지난달 의 날짜를 구한다.
	 *
	 * @param _starDate
	 * @param _endDate
	 * @param _type
	 */
	getDatePeriod : function(_starDate, _endDate, _type){
		var now = new Date();
		var startDate = $("#"+_starDate);
		var endDate = $("#"+_endDate);
		var startSendDate = $("#_"+_starDate);
		var endSebdDate = $("#_"+_endDate);

		switch (_type) {
		case "today":
			startDate.val(DateUtil._getFormatDate(new Date()));
			endDate.val(DateUtil._getFormatDate(new Date()));
			startSendDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date()), "-", ""));
			endSebdDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date()), "-", ""));
			break;
		case "week":
			startDate.val(DateUtil._getFirstDateInWeek(new Date()));
			endDate.val(DateUtil._getFormatDate(new Date()));
			startSendDate.val(YBUtil.replaceAll(DateUtil._getFirstDateInWeek(new Date()), "-", ""));
			endSebdDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date()), "-", ""));
			break;
		case "month":
			startDate.val(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth(), 1)));
			endDate.val(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth()+1, 0)));
			startSendDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth(), 1)), "-", ""));
			endSebdDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth()+1, 0)), "-", ""));
			break;
		case "agoMonth":
			startDate.val(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth()-1, 1)));
			endDate.val(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth(), 0)));
			startSendDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth()-1, 1)), "-", ""));
			endSebdDate.val(YBUtil.replaceAll(DateUtil._getFormatDate(new Date(now.getFullYear(), now.getMonth(), 0)), "-", ""));
			break;
		default:
			startDate.val("");
			endDate.val("");
			startSendDate.val("");
			endSebdDate.val("");
			break;
		}
	},

	/**
	 * 현재 날자 시간를 가져온다.
	 *
	 * @returns {String}
	 */
	getTimeStamp : function() {
		var d = new Date();
		var s = DateUtil._leadingZeros(d.getFullYear(), 4) + '-'
				+ DateUtil._leadingZeros(d.getMonth() + 1, 2) + '-'
				+ DateUtil._leadingZeros(d.getDate(), 2) + ' ' +

				DateUtil._leadingZeros(d.getHours(), 2) + ':'
				+ DateUtil._leadingZeros(d.getMinutes(), 2) + ':'
				+ DateUtil._leadingZeros(d.getSeconds(), 2);

		return s;
	},

	/**
	 * 현재 날자를 가져온다.
	 *
	 */
	getDay : function(){
		var d = new Date();
		var s = YBUtil._leadingZeros(d.getFullYear(), 4)
		+ YBUtil._leadingZeros(d.getMonth() + 1, 2)
		+ YBUtil._leadingZeros(d.getDate(), 2);

		return s;
	},

	/**
	 * 날짜 타입으로 변경.
	 *
	 * @param n
	 * @param digits
	 * @returns {String}
	 */
	_leadingZeros : function(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	},

    /*
    * 생년월일 체크
    * @param _str
    * 		value값
    */
    isBirthDate : function(_str) {
        if (_str.length < 8) {
            return true;
        }
        if (isNaN(_str)) {
            return true;
        }
        if(_str < 0) {
            return true;
        }
        return false
    },

	/**
	 * 날짜 타입으로 변경.
	 *
	 * @param n
	 * @param digits
	 * @returns {String}
	 */
	leadingZeros : function(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	},

	/**
	 * 1주일, 15일, 1달 날짜 표기
	 *
	 * @param iYear
	 * @param iMonth
	 * @param iDay
	 * @param seperator
	 * @returns {String}
	 */
	getCalculatedDate : function(iYear, iMonth, iDay, seperator) {
		// 현재 날짜 객체를 얻어옴.
		var gdCurDate = new Date();
		// 현재 날짜에 날짜 게산.
		gdCurDate.setYear( gdCurDate.getFullYear() + iYear );
		gdCurDate.setMonth( gdCurDate.getMonth() + iMonth );
		gdCurDate.setDate( gdCurDate.getDate() + iDay );

		// 실제 사용할 연, 월, 일 변수 받기.
		var giYear = gdCurDate.getFullYear();
		var giMonth = gdCurDate.getMonth()+1;
		var giDay = gdCurDate.getDate();
		// 월, 일의 자릿수를 2자리로 맞춘다.
		giMonth = "0" + giMonth;
		giMonth = giMonth.substring(giMonth.length-2,giMonth.length);
		giDay   = "0" + giDay;
		giDay   = giDay.substring(giDay.length-2,giDay.length);
		// display 형태 맞추기.
		return giYear + seperator + giMonth + seperator +  giDay;
	},

	newWin: function (_formId, _url, _options) {

        var option = {
            winName: "popup",
            isDuplicate: false, // 계속 팝업을 띄울지 여부.
            fullscreen: "no", // 전체 창. (yes/no)(default : no)
            location: "no", // 주소창이 활성화. (yes/no)(default : yes)
            menubar: "no", // 메뉴바 visible. (yes/no)(default : yes)
            titlebar: "yes", // 타이틀바. (yes/no)(default : yes)
            toolbar: "no", // 툴바. (yes/no)(default : yes)
            resizable: "yes", // 창 사이즈 변경. (yes/no)(default : yes)
            scrollbars: "yes", // 스크롤바. (yes/no)(default : yes)
            width: "500px", // 창 가로 크기
            height: "800px" // 창 세로 크기
        };

        option = $.extend(option, _options);

        if (option.isDuplicate) {
            option.winName = option.winName + new Date();
        }

        var frm = document.getElementById(_formId);

        var popObj = window.open("", option.winName, "fullscreen="
            + option.fullscreen + ",location=" + option.location
            + ",menubar=" + option.menubar + ",titlebar=" + option.titlebar
            + ",toolbar=" + option.toolbar + ",resizable="
            + option.resizable + ",scrollbars=" + option.scrollbars
            + ",width=" + option.width + ",height=" + option.height);

        /*
		 * 팝업시 left/top 제외 시킴. =>
		 * /etrust/src/main/webapp/WEB-INF/tiles/view/header.jsp ==>
		 * class="solo"
		 */
        var _input = document.createElement("textarea");
        _input.name = "isPop";
        _input.value = true;
        _input.style.display = 'none';

        frm.appendChild(_input);

        frm.action = _url;
        frm.target = option.winName;
        frm.method = "post";
        frm.submit();

        return popObj;
    },

    numberFormat: function (value) {
        return (parseInt(value + "".replace(/,/gi, "")) + "")
            .replace(/\D/g, "")
            .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },

    getByte: function (text, iByte) {
        var b = 0;

        if (text && text.length > 0) {
            for (var i = 0, iCnt = text.length; i < iCnt; i++) {
                var charCode = text.charCodeAt(i);
                if (charCode <= 0x00007F) {
                    b += 1;
                } else if (charCode <= 0x0007FF) {
                    b += 2;
                } else if (charCode <= 0x00FFFF) {
                    if (iByte) {
                        b += iByte;
                    } else {
                        b += 3;
                    }
                } else {
                    b += 4;
                }
            }
        }

        return b;
    },

    cutStr: function (str, limit, iByte) {
        var strLength = 0;
        var strTitle = "";
        var strPiece = "";

        for (var i = 0; i < str.length; i++) {
            var charCode = str.charCodeAt(i);
            // var ch = str.substr(i,1).toUpperCase();
            var ch = str.substr(i, 1);
            if (charCode <= 0x00007F) {
                strLength += 1;
            } else if (charCode <= 0x0007FF) {
                strLength += 2;
            } else if (charCode <= 0x00FFFF) {
                if (iByte) {
                    strLength += iByte;
                } else {
                    strLength += 3;
                }
            } else {
                strLength += 4;
            }

            if (strLength > limit) { // 제한 길이 확인
                break;
            } else {
                strTitle = strTitle + ch; // 제한길이 보다 작으면 자른 문자를 붙여준다.
            }
        }

        return strTitle;
    },

    pad: function (n, width) {
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    },

	/**
	 * 에러 메세지 처리
	 *
	 * @param obj 체크할 Object
	 * @param msg 에러 메세지
	 * @param targetObj 표시할 타겟(특이 케이스에 사용)
	 */
    errorMsg: function(obj, msg) {
    	var _obj;
		if($.type(obj) === 'string') {
			_obj = $("#"+obj);
		} else if($.type(obj) === 'object') {
			_obj = $(obj);
		} else {
			return false;
		}

    	if(_obj.get(0).tagName == "SELECT") {
            _obj.next().find('button').focus();
        } else {
            _obj.focus();
        }
		$("[id^=msgErr_]").remove();
    	var labelId = 'msgErr_'+_obj.attr("id");
        var _pObj = $('<p/>',{'id': labelId, 'class':'must_check', 'text' : msg});
		if(_obj.attr("type") == "checkbox" || _obj.get(0).tagName == "SELECT") {
            _obj.parent().parent().find('.must_check').remove();
			_obj.parent().parent().append(_pObj);
    	} else {
            _obj.parent().find(".must_check").remove();
			if(_obj.parent().find(".btn_nor").length > 0) {
				_obj.parent().find(".btn_nor").after(_pObj);
			} else {				
				_obj.parent().append(_pObj);
			}
		}
		_obj.focus();


        if(_obj.get(0).tagName == "SELECT" || _obj.attr("type") == "checkbox") {
			_obj.on("change", function () {
				$("[id^=msgErr_]").remove();
			});
		} else {
			_obj.on("keyup", function () {
				if(!YBUtil.isEmpty(_obj.val()) && event.keyCode != 13) {
					$("[id^=msgErr_]").remove();
				}
			});
		}
    },


	configMsg: function(obj, msg, cssColor) {
		var _obj;
		if($.type(obj) === 'string') {
			_obj = $("#"+obj);
		} else if($.type(obj) === 'object') {
			_obj = $(obj);
		} else {
			return false;
		}

		var labelId = 'msgCof_'+_obj.attr("id");
        var _pObj = $('<p/>',{'id': labelId, 'class':'must_check', 'text' : msg});
		if(!YBUtil.isEmpty(cssColor)) {
			_pObj.addClass(cssColor);
		}
        _obj.parent().find('.must_check').remove();
		_obj.parent().append(_pObj);
	},

    setSelect: function(obj, dataArr, selVal) {
    	var _obj;
    	if($.type(obj) === 'string') {
    		_obj = $("#"+obj);
    	} else {
    		_obj = $(obj);
    	}

    	_obj.find('option').remove();
    	$.each(dataArr, function(idx, itm){
			$('<option/>', {'value' : itm.value }).text( itm.text ).appendTo(_obj);
		});
    	_obj.val(selVal);
    },

    getLocalStorage : function(name) {
		try {
			if( ('localStorage' in window) &&
					window['localStorage'] !== null &&
					localStorage.getItem(name) !== null &&
					localStorage.getItem(name) != "null") {
				return String(localStorage.getItem(name));
			} else {
			    return "";
			}
		} catch (e) {
			return "";
		}
	},

	setLocalStorage : function(name, str) {
		try{
			return localStorage.setItem(name, str);
		} catch (e) {
		}
	},

	deleteLocalStorage : function(name) {
		try{
			return localStorage.removeItem(name);
		} catch (e) {
		}
	},

	getSessionStorage : function(name) {
		try {
			if( ('sessionStorage' in window) &&
				window['sessionStorage'] !== null &&
				sessionStorage.getItem(name) !== null &&
				sessionStorage.getItem(name) != "null") {
				return String(sessionStorage.getItem(name));
			} else {
				return "";
			}
		} catch (e) {
			return "";
		}
	},

	setSessionStorage : function(name, str) {
		try{
			return sessionStorage.setItem(name, str);
		} catch (e) {
		}
	},

	deleteSessionStorage : function(name) {
		try{
			return sessionStorage.removeItem(name);
		} catch (e) {
		}
	},

	goSnsShare : function(snsType) {
		var snsUrl = "";
		if(snsType == "naver") {
            snsUrl = "";
		}
		window

	},

    // 페이지이동
    goUrl : function(formId, url){
		if(YBUtil.isNotEmpty(formId) && YBUtil.isNotEmpty(url)){
			$("#"+formId).attr("target", "");
			$("#"+formId).attr({
				action : url,
				method : "POST"
			}).submit();
		}else{
			alert("formId or url 은 필수값입니다.");
		}
	},

	addHttp : function(val){
		if (val && !val.match(/^http([s]?):\/\/.*/)) {
			val = 'http://' + val;
		}

		return val;
	},

	noImage : function(obj){
		$(obj).prop("src", "/static/images/content/thumb/thumb_noimg.png");
		$(obj).prop("alt", "이미지 준비중");
	},

    isMinorCheck : function(ymd, chkNum) {
        if(this.isEmpty(ymd)) {
            return true;
        }

        var today = new Date();
        var birthday = new Date(ymd.substring(0,4),ymd.substring(4,6),ymd.substring(6,8));
        var years = today.getFullYear() - birthday.getFullYear();
        birthday.setFullYear(today.getFullYear());
        if( birthday < today) {
            years--;
        }
        console.log(years);
        console.log(chkNum);
        if(years < chkNum) {
            return true;
        }
        return false;
    },

	setCookie : function (cName, cValue, cDay, cPath, cDomain){
		var expire = new Date();
		expire.setDate(expire.getDate() + Number(cDay));
		cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
		if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toString() + ';';
		cookies += ((cPath) ? "; path=" + cPath : "") + ((cDomain) ? "; domain=" + cDomain : "")
		document.cookie = cookies;

	},

	// 쿠키 가져오기
	getCookie : function (cName) {
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		if(start != -1){
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}
};

var StringBuffer = function() {
    this.buffer = new Array();
};

StringBuffer.prototype.append = function(str) {
    this.buffer[this.buffer.length] = str;
};

StringBuffer.prototype.toString = function() {
    return this.buffer.join("");
};