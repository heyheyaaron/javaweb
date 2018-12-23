function mask() {

        $(".mask").fadeIn();
} //遮罩层主要以Click方法触发

function close() {
        var e = e || event;
        e.preventDefault();
        e.stopPropagation();
        $(".mask").fadeOut();
}

function banner() {
        jQuery(".slideBox").slide({
                mainCell: ".bd ul",
                effect: "leftLoop",
                autoPlay: true
        });
} //Banner

function tab() {
        jQuery(".slideTxtBox").slide({});
} //选项卡

function picScroll() {
        jQuery(".picScroll-left").slide({
                titCell: ".hd ul",
                mainCell: ".bd ul",
                autoPage: true,
                effect: "left",
                autoPlay: false,
                vis: 3
        });
} //多图滚动

function slidemen() {
        jQuery(".sideMen").slide({
                titCell: "h3",
                targetCell: "ul",
                defaultIndex: 1,
                effect: "slideDown",
                delayTime: 300,
                trigger: "click"
        });
} //手风琴效果

function touchbanner() {
        TouchSlide({
                slideCell: "#slideBox",
                titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
                mainCell: ".bd ul",
                effect: "leftLoop",
                autoPage: true, //自动分页
                autoPlay: true //自动播放
        });
} //自适应宽的BANNER

function show() {
        $(".signinwrap_expand").click(function() {
                $(".tips_signin").show();
        });
}

function child_forum() {
        var on = true;
        $(".child_forum img").click(function() {

                if (on) {


                        $(this).attr('src', 'resources/php/bbs/static/image/common/collapsed_yes.gif');
                        $('.cf_content').hide();
                        on = false;
                } else {

                        $(this).attr('src', 'resources/php/bbs/static/image/common/collapsed_no.gif');
                        $('.cf_content').show();

                        on = true;

                }


        });
}

function showmenu() {


        $(".showmenu").click(function() {

                $(".p_pop").toggle();

        });
}

function attention_expand() {


        $('.attention_expand').click(function() {


                $(this).parents().find('#tipBox').toggle();
        })
}

function argument() {



        $(".y>a").click(function() {
                $(".close").show();
        });
}

function argument1() {

        $(".mzClose").click(function() {
                $(".close").hide();
        })
}

function showSyncInfo() {


        var nofollowfeed = 1;
        var userdatakey = cookiepre + 'fastpost139168029';

        function showSyncInfo(flag) {
                if (flag) {
                        document.getElementById("wrap_simcheck").setAttribute("class", "wrap_simcheck checked_simcheck");
                } else {
                        document.getElementById("wrap_simcheck").setAttribute("class", "wrap_simcheck");
                }
                display('flw_post_subject');
                display('forumlistdev');

                var sObj = $('subject');
                sObj.value = '';
                strLenCalc(sObj, 'checklen', 70);
        }

        function fastpostvalidateextra() {
                var sObj = $('subject');
                if (!$('syncbbs').checked) {
                        $('subject').value = '  ';
                }
                return true;
        }
}

function a_friend_li_2() {


        $(".a_friend_li_2").click(function() {
                $(".fwinmask").show();
        })
};

function flbc() {

        $(".flbc").click(function() {
                $(".fwinmask").hide();
        })
};

function weChat() {
        $(".footer-weChat").hover(function() {
                $("#wechatPic").toggle();
        })
}

function login() {
        $(".login-box").mouseover(function() {
                $(".not-login-block-sub").show();
        });
}

function loginbox() {

        $(".login-box").mouseleave(function() {
                $(".not-login-block-sub").hide();
        });
}
 