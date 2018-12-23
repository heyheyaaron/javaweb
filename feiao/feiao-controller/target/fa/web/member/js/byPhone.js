var authorizeUrl = '/uc/system/webjsp/forgetpwd/isValidSmsVCode';
var getKeyUrl = '/uc/system/vcode/sendCgiSmsVCode';
var validPhoneUrl = '/uc/system/webjsp/member/isMyPhone';
$(function() {
  var form = new Form();
  form.init();

  if ('CountryCode' in window) {
    window['CountryCode'].init()
    bindCycodeClickEvent();
  }
});
var Form = function() {
  this.$form = $("#mainForm");
  this.$btn = $('#nextStep');
  this.$getKey = $('#getKey');
  this.$phone = $('#phone');
  this.$hasEmail = $('#hasEmail');
  this.$changeValid = $('.changeValid');
  
  
  this.user = util.getParameter('user');
};
$.extend(Form.prototype, {
  init: function() {
    this.initParam();
    this.initValidate();
    this.initFormEvent();
    this.checkedIsEmail();
    //        util.initPlaceholder($('#phone'), '手机号码');
    util.initPlaceholder($('#vcode'), '验证码');
    //this.initResize();
    util.disableVcode(this.$getKey);
  },
  initParam: function() {
    this.account = $("#account").val();
    var urlAppeal = $("#a-appeal").attr("href") + "?account=" + this.account;
    $("#a-appeal").prop("href", urlAppeal);
  },
  checkedIsEmail: function() {
    if (this.$hasEmail.val() == 'y') {
      $('.changeValid').addClass('show');
    }
  },
  initInput: function($input, info) {
    util.initPlaceholder($input, info, 'emptyInput');
  },
  initResize: function() {
    global.resizer.setProperty('minH', 800);
    //$(document.body).css('min-height', 800);
  },
  initFormEvent: function() {
    var _this = this;
    this.$btn.click(function() {
      if ($(this).hasClass('unsubmit')) {
        return;
      }
      _this.$form.submit();
    });
    this.$form.bind("keypress", function(e) {
      if (e.keyCode == 13) {
        _this.$btn.click();
      }
    });
    util.initVcode(this.$getKey, getKeyUrl, 60, function() {}, function(after, dealCount) {
      var time = new Date().getTime();
      nAlert('<p>请输入图中文字</p><p class="normalInput"><input type="text" value="" name="kapmap" id="kapmap" class="kapkey" maxlength="6" autocomplete="off"><img id="imgKey" class="pointer" title="点击可刷新验证码" src="/kaptcha.jpg?t='+time+'"></p>', "提示", function() {
        var param = {};
        param.kapkey = $('#kapmap').val();
        param.phone = '00' + ($('#cycode').val() - 0) + ':' + _this.$phone.val();
        param.vCodeTypeValue = "9";
        util.doAsyncPost(getKeyUrl, function(result) {
          result = util.getData(result, false, function(mes, code, callback) {
            callback();
          });
          if (result == true) {
            dealCount();
          }
        }, param);

      });
      $("#kapmap").focus();

      function refreshImg() {
        $("#imgKey")[0].src = "/kaptcha.jpg?t=" + new Date().getTime();
        return false;
      }
      $("#imgKey").click(refreshImg);
      $(".alertDialogMain").css("border", "none");
    });
    this.$changeValid.click(function() {
      location.href = '/uc/system/webjsp/forgetpwd/toMail?account=' + location.href.split('=')[1];
    });
  },
  initValidate: function() {
    var _this = this;
    // util.rule.phone.zdiyRemote = undefined;
    this.$form.validate($.extend(util.validate, {
      submitHandler: function() {
        //unbind event
        _this.$btn.css({
          'background-color': '#8A8B8C'
        }).addClass('unsubmit');

        var data = CountryCode.getFormData(_this.$form)

        if ($('#cycode-box').hasClass('show-cycode')) data['phone'] = '00' + ($('#cycode').val() - 0) + ':' + data['phone']
        data['vCodeTypeValue'] = 9

        $.ajax({
          type: "post",
          url: authorizeUrl,
          data: data,
          dataType: "json",
          success: function(result) {
            result = util.getData(result);
            if (result == null) {
              _this.$btn.css({
                'background-color': '#32a5e7'
              }).removeClass('unsubmit');
              return;
            }
            if (result.result == null) {
              //bind event
              _this.$btn.css({
                'background-color': '#32a5e7'
              }).removeClass('unsubmit');
              return;
            }
            location.href = result.url
              //location.href = '/uc/system/webjsp/forgetpwd/toResetPwd?account=' + _this.account;
          },
          error: function(result) {
            //bind event
            _this.$btn.css({
              'background-color': '#32a5e7'
            }).removeClass('unsubmit');
            nAlert("网络错误！", "提示");
            $(".alertDialogMain").css("border", "")
          }
        });
      },
      showErrors: function(errorMap, errorList) {
        var defShowErr = this.defaultShowErrors
        var phoneMsg = errorMap['phone']
        var $cycodeBox = $('#cycode-box')

        $cycodeBox.removeClass('error')
        if (phoneMsg) {
          $cycodeBox.addClass('error')
          if (!$('#err-tips-phone').length)
            $('<span id="err-tips-phone" for="phone" class="error">' + phoneMsg + '</span>').insertAfter($cycodeBox)
          delete errorMap['phone']
        }

        defShowErr.call(this, errorMap, errorList)
      },
      rules: util.createRule({
        phone: {
          zdiyRemote: validPhoneUrl + '?account=' + _this.account
        },
        vcode: null
      }),
      messages: util.createMes({
        phone: {
          zdiyRemote: '您输入的不是绑定手机'
        },
        vcode: null
      })
    }));
  }
});

function bindCycodeClickEvent() {
  $('#cycode-container').delegate('li', 'click', function() {
    var account = $('#phone').val();
    //已输入手机号的需要二次校验
    if ($.trim(account) != '') {
      if ($('#cycode-box').hasClass('show-cycode')) account = '00' + ($('#cycode').val() - 0) + ':' + account;
      $.ajax({
        type: "get",
        url: validPhoneUrl + '?account=' + account + '&phone=' + encodeURIComponent(account),
        dataType: "json",
        success: function(result) {
          if (result.code == 500) {
            $('#cycode-box').addClass('error')
            if (!$('#err-tips-phone').length) {
              $('<span id="err-tips-phone" for="phone" class="error">您输入的不是绑定手机</span>').insertAfter($('#cycode-box'));
              util.disableVcode($('#getKey'));
            }
          } else {
            $('#cycode-box').removeClass('error');
            $('#err-tips-phone').remove();
            util.activeVcode($('#getKey'));
          }
        }
      });
    }
  });
}