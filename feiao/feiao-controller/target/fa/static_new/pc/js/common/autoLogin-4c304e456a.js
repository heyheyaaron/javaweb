/** bbs-act web auto login or logout */
/** rely on jQuery or Zepto*/
var _getcookie = function (name) {
  var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

  if (arr = document.cookie.match(reg)) {
    return decodeURIComponent(arr[2]);
  }
  return null;
},
  _setcookie = function (name, value) {
    document.cookie = name + "=" + encodeURIComponent(value);
  },
  _delcookie = function (name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  };


var AutoLogin = function (obj) {
  this.bbs_uc_base = 'https://bbs-uc.meizu.cn/index.php?mod=sso&action=index';
  this.uid_cookie = (typeof (obj.dname) == 'undefined' || !obj.dname) ? 'logined_uid' : obj.dname + '_sso'
  this.uid = _getcookie(this.uid_cookie);
  this.logined = this.uid ? 1 : 0;
  this.need_ticket = this.logined ? 0 : 1;
  this.retry = 0;
  window._ssologined = this.logined;
  this.obj = obj;
};

AutoLogin.prototype.autoLogin = function () {
  var self = this;
  window.jQuery.ajax({
    type: 'get',
    url: this.bbs_uc_base + '&callback=tt&ticket=' + this.need_ticket,
    cache: false,
    dataType: 'jsonp',
    success: function (res) {
      //uc logined status.
      if (res && res.code == 200) {

        if (!self.logined) {
          if (self.need_ticket) {
            var ticket = res.data && res.data.ticket ? res.data.ticket : null;
            if (ticket) {
              window.jQuery.ajax({
                type: 'post',
                url: self.obj.autoLoginApi,
                data: {
                  ticket: ticket
                },
                cache: false,
                dataType: "jsonp",
                success: function (_res) {
                  if (_res.code == 200) {
                    _setcookie(self.uid_cookie, _res.data.uid);
                    self.obj.inCallback && self.obj.inCallback(_res);
                  }
                }
              });
            }
          }
        } else {
          if ((self.uid + '') != (res.data.uid + '')) {
            self.uid = 0;
            self.logined = 0;
            self.need_ticket = 1;
            self.retry = self.retry + 1;
            _delcookie(self.uid_cookie);
            //最多重试两次
            if (self.retry > 2) {
              return false;
            }
            self.autoLogin();
          } else {
            self.obj.stayCallback && self.obj.stayCallback(res);
          }
        }
      } else if (res && res.code != 200 && self.logined) {
        _delcookie(self.uid_cookie);
        window.jQuery.ajax({
          type: 'post',
          url: self.obj.autoLogoutApi,
          cache: false,
          dataType: 'jsonp',
          success: function (_res) {
            self.obj.outCallback && self.obj.outCallback(_res);
          }
        });
      }
    },
    error: function (e) {
      console.error(e)
    }
  });
}
