var __id = function(e) {
                return document.getElementById(e)
        },
        __addEvent = function() {
                return document.addEventListener ? function(e, a, s) {
                        if (e.length)
                                for (var t = 0; t < e.length; t++) __addEvent(e[t], a, s);
                        else e.addEventListener(a, s, !1)
                } : function(e, a, s) {
                        if (e.length)
                                for (var t = 0; t < e.length; t++) __addEvent(e[t], a, s);
                        else e.attachEvent("on" + a, function() {
                                return s.call(e, window.event)
                        })
                }
        }(),
        __addClass = function(e, a) {
                return __hasClass(e, a) ? void 0 : e.className = "" == e.className ? a : e.className + " " + a
        },
        __removeClass = function(e, a) {
                var s = new RegExp("(\\s|^)?" + a + "(\\s|$)", "i");
                e.className = e.className.replace(s, " ").replace(/^\s+|\s+$/, "")
        },
        __hasClass = function(e, a) {
                var s = new RegExp("(\\s|^)?" + a + "(\\s|$)", "i");
                return s.test(e.className)
        },
        __eTarget = function(e) {
                return document.all ? window.event.srcElement : e.target
        },
        meizuHeader = {
                navObj: __id("meizu-header-container"),
                rmToggle: null,
                isSubShow: !1,
                bindUserBox: function() {
                        var e = __id("meizu-header-user"),
                                a = __id("meizu-header-user-box"),
                                s = e.getElementsByTagName("ul"),
                                t = s.length;
                        __addEvent(e, "mouseover", function() {
                                a.style.display = "block";
                                for (var e = 0; t > e; e++) s[e].style.display = "block"
                        }), __addEvent(e, "mouseleave", function() {
                                a.style.display = "none";
                                for (var e = 0; t > e; e++) s[e].style.display = "none"
                        })
                },
                bindProductLink: function() {
                        for (var e = this, a = e.navObj, s = a.childNodes, t = [], n = 0; n < s.length; n++) "meizu-header-sub" == s[n].className && t.push(s[n]);
                        __addEvent(a, "mouseover", function(s) {
                                if ("A" == __eTarget(s).tagName && "meizu-header-link-product-a" == __eTarget(s).className || "LI" == __eTarget(s).tagName && "meizu-header-link-product" == __eTarget(s).className) {
                                        var n = __eTarget(s).parentNode,
                                                r = n.getAttribute("data-subnav");
                                        if (r) {
                                                for (var i = 0; i < t.length; i++) {
                                                        __removeClass(t[i], "meizu-header-sub-show");
                                                        var o = t[i].getElementsByTagName("div")[0].getElementsByTagName("ul")[0];
                                                        __removeClass(o, "meizu-header-sub-ul-on")
                                                }
                                                __addClass(__id("meizu-header-sub-" + r), "meizu-header-sub-show"), e.isSubShow || (e.isSubShow = !0, __addClass(__id("meizu-header-sub-" + r), "meizu-header-sub-animation"))
                                        }
                                        __addClass(a, "toggle")
                                } else if ("A" == __eTarget(s).tagName && "" == __eTarget(s).className) {
                                        for (i = 0; i < t.length; i++) __removeClass(t[i], "meizu-header-sub-show"), __removeClass(t[i], "meizu-header-sub-animation");
                                        __removeClass(a, "toggle"), e.isSubShow = !1
                                }
                                this.rmToggle && (clearTimeout(this.rmToggle), this.rmToggle = null)
                        }), __addEvent(a, "mouseout", function() {
                                this.rmToggle = setTimeout(function() {
                                        for (var s = 0; s < t.length; s++) __removeClass(t[s], "meizu-header-sub-show"), __removeClass(t[s], "meizu-header-sub-animation");
                                        __removeClass(a, "toggle"), e.isSubShow = !1
                                }, 200)
                        })
                },
                bindProductHover: function() {
                        var e = this.navObj,
                                a = "meizu-header-sub-ul-on";
                        __addEvent(e, "mouseover", function(e) {
                                if ("A" == __eTarget(e).tagName && __eTarget(e).className.indexOf("meizu-header-sub-") > -1) {
                                        var s = __eTarget(e).parentNode,
                                                t = s.className;
                                        if ("" == t) {
                                                var n = s.parentNode;
                                                n.className = a
                                        }
                                } else "UL" == __eTarget(e).tagName && "meizu-header-sub-ul-on" == __eTarget(e).className && __removeClass(__eTarget(e), "meizu-header-sub-ul-on")
                        })
                },
                init: function() { this.bindProductLink(), this.bindProductHover() }
        };
meizuHeader.init(); < /script>           < /div >



function getCookie(objName) { //获取指定名称的cookie的值
        var arrStr = document.cookie.split("; ");
        for (var i = 0; i < arrStr.length; i++) {
                var temp = arrStr[i].split("=");
                if (temp[0] == objName)
                        return unescape(temp[1]);
        }
        return false;
}
var STYLEID = "1",
        STATICURL = "static/",
        IMGDIR = "https://bbs.res.meizu.com/resources/php/bbs/static/image/common",
        VERHASH = "fDw",
        charset = "utf-8",
        discuz_uid = "142015388",
        cookiepre = "MZBBS_2132_",
        cookiedomain = "",
        cookiepath = "/",
        showusercard = "0",
        attackevasive = "0",
        disallowfloat = "login|newthread|tradeorder|activity|debate|usergroups|task",
        creditnotice = "",
        defaultstyle = "",
        REPORTURL = "aHR0cDovL2Jicy5tZWl6dS5jbi9hcHAucGhwP21vZD1sb3R0ZXJ5JmFjdGlvbj1teQ==",
        SITEURL = "https://bbs.meizu.cn/",
        JSPATH = "https://bbs.res.meizu.com/resources/php/bbs/static/js/";


// 是否是手机浏览器
var BROWSER_IS_MOBILE = "0"; // 手机浏览器 1

var cookiepre = "MZBBS_2132_";
var username_obj = eval('(' + getCookie(cookiepre + 'loginmember') + ')');
