$(function(){
    var back = $('#backUrl').val();
    //判断是否uc自己的域名
    if (back.indexOf("https://login.flyme.cn/sso") != -1 || back.indexOf("https://login.in.meizu.com/sso") != -1 ||
            back.indexOf("https://login.flyme.cn/mlogin.html") != -1 || back.indexOf("https://login.in.meizu.com/mlogin.html") != -1) {

      var newback = back;
      if (back.indexOf("https://login.flyme.cn/sso") != -1) {
          newback = back.replace("https://login.flyme.cn/sso", "https://login.flyme.cn/login/login.html");
      } else if(back.indexOf("https://login.flyme.cn/mlogin.html") != -1) {
          newback = back.replace("https://login.flyme.cn/mlogin.html", "https://login.flyme.cn/login/login.html");
      } else if(back.indexOf("https://login.in.meizu.com/sso") != -1) {
          newback = back.replace("https://login.in.meizu.com/sso", "https://login.in.meizu.com/login/login.html");
      } else if(back.indexOf("https://login.in.meizu.com/mlogin.html") != -1) {
          newback = back.replace("https://login.in.meizu.com/mlogin.html", "https://login.in.meizu.com/login/login.html");
      }

      $('#backUrl').val(newback);
      $('#returnLogin').attr('href', newback);
    }
    var $time = $('#time'),
        time = 2;
    setInterval(function(){
        if(time <= 0){
        	var backUrl = $('#backUrl').val();
        	location.href = backUrl;
            return;
        }
        $time.text(time--);
    }, 1000);
});
