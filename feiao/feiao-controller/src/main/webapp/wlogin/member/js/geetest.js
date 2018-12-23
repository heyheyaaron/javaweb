// 极速验证
var GT_status = false,
	GT_sever_is_down = false,
    GT_Tips = '请拖动滑块完成验证';
var gtFailbackFrontInitial = function(result) {
    var s = document.createElement('script');
    s.id = 'gt_lib';
    s.src = 'https://static.geetest.com/static/js/geetest.0.0.0.js';
    s.charset = 'UTF-8';
    s.type = 'text/javascript';
    document.getElementsByTagName('head')[0].appendChild(s);
    var loaded = false;
    s.onload = s.onreadystatechange = function () {
        if (!loaded && (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete')) {
            loadGeetest(result);
            loaded = true;
        }
    };
}
//get  geetest server status, use the failback solution

var loadGeetest = function(config) {
    //1. use geetest captcha
    window.gt_captcha_obj = new window.Geetest({
          gt: config.gt,
          challenge: config.challenge,
          product: 'float',
          https: true,
          offline: !config.success,
          width:'100%'
    });

    gt_captcha_obj.appendTo("#div_id_embed");

    //Ajax request demo,if you use submit form ,then ignore it
    gt_captcha_obj.onSuccess(function() {
        GT_status = true;
        $('#j_geetest_error').html('').hide();
    });
    gt_captcha_obj.onRefresh(function(){
        GT_status = false;
         $('#j_geetest_error').html('').hide();
    })
}

var gtcallback = (function () {
    var status = 0, result, apiFail;
    return function (r) {
        if(r&&r.success < 0){
            GT_status = true;
           return;
        }
        status += 1;
        if (r) {
            result = r;
            setTimeout(function () {
                if (!window.Geetest) {
                    apiFail = true;
                    gtFailbackFrontInitial(result)
                }
            }, 1000);
        }
        else if (apiFail) {
            return;
        }
        if (status == 2) {
            loadGeetest(result);
        }
    };
})();

function GloadGeetestPHP(){
    var s = document.createElement('script');
    s.src = 'https://api.geetest.com/get.php?callback=gtcallback';
    s.charset = 'UTF-8';
    s.type = 'text/javascript';
    s.onerror = function(){
        GT_status = false;
        GT_Tips = '安全验证模块加载失败，请联系客服';
        $('#j_geetest_error').html(GT_Tips).show();
        $('#login').css({'background-color':'#8A8B8C'}).addClass('unsubmit');
    }
     document.getElementsByTagName('head')[0].appendChild(s);
}

var Ginf_geetest = "/sec/geetest";
if(location.href.indexOf('mlogin.html')>0){
    Ginf_geetest = "/sec/mGeetest";
}
var GT_time = new Date().getTime();
$.ajax({
    url : Ginf_geetest,
    type : "get",
    dataType : 'JSON',
    data:{
        time:GT_time
    },
    success : function(result) {
        if(result.success > 0){
            GloadGeetestPHP();
        }

        gtcallback(result)
    }
});
