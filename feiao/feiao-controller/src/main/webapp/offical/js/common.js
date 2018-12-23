/**
 * Created by chenxiaofa on 2016/9/4.
 */
;(function(MYJ){

    //定时刷新二维码
    MYJ.QrCodeLooper = function(type,interval){
        var _self = this;
        if (!type)
            type='login';
        if (!interval)
        {
            interval = 300;
        }


        var timer = null;
        this.callback = function(url) {console.log(url)};

        this.start = function()
        {
            _self.callback.call(this,'/home/qrcode?type='+type+'&_t='+(new Date()).getTime());
            _self.stop();
            timer = setTimeout(_self.start,interval)
        };

        this.stop = function()
        {
            if (timer){
                clearTimeout(timer);
                timer = null;
            }
        }

    };

    MYJ.AjaxLooper = function(url,method,interval)
    {
        var _self = this;
        var xhr = null;
        var timer = null;
        var status = true;

        this.callback = function(data){console.log(data);};

        this.start = function()
        {
            _self.stop();
            status = true;
            xhr = $.ajax({
                url:url,
                type:method,
                dataType:'json',
                success:function(d)
                {
                    _self.callback.call(_self,d);
                },
                complete:function()
                {
                    if (status){
                        timer = setTimeout(_self.start,interval);
                    }

                }
            })
        };
        this.stop = function()
        {
            if (xhr){
                xhr.abort();
                xhr = null;
            }
            if (timer){
                clearTimeout(timer);
                timer = null;
            }
            status = false;
        }
    };


    MYJ.CheckLoginLooper = function(delay)
    {
        var _self = this;
        if (!delay)
        {
            delay = 60;
        }
        var remain_pooling_times = delay;
        this.ajaxLooper = new MYJ.AjaxLooper('/home/check_login','GET',1000);
        this.continue = function(){return false;};
        this.success = function(data)
        {
            console.log(data);
        };

        this.ajaxLooper.callback = function(data)
        {
            if (data && data.status == 200) {
                _self.success.call(_self,data);
                _self.ajaxLooper.stop();
            } else {
                if (!_self.continue())
                {
                    remain_pooling_times--;
                }
                else {
                    remain_pooling_times = delay;
                }
                if (remain_pooling_times < 1)
                {
                    this.stop();
                }
            }
        };


        this.start = function(){
            this.ajaxLooper.start();
        }


    };
    var urlXssFilterMap = [
        ['%3A',':'],
        ['\\+',' '],
        ['%2B','+'],
        ['%2F','/'],
        ['%3F','?'],
        ['%25','%'],
        ['%23','#'],
        ['%26','&'],
        ['%3D','=']
    ].map(function(a){
        return [new RegExp(a[0],'gi'),a[1]];
    });
    MYJ.UrlXssFilter = function(url)
    {
        url = encodeURIComponent(url);
        urlXssFilterMap.map(function(a){
            url = url.replace(a[0],a[1]);
        });
        return url;
    }

    MYJ.LoginQrCodeLayer = function(){
        //轮训登录状态
        var init_user_data  = window.init_user_data || function(){};
        var bind_flyme      = window.bind_flyme || function(){};
        var checkLoginLooper = new MYJ.CheckLoginLooper(60);
        var index = layer.open({
            content: '<span class="myj-activity-layer-close-btn myj-qrcode-close"></span><img class="myj-layer-qrcode" src="/home/qrcode?type=login&_t=' + new Date().getTime() + '"/><p>微信扫一扫登录<br/>参与互动</p>'
        });

        checkLoginLooper.success = function()
        {
            layer.close(index);
            init_user_data();
            if (!$.cookie('_myjbindflyme'))
            {
                bind_flyme();
            }
        };
        checkLoginLooper.continue = function()
        {
            return $('.myj-layer-qrcode').is(':visible');
        };
        checkLoginLooper.start();
    }

    MYJ.DynamicImageThumb = function(url,size)
    {
        size = size || '165x165';
        if (url.substr(0,1) == '/')
        {
            url = 'http://dc.res.meizu.com'+url;
        }
        return url.replace(/(jpg|jpeg|png|gif)$/i,size+'.$1');

    }

})(window.MYJ = (window.MYJ || {}));