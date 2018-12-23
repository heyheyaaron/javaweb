var authorizeUrl = '/uc/system/webjsp/forgetpwd/checkAccount';
$(function(){
    var form = new Form();
    form.init();

    if('CountryCode' in window) {
        window['CountryCode'].init()
        bindCycodeEvent()
    }
});
var Form = function(){
	this.$form = $("#mainForm");
	this.$btn = $('#nextStep');
    this.$user = $('#account');
    this.$imgKey = $('#imgKey');
};
$.extend(Form.prototype, {
	init: function(){
		this.initValidate();
		this.initFormEvent();
//        util.initPlaceholder(this.$user, '手机号／ 魅族账号');
        util.initPlaceholder($('#kapkey'), '验证码');
		this.$imgKey.click();
        //this.initResize(780);
	},
    initResize: function(h){
        global.resizer.setProperty('minH', h);
        $(document.body).css('min-height', h);
    },
    initInput: function($input, info){
        util.initPlaceholder($input, info, 'emptyInput');
    },
	initFormEvent: function(){
		var _this = this;
		this.$btn.click(function(){
            if($(this).hasClass('unsubmit')){
                return;
            }
			_this.$form.submit();
		});
		this.$form.bind("keypress", function(e){
			if (e.keyCode == 13) {
				_this.$btn.click();
			}
		});
		this.$imgKey.click(function(){
			$(this).attr('src', '/kaptcha.jpg?t='+(new Date().getTime()));
			$("#kapkey").val("");
		});
	},
	initValidate: function(){
		var _this = this;
        util.rule.account = util.rule.accountOrPhone;
        util.message.account = util.message.accountOrPhone;
        util.rule.account.nameOrD11 = undefined;
		this.$form.validate($.extend(util.validate, {
            submitHandler: function(){
                //unbind event
                _this.$btn.css({'background-color':'#8A8B8C'}).addClass('unsubmit');

                var data = CountryCode.getFormData(_this.$form)

                if($('#cycode-box').hasClass('show-cycode')) data['account'] = '00' + (data['cycode'] - 0) + ':' + data['account']

                //防止输入带有空格
                data['account'] = $.trim(data['account']);

            	$.ajax({
                    type: "post",
                    url: authorizeUrl,
                    dataType: "json",
                    data: data,
                    success: function(result){
                    	result = util.getData(result);
                       if(result == null){
                    	   _this.$imgKey.click();
                           //bind event
                            _this.$btn.css({'background-color':'#32a5e7'}).removeClass('unsubmit');
                    	   return;
                       }
                       location.href = result;
                    },
                    error: function(result){
                        //bind event
                        _this.$btn.css({'background-color':'#32a5e7'}).removeClass('unsubmit');
                       nAlert("网络错误！","提示");
                    }
                });
            },
            rules: util.createRule({account: null, kapkey: null}),
            messages: util.createMes({account: null, kapkey: null})
        }));
	}
});

function bindCycodeEvent() {
    var $cycodeBox = $('#cycode-box');
    var $account = $('#account');
    var keyupChk = function() {
        var timer;

        return function() {
            var self = this;

            timer = setTimeout(function() {
                clearTimeout(timer);

                var v = self.value;

                if($cycodeBox.hasClass('show-cycode')) {
                    if(/[a-z@\.\s]+/.test(v) || v.length < 6) $cycodeBox.removeClass('show-cycode')
                } else {
                    if(/^\d{6,}/.test(v) && !/\D+/.test(v)) $cycodeBox.addClass('show-cycode')
                }
            }, 200);
        }
    }();

    $account.on('keyup', keyupChk)
}
