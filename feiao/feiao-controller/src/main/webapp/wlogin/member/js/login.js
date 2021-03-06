var loginUrl = 'https://login.flyme.cn/sso/login';
var reloginUrl = 'https://login.flyme.cn/sso/dorelogin';
var unionloginUrl = 'https://login.flyme.cn/sso/unionlogin';
var checkAccountUrl = 'https://login.flyme.cn/sso/needShowKapkey';
var qrUrl = "https://login.flyme.cn/mzQrShow?qrType=0&t=";
var qrLoginUrl = "https://login.flyme.cn/mzQrLogin?qrType=0";
var qrCancelUrl = 'https://login.flyme.cn/mzCancelQrLogin?qrType=0'
var showKapkeyCode = 403001; //超过出错次数
var showErrorKakeyCode = 403002; //验证码错误
var showAccountErrorCode = 403003; //账号错误
var showPasswordErrorCode = 403006; //密码错误
var showLoginBusyCode = 500; //系统繁忙
var showAbnormalCode = 403007; //异常登录
//异常登录需要验证码
var VCodeLogin = 'https://login.flyme.cn/vCodeLogin';

var sendAbnormalVCode = "/uc/system/vcode/sendSafeNotice";

//防止iframe内嵌，只调整iframe内部页面的问题
if (window != top) {
    top.location.href = location.href;
}

if (/in\.meizu\.com/.test(location.hostname)) {
    loginUrl = loginUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    reloginUrl = reloginUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    unionloginUrl = unionloginUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    checkAccountUrl = checkAccountUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    qrUrl = qrUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    qrLoginUrl = qrLoginUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    qrCancelUrl = qrCancelUrl.replace(/\.flyme\.cn/, '.in.meizu.com')
    VCodeLogin = VCodeLogin.replace(/\.flyme\.cn/, '.in.meizu.com')
}

var clickSubmit = 0;

$(function() {
    var form = new Form();
    form.init();

    if ('CountryCode' in window) {
        window['CountryCode'].init()
        bindCycodeEvent()
    }
    /*
    $("#mainForm").click(function() {
        if (clickSubmit != 0) {
            clickSubmit = 0;
            return;
        }
        //util.removeTipsShowMsg("tips-show");
        //util.hideTip();
    });*/

});
var Form = function() {
    this.$form = $("#mainForm");
    this.$btn = $('#login');
    this.$imgKey = $('#imgKey');
    this.$account = $('#account');
    this.$cycodeBox = $('#cycode-box');
    this.$pwd = $('#password');
    this.$remember = $('#remember');
    this.reloginFlag = $('#reloginFlag').val();
    // 异常登录
    this.$abnormalInp = $('#j_abnormalInp');
    this.$abnormalCode = $('#abnormal');
    this.$getAbnormalCode = $('#j_abnormalKey');
};
$.extend(Form.prototype, {
    init: function() {
        /*var url = location.href;
        if(url.indexOf("?registedAccount=")!=-1){
            var url_params = url.split("?")[1], url_object = {}, temp;
            url_params = url_params.split("&");
            for(var l=0; l<url_params.length; l++){
                temp = url_params[l].split("=");
                url_object[temp[0]] = temp[1];
            }
            if(!!url_object['registedAccount']) this.$account.val(url_object['registedAccount']);
        }*/
        //     this.$account.focus();
        this.initParameter();
        this.initValidate();
        this.initFormEvent();
        //     util.initPlaceholder(this.$account, '手机号/ 魅族账号');
        util.initPlaceholder(this.$pwd, '密码');
        util.initPlaceholder($("#kapkey"), '验证码');
        this.initRemember();
        //this.$imgKey.click();
        // this.initQrCode();
        this.initQRPanel();
        if ($.browser.msie && $.browser.version == '6.0') {
            this.$pwd.focus();
            this.$pwd.blur();
        }

        //绑定按钮切换事件
        $('#toVCodeLogin').click(function() {
            var url = VCodeLogin + location.search;
            location.href = url;
        });

    },
    getAbnormalCode: function() {
        var that = this;
        this.$getAbnormalCode.click(function() {
            util.doAsyncGet(sendAbnormalVCode, function(json) {
                if (!json) return;
                if (json.code == 200003 || json.code != 200) {
//                    nAlert(json.message, '提示');
                    that.showErrorTips(json.code, json.message)
                    return;
                }
                that.timeDown();
            }, {
                'account': $.trim(that.$account.val())
            });
        });
    },
    showAbnormalInp: function(mes) {
        //$('#kapkeyWrap').hide();
        this.$abnormalInp.show();
        //this.$pwd.val('').next().show();
        this.$btn.css({ 'background-color': '#32a5e7' }).removeClass('unsubmit');
        this.timeDown();
        this.getAbnormalCode();
        util.showTip(mes);
        //('#j_abnormalTips').html(mes).show();
    },
    timeDown: function() {
        var that = this;
        this.$getAbnormalCode.hide();
        var s = 60;

        function fn() {
            if (s == 1) {
                that.$getAbnormalCode.show();
                $('#j_abnormalTime').hide();
                return;
            }
            s--;
            $('#j_abnormalTime').show().find('span').text(s);
            setTimeout(function() {
                fn();
            }, 1000);
        }
        fn();
    },
    initParameter: function() {
        var appuri = util.getParameter("appuri");
        var useruri = util.getParameter("useruri");
        var service = util.getParameter("service");
        var sid = util.getParameter("sid");
        this.unionlogin = sid == "unionlogin";
        var urlSubfix = "";
        if (appuri != null) {
            $('#appuri').val(appuri);
            urlSubfix = urlSubfix + "appuri=" + encodeURIComponent(appuri) + "&";
        }
        if (useruri != null) {
            $('#useruri').val(useruri);
            urlSubfix = urlSubfix + "useruri=" + encodeURIComponent(useruri) + "&";
        }
        if (service != null) {
            $('#service').val(service);
            urlSubfix = urlSubfix + "service=" + encodeURIComponent(service) + "&";
        }
        if (sid != null) {
            $('#sid').val(sid);
            urlSubfix = urlSubfix + "sid=" + encodeURIComponent(sid);
        }
        var oldLoginHerf = $("#toLogin").attr("href");
        var oldRegisterHerf = $("#toRegister").attr("href");
        if (urlSubfix != "") {
            urlSubfix = "?" + urlSubfix;
            $("#toLogin").attr("href", (oldLoginHerf + urlSubfix));
            $("#toRegister").attr("href", (oldRegisterHerf + urlSubfix));
        }
    },
    initRemember: function() {
        this.$remember.mzCheckBox({
            click: function(e, event) {}
        });
    },
    showKakey: function(code, mes) {
        if (code == showKapkeyCode) {
            $('#kapkeyWrap').show();
            this.$imgKey.click();
            //util.addTips("password", mes);
            util.showTip(mes);
            this.initResize(900);
            return true;
        }
        if (code == showErrorKakeyCode) {
            $('#kapkeyWrap').show();
            this.$imgKey.click();
            //util.addTips("kapkey", mes);
            util.showTip(mes);
            this.initResize(900);
            return true;
        }
        return false;
    },
    showErrorTips: function(code, mes) {
        if (code == showPasswordErrorCode || code == showAccountErrorCode) {
            //util.addTips("password", mes);
            //util.removeTipsShowMsg("tips-show");
            util.showTip(mes);
            return true;
        }
//        if (code == showLoginBusyCode) {
//            nAlert(mes);
//            return true;
//        }
        if (code != 200 && mes != "") {
            //util.addTipsShowMsg("tips-show", mes);
            util.showTip(mes);
            return true;
        }
        return false;
    },
    initQRPanel: function() {
        var $form = $('#mainForm')
        var $btn = $('#qr-btn')
        var $panel = $('#qr-panel')
        var qrUrl = 'https://login.flyme.cn/mzQrShow?qrType=0&_t='
        var confirmTimer = null
        var listenScan = function () {
            if(confirmTimer) clearInterval(confirmTimer)

            confirmTimer = setInterval(function () {
                util.doAsyncGet(qrLoginUrl, function(data) {
                    var r = util.getData(data)

                    if (r.confirmed) {
                        clearInterval(confirmTimer)
                        //if (r.loginurl && $.trim(r.loginurl) != '') location.href = r.loginurl
                        //reload current page to login
                        location.reload();
                        return
                    }

                    if (r.authenticated) {
                        $panel.find('.tips').addClass('hide')
                        $panel.find('.qr-success-tips').removeClass('hide')
                        /*$panel.find('.tips').fadeOut(300, function(e) {
                            $panel.find('qr-success-tips').fadeIn(300)
                        })*/
                        return
                    }

                    if (r.timeout) {
                        loadQRImg()
                        /*$panel.find('qr-success-tips').fadeOut(300, function(e) {
                            $panel.find('.tips').fadeIn(300)
                        })*/
                        $panel.find('.tips').removeClass('hide')
                        $panel.find('.qr-success-tips').addClass('hide')
                    }
                })
            }, 3000)
        }
        var loadQRImg = function () {
            $panel.find('img').attr('src', qrUrl + new Date().getTime())
        }

        if (/in\.meizu\.com/.test(location.hostname)) qrUrl = qrUrl.replace(/\.flyme\.cn/, '.in.meizu.com')

        $btn.on('click', function (e) {
            if($btn.hasClass('pc-btn')) {
                $btn.removeClass('pc-btn')
                $panel.addClass('hide')
                clearInterval(confirmTimer)
            } else {
                // 动态设置扫码框高度 60是扫码框距离顶部的距离
                var $h1 = $form[0].offsetHeight - 60
                var $h2 = $panel.height()

                $panel.css('height', Math.max($h1 - 10, $h2))

                $btn.addClass('pc-btn')
                $panel.removeClass('hide')
                loadQRImg()
                listenScan()
            }
        })
    },
    initResize: function(h) {
        global.resizer.setProperty('minH', h);
        $(document.body).css('min-height', h);
    },
    initInput: function($input, info) {
        util.initPlaceholder($input, info, 'emptyInput');
    },
    initFormEvent: function() {
        var _this = this;
        this.$btn.click(function() {
            if ($(this).hasClass('unsubmit')) {
                return;
            }
            _this.$form.submit();
        });
        var timeout = null;
        this.$form.bind("keypress", function(e) {
            if (e.keyCode == 13) {
                _this.$btn.click();
            }
        });
        this.$imgKey.click(function() {
            $(this).attr('src', '/kaptcha.do?t=' + (new Date().getTime()));
            $("#kapkey").val("");
        });
        util.addBtnFocusClass();
        util.removeTipEvent();
    },
    initValidate: function() {
        var _this = this;
        util.rule.account = util.rule.accountOrPhone;
        util.message.account = util.message.accountOrPhone;
        util.rule.account.nameOrD11 = undefined;
        var rules = util.createRule({ account: null, kapkey: null });
        var messages = util.createMes({ account: null, kapkey: null });
        var oldRemote = $.validator.methods['remote'];
        $.validator.addMethod('zRemote', function(value, element, param) {
            var newParam = param;
            var validator = this;
            var previous = this.previousValue(element);
            previous.originalMessage = this.settings.messages[element.name].remote;
            if (util.isString(param)) {
                newParam = {
                    url: param,
                    success: function(response) {
                        validator.settings.messages[element.name].remote = previous.originalMessage;
                        var r = util.getData(response, false, function() {});
                        var valid = r === true || r === "true";
                        if (valid) {
                            $('#kapkeyWrap').show();
                            _this.$imgKey.click();
                        } else {
                            $('#kapkeyWrap').hide();
                        }
                        valid = true;
                        if (valid) {
                            var submitted = validator.formSubmitted;
                            validator.prepareElement(element);
                            validator.formSubmitted = submitted;
                            validator.successList.push(element);
                            delete validator.invalid[element.name];
                            validator.showErrors();
                        }
                        previous.valid = valid;
                        validator.stopRequest(element, valid);
                    }
                }
            }
            return oldRemote.call(this, value, element, newParam);
        }, $.validator.messages['zRemote'] || '此处格式不正确');

        rules.password = {
            required: true
        };
        rules.account.zRemote = checkAccountUrl;
        messages.password = {
            required: "密码不能为空"
        };
        rules.abnormal = {
            required: true
        }
        messages.abnormal = {
            required: "请输入验证码"
        }
        messages.account.zdiyRemote = '';
        
        this.$form.validate($.extend(util.validate, {
            submitHandler: function() {
                //unbind event
                if (_this.reloginFlag) { 
                    loginUrl = reloginUrl;
                }
                if (_this.unionlogin) {
                    loginUrl = unionloginUrl;
                }
                // 极速验证
                if (!GT_status) {
                    //$('#j_geetest_error').html(GT_Tips).show();
                    util.showTip(GT_Tips);
                    return;
                }
                _this.$btn.css({ 'background-color': '#8A8B8C' }).addClass('unsubmit');

                var data = CountryCode.getFormData(_this.$form)

                var kk = cryPP.generateMix();
                data['password'] = cryPP.excutePP(data['password'], kk);

                if ($('#cycode-box').hasClass('show-cycode')) data['account'] = '00' + (data['cycode'] - 0) + ':' + data['account']
                data['unCommonlandedCode'] = $.trim(_this.$abnormalCode.val()) != '' ? $.trim(_this.$abnormalCode.val()) : ''

                $.ajax({
                    type: "post",
                    url: loginUrl,
                    dataType: "json",
                    data: data,
                    beforeSend: function(request) {
                        request.setRequestHeader("CryKK-Mix", kk);
                    },
                    success: function(result) {
                        var data = util.getData(result, false, function(mes, code) {
                            // return _this.showAbnormalInp('dgdg');
                            window.gt_captcha_obj && gt_captcha_obj.refresh();
                            if (code == showAbnormalCode) {
                                _this.showAbnormalInp(mes);
                                
                                var $footer = $('#flymeFooter')
                                $footer.css('top', parseFloat($footer.css('top')) + 150)
                                return;
                            }
                            if (code != '200' && _this.$imgKey.is(':visible')) {
                                _this.$imgKey.click();
                            }
//                            if (code == 200000 || code == 200001 || code == 200002 || code == 200003 || code == 403008) {
//                                nAlert(mes, '提示');
//                                return;
//                            }
                            //超时登录
//                            if (code == 403010) {
//                                nAlert(mes, '提示', function() {
//                                    location.reload();
//                                });
//                                return;
//                            }
                            if (_this.showKakey(code, mes)) {
                                return;
                            }
                            if (_this.showErrorTips(code, mes)) {
                                return;
                            }
                        });
                        if (data == null) {
                            if (result.code == showKapkeyCode || result.code == showPasswordErrorCode) {
                                _this.$pwd.val('');
                            }
                            //bind event
                            _this.$btn.css({ 'background-color': '#32a5e7' }).removeClass('unsubmit');
                            return;
                        };
                        location.href = data;
                    },
                    error: function(result) {
                        //bind event
                        _this.$btn.css({ 'background-color': '#32a5e7' }).removeClass('unsubmit');
                        try {
                            var txt = result.responseText && eval('(' + result.responseText + ')');
                            if (txt.code == "403") {
//                                nAlert(txt.message || '网络错误', "提示");
                                _this.showErrorTips(txt.code, txt.message || '网络错误');
                            } else {
//                                nAlert('网络错误', "提示");
                                _this.showErrorTips(txt.code, '网络错误');
                            }
                        } catch (err) {
//                            nAlert('网络错误', "提示");
                            _this.showErrorTips(txt.code, '网络错误');
                        }
                    }
                });
            },
            showErrors: function(errorMap, errorList) {
                var defShowErr = this.defaultShowErrors
                var phoneMsg = errorMap['account']
                var passwordMsg = errorMap['password']
                var abnormalMsg = errorMap['abnormal']

                if (phoneMsg == "账号不能为空") {
                    _this.showErrorTips("500", "请填写完整的登录信息");
                    delete errorMap['account']
                    clickSubmit = 1;
                    return false;
                } else if (passwordMsg == "密码不能为空") {
                    _this.showErrorTips("500", "请填写完整的登录信息");
                    delete errorMap['password']
                    clickSubmit = 1;
                    return false;
                } else if (abnormalMsg == "请输入验证码") {
                    _this.showErrorTips("500", "请填写完整的登录信息");
                    delete errorMap['abnormal']
                    clickSubmit = 1;
                    return false;
                } else if (phoneMsg) {
                    _this.showErrorTips("500", phoneMsg);
                    delete errorMap['account']
                    clickSubmit = 1;
                    return false;
                } else if (passwordMsg) {
                    _this.showErrorTips("500", passwordMsg);
                    delete errorMap['password']
                    clickSubmit = 1;
                    return false;
                } else if (abnormalMsg) {
                    _this.showErrorTips("500", abnormalMsg);
                    delete errorMap['abnormal']
                    clickSubmit = 1;
                    return false;
                }

                if (phoneMsg) {
                    _this.$cycodeBox.addClass('error')
                    if (!$('#err-tips-phone').length)
                        $('<span id="err-tips-phone" for="account" class="error">' + phoneMsg + '</span>').insertAfter(_this.$cycodeBox)
                    delete errorMap['account']
                }

                defShowErr.call(this, errorMap, errorList)
            },
            rules: rules,
            messages: messages,
            hideError:function(){},
            validClass: "aaa",
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

                if ($cycodeBox.hasClass('show-cycode')) {
                    if (/[a-z@\.\s]+/.test(v) || v.length < 6) $cycodeBox.removeClass('show-cycode')
                } else {
                    if (/^\d{6,}/.test(v) && !/\D+/.test(v)) $cycodeBox.addClass('show-cycode')
                }
            }, 200);
        }
    }();

    $account.on('keyup', keyupChk)
}
