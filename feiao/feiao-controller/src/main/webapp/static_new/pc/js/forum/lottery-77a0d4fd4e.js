(function (window,$) {
  var Lottery = function () {
    this.init();
  },
  config = {
    chance_url: 'https://bbs-act.meizu.cn/index.php?mod=hongbao&action=get_chance&id=2',
    lottery_url: 'https://bbs-act.meizu.cn/index.php?mod=index&action=draw_hongbao'
  };
  var $bg = $('.lottery_bg');
  var $abg = $('.award_bg');
  var $lottery_cnt = $('.lottery_cnt');
  var $before = $('.lottery_before');
  var $after = $('.lottery_after');
  var $img = $('.lottery_img');
  var $text = $('.lottery_text');
  var $addr = $('.lottery_addr');
  var $failure = $('.failure');
  var $bless = $('.bless');
  var $winShow = $('.win_show');
  var $close = $('.l_close');
  var _bless = {};
  var $name = $bless.find('.bname');
  var $blessing = $bless.find('.b_text_in');
  var $reciver = $('#reciver');
  var $phone = $('#phone');
  var $address = $('input#addr');
  var $sumbit = $('.l_footer .submit');
  var $cname = $bless.find('.cname');
  var _hide = function() {
    $bg.hide();
    $abg.hide();
    $lottery_cnt.hide();
  };

  $close.on('click', function(event) {
    event.stopPropagation()
    _hide();
  });

  $('.closebtn').on('click', function() {
     _hide();
  });

  Lottery.prototype = {
    constructor: Lottery,
    init: function () {
      if(this.checkTime()) this.initLogInOut();
    },
    initLogInOut: function() {
      var self = this;
      var AL = new AutoLogin({
        dname : 'act',
        autoLoginApi: 'https://bbs-act.meizu.cn/index.php?mod=member&action=auto_login',
        autoLogoutApi: 'https://bbs-act.meizu.cn/index.php?mod=member&action=auto_logout',
        inCallback: function(res) {
          self.show();
        },
        outCallback: function(res) {},
        stayCallback:function(){
          if( self.checkTime() ) self.show();
        },
      });
      AL.autoLogin();
    },
    checkTime: function() {
      var now = +new Date();
          now = (now / 1000) | 0;
     
      var lastReq = _getcookie('LT'); 
      if(!lastReq) return true;
      var lastTime = lastReq.split('_')[0];
     
      var nowUid = _getcookie('MZBBS_2132_loginmember');  // 当前uid
          nowUid = eval( '(' + nowUid +')');
          nowUid = nowUid.uid;
      var lastUid = lastReq.split('_')[1]; // 上一个uid
      
      if( lastUid != nowUid) {
        var d = +new Date();
            d = (d / 1000) | 0;
            d += 30;
      
        _setcookie('LT', d + '_' + nowUid);
        return true;
      }
     
      if(now > lastTime) {
        return true;
      }
      return false;
    },
    show: function () {
      var self = this;
      $.ajax({
        url: config.chance_url,
        type: 'get',
        cache: false,
        dataType: 'jsonp'
      })
        .done(function(res){
          var d = +new Date();
              d = (d / 1000) | 0;
          var _uid = _getcookie('act_sso');
 
          if(res && res.code === 200) {
            d += 30;
            _setcookie('LT', d + '_' + _uid);
             var data = res.data;
            _bless = data.blessing;
            _bless.name = data.name;
            $before.css({
              'background-image': 'url(' + data.hongbao_img_url +')',
              'background-repeat': 'no-repeat',
              'background-position': 'center',
              'background-size': '100%'
            });
            if(data.hongbao_audio_url) self.playMusic(data.hongbao_audio_url);
            $bg.show();
            $lottery_cnt.show();
            self.hongbao(res.data);
          } else if(res.code === 40409 || res.code === 40009 || res.code === 40010 || res.code === 40011){
            d += 30 * 60;
            _setcookie('LT', d + '_' + _uid);
          } else {
             d += 30;
            _setcookie('LT', d + '_' + _uid);
          }
        })
        .fail(function(){
          // console.error('红包机会接口调用失败。');
        });
    },
    hide: function() {
      _hide();
    },
    playMusic: function(url) {
      var borswer = window.navigator.userAgent.toLowerCase();
      if ( borswer.indexOf( "ie" ) >= 0 ) {
        //IE内核浏览器
        var strEmbed = '<embed name="embedPlay" src="' + url + '" autostart="true" hidden="true" loop="false"></embed>';
        if ( $( "body" ).find( "embed" ).length <= 0 ) {
          $( "body" ).append( strEmbed );
        }
        var embed = document.embedPlay;

        //浏览器不支持 audion，则使用 embed 播放
        embed.volume = 100;
      } else {
        //非IE内核浏览器
        var strAudio = "<audio id='audioPlay' src='"+ url +"' hidden='true'>";
        if ( $( "body" ).find( "audio" ).length <= 0 )
          $( "body" ).append( strAudio );
        var audio = document.getElementById( "audioPlay" );

        //浏览器支持 audion
        audio.play();
      }
    },
    hongbao: function(data) {
      var self = this;
      $before.on('click', function() {
        setTimeout(function(){$before.hide();}, 0);
        $.ajax({
          type: 'get',
          url: config.lottery_url,
          data: {
            signature: data.signature,
            timestamp: data.timestamp,
            nonce: data.nonce,
            hongbao_id: data.hongbao_id,
            award_img: '1'
          },
          dataType: 'jsonp',
          cache: false
        })
          .done(function(res){
            self.controlAward(res);
          })
          .fail(function(){
            // console.error('抽奖接口调用失败。');
            $before.hide();
            $failure.show();
          });
      });
    },
    controlAward: function(res) {
      var data = res.data;
      var self = this;
      if(res.code === 200) {
        var type = parseInt(data.award_type, 10);
        $abg.show();
        switch (type) {
          case 1: // 煤球
            var img = $winShow.find('.win_img');
            var txt = $winShow.find('.win_txt');
            img.attr('src', data.award_img_url);
            txt.text(res.message);
            $winShow.show();
            break;
          case 2: // M码
            var img = $winShow.find('.win_img');
            var txt = $winShow.find('.win_txt');
            img.attr('src', data.award_img_url);
            txt.text(res.message);
            $winShow.show();
            break;
          case 3: // 实物
            var $ltxt = $after.find('.lottery_text');
            var $limg = $after.find('.lottery_img img');
            $abg.css('marginTop','-358px');
            self.getAddress();
            self.bindSubmit(data.win_id);
            $after.show();
            $ltxt.text(res.message);
            $limg.attr('src', data.award_img_url);
            break;
        }
      } else {
        // 不中奖，显示红包祝福语
        var d = +new Date();
            d = (d / 1000) | 0;
            
        var _uid = _getcookie('act_sso');
        $name.text(_bless.title);
        // $cname.text(_bless.name);
       
        if(res.code == 402) { // 次数用完
          d = d + 1800;
          _setcookie('LT', d + '_' + _uid);
        } 
        if(res.code == 407) { //没手机
           _hide();
           alert(res.message);
           return;
        }
        $blessing.text(_bless.body);
        $bless.show();
      }
    },
    getAddress: function() {
        $.ajax({
          url: 'https://bbs-act.meizu.cn/index.php',
          type: 'GET',
          data: {
              mod:'index',
              action: 'single_address'
          },
          cache: false,
          dataType: 'jsonp',
          success: function(rep){
              var dat = rep.data, res = rep.code;
              if(res == 200){
                  if(typeof dat === 'object' && dat.id){
                    $reciver.val(dat.name);
                    $phone.val(dat.phone);
                    $address.val(dat.address);
                  }
              }
          },
          error: function() {
            alert('获取收货地址失败');
          }
      });
    },
    bindSubmit: function(winid) {
      var self = this;
      $sumbit
        .off('click')
        .on('click', function(){
          var v1 = $reciver.val(),
              v2 = $phone.val(),
              v3 = $address.val(),
              _o = {};
          var pattern=/(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
          
          if(v1 == '') _o.v1 = false;
          if(v2 == '') _o.v2 = false;
          if(v3 == '') _o.v3 = false;
          
          $addr.on('focus', '.l_input',function() {
            if(/^请输/.test($(this).val()) ) {
              $(this).val('').removeClass('l_error');
            }
          });
          
          for(var i in _o) {
            if( !_o[i] ) {
              if( i=='v1' ) {
                $reciver.focus().addClass('l_error').val('请输入姓名');
              }
              if( i=='v2' ) {
                $phone.focus().addClass('l_error').val('请输入手机');
              }
              if( i=='v3' ) {
                $address.focus().addClass('l_error').val('请输入地址');
              }
              break;
            }
          }
          if( !pattern.test( v2 )) {
            $phone.focus().addClass('l_error');
            return false;
          }
          if( (v1 !== '' && !/^请输/.test(v1) ) &&
              (v2 !== '' && !/^请输/.test(v2) ) &&
              (v3 !== '' && !/^请输/.test(v3) )) 
          {
            $.ajax({
              url: 'https://bbs-act.meizu.cn/index.php',
              type: 'get',
              data: {
                  mod:'index',
                  action: 'update_address',
                  name: v1,
                  phone: v2,
                  address: v3,
                  win_id: winid
              },
              dataType: 'jsonp',
              success: function(_res){
                  var res = _res.code;
                  if(res == 200){
                    self.hide();
                  } else {
                     alert('提交地址不成功，请到个人中奖记录补全');
                  }
              }
            })
          }
        });
    }
  };
  
  window.Lottery = Lottery;
})(window,window.jQuery);