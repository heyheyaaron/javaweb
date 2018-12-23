/*!
 * jQuery-ajaxTransport-XDomainRequest - v1.0.4 - 2015-03-05
 * https://github.com/MoonScript/jQuery-ajaxTransport-XDomainRequest
 * Copyright (c) 2015 Jason Moon (@JSONMOON)
 * Licensed MIT (/blob/master/LICENSE.txt)
 */
(function(a) {
	if(typeof define === 'function' && define.amd) {
		define(['jquery'], a)
	} else if(typeof exports === 'object') {
		module.exports = a(require('jquery'))
	} else {
		a(jQuery)
	}
}(function($) {
	if($.support.cors || !$.ajaxTransport || !window.XDomainRequest) {
		return $
	}
	var n = /^(https?:)?\/\//i;
	var o = /^get|post$/i;
	var p = new RegExp('^(\/\/|' + location.protocol + ')', 'i');
	$.ajaxTransport('* text html xml json', function(j, k, l) {
		if(!j.crossDomain || !j.async || !o.test(j.type) || !n.test(j.url) || !p.test(j.url)) {
			return
		}
		var m = null;
		return {
			send: function(f, g) {
				var h = '';
				var i = (k.dataType || '').toLowerCase();
				m = new XDomainRequest();
				if(/^\d+$/.test(k.timeout)) {
					m.timeout = k.timeout
				}
				m.ontimeout = function() {
					g(500, 'timeout')
				};
				m.onload = function() {
					var a = 'Content-Length: ' + m.responseText.length + '\r\nContent-Type: ' + m.contentType;
					var b = {
						code: 200,
						message: 'success'
					};
					var c = {
						text: m.responseText
					};
					try {
						if(i === 'html' || /text\/html/i.test(m.contentType)) {
							c.html = m.responseText
						} else if(i === 'json' || (i !== 'text' && /\/json/i.test(m.contentType))) {
							try {
								c.json = $.parseJSON(m.responseText)
							} catch(e) {
								b.code = 500;
								b.message = 'parseerror'
							}
						} else if(i === 'xml' || (i !== 'text' && /\/xml/i.test(m.contentType))) {
							var d = new ActiveXObject('Microsoft.XMLDOM');
							d.async = false;
							try {
								d.loadXML(m.responseText)
							} catch(e) {
								d = undefined
							}
							if(!d || !d.documentElement || d.getElementsByTagName('parsererror').length) {
								b.code = 500;
								b.message = 'parseerror';
								throw 'Invalid XML: ' + m.responseText;
							}
							c.xml = d
						}
					} catch(parseMessage) {
						throw parseMessage;
					} finally {
						g(b.code, b.message, c, a)
					}
				};
				m.onprogress = function() {};
				m.onerror = function() {
					g(500, 'error', {
						text: m.responseText
					})
				};
				if(k.data) {
					h = ($.type(k.data) === 'string') ? k.data : $.param(k.data)
				}
				m.open(j.type, j.url);
				m.send(h)
			},
			abort: function() {
				if(m) {
					m.abort()
				}
			}
		}
	});
	return $
}));

(function($) {

	$(document).ready(function($) {

		var drawtype = activity_id,
			minLen = 12,
			postFlag = true;
		var login_yes_em = $('.login_yes p em');
		if(!(typeof(username_obj.uid) == "undefined" || !username_obj.uid)) {
			getDrawCountInfo();
		}

		var rotateTimeOut = function() {
			$('#rotate').rotate({
				angle: 0,
				animateTo: 2160,
				duration: 8000,
				callback: function() {
					dialog('网络超时，请检查您的网络设置！');
				}
			});
		};
		var isRotate = false,
			isBlankAddress = false;
		var isUndefined = function(obj) {
				return obj === void 0;
			},
			isIE = function(mixed) {
				if(isUndefined(mixed)) {
					mixed = [7, 8, 9, 10, 11];
				} else if($.isNumeric(mixed)) {
					mixed = [mixed];
				}
				for(var j = 0; j < mixed.length; j++) {
					var re;
					switch(mixed[j]) {
						case 11:
							re = /Trident.*rv\:11\./g;
							break;
						case 10:
							re = /MSIE\s10\./g;
							break;
						case 9:
							re = /MSIE\s9\./g;
							break;
						case 8:
							re = /MSIE\s8\./g;
							break;
						case 7:
							re = /MSIE\s7\./g;
							break;
					}

					if(re && !!window.navigator.userAgent.match(re)) {
						return true;
					}
				}

				return false;
			};

		// http://api-master.meizu.com/api/bbs/component/bbs.meizu.cn

		/*-- 需要每次配置--- */
		var drawarr = [];
		var $$ = {
			bg: $('.draw_area'),
			title: $('.floating'),
			lbg: $('.paomadeng'),
			lpic: $('#rotate'),
			pointer: $('.pointer'),
			rule: $('.draw_rule')
		};

		var failHandler = function() {
			$$.bg.css('visibility', 'visible');
			$$.pointer.hide();
			layer.alert('活动数据获取失败，请刷新重试。', {
				skin: 'layui-layer-rim',
				closeBtn: 0,
				title: '提示',
				btn: ['知道了'],
				cancel: function(index) {
					layer.close(index);
				}
			});

		};

		var getAwardInfo = function(callback) {
			$.ajax({
					type: 'get',
					url: '//api-master.meizu.com/api/bbs/component/bbs.meizu.cn',
					cache: false,
				})
				.done(function(res) {
					if(res && res.code === 200) {
						drawarr = res.data.data[0].order;
						callback && callback(res);
					} else {
						failHandler();
					}
				})
				.fail(function() {
					failHandler();
				});
		};

		$$.bg.css('visibility', 'hidden');

		getAwardInfo(function(res) {
			res = res.data.data[0];

			$$.bg.css({
				visibility: 'visible',
				background: 'url(' + res.img.bg + ') no-repeat 0 0'
			});

			$$.title.css({
				background: 'url(' + res.img.title + ') no-repeat 0 0'
			});

			$$.lbg.css('background', 'url(' + res.img.lottery_bg + ') no-repeat 0 0');
			$$.lpic.attr('src', res.img.lottery_pic);
			$$.pointer.css('background', 'url(' + res.img.pointer + ') no-repeat 0 0');
			$$.rule.css('background', 'url(' + res.img.rule_bg + ') no-repeat 0 0');

			if(res && res.css && res.css.rule) {
				$$.rule.find('p').css(res.css.rule);
			}

			if(res && res.css && res.css.title) {
				$$.title.css(res.css.title);
			}

			if(res && res.css && res.css.pointer) {
				$$.pointer.css(res.css.pointer);
			}

			if(res && res.css && res.css.lbg) {
				$$.lbg.css(res.css.lbg);
			}

			if(res && res.css && res.css.lpic) {
				$$.lpic.css(res.css.lpic);
			}

		});

		var _empty = 6;
		/*---------------- */

		//中奖奖品id
		// 逆时针数的 :)

		/*
		名称----test--prod
		  20煤球 37--45
		  背包 43 --- 57
		  5煤球  20--46
		  ep51 42--52
		  直柄伞 35--48
		  路由 44 ---56
		  1煤球  40--54
		  熊猫 24--34
		  魅族盒子 50--63
		  1000元红包 49 -- 62
		  500元红包 48 -- 61
		  100元红包 47 -- 60
		  自拍杆 18 -- 18
		  
		  太空杯 41--55
		  移动电源 39--50
		*/

		var rotateFn = function(awards, angles, txt) {
			$('#rotate').stopRotate();
			$('#rotate').rotate({
				angle: 0,
				animateTo: angles + 1800,
				duration: 12000,
				callback: function() {
					getDrawCountInfo();
					if(isBlankAddress) {
						isBlankAddress = !isBlankAddress;
						layer.open({
							type: 1,
							title: '温馨提示',
							skin: 'layui-layer-rim', //加上边框
							area: ['410px', 'auto'], //宽高
							content: $('#address_info').html(),
							success: function() {
								$('.layui-layer  .getinfo_phone input').numberInput(11);
								$('.layui-layer .editinfo').click(function() {
									if($(this).text() == '点此修改') {
										$(this).text('取消修改');
										$('.layui-layer dl .blank_yes, .layui-layer button.blank_yes').addClass('hide');
										$('.layui-layer dl .blank_no, .layui-layer button.blank_no').removeClass('hide');
									} else {
										$(this).text('点此修改');
										$('.layui-layer dl .blank_yes, .layui-layer button.blank_yes').removeClass('hide');
										$('.layui-layer dl .blank_no, .layui-layer button.blank_no').addClass('hide');
									}
								});
								$('.layui-layer button.blank_no').click(function() {
									postAddressInfo();
								});
								$('.layui-layer button.blank_yes').click(function() {
									layer.closeAll();
								});
							}
						});
					} else {
						dialog(txt);
					}
					isRotate = false;
				}
			});
		};

		$('.pointer').click(function() {
			if(isRotate) return;
			isRotate = true;
			var paid_chance = parseInt(login_yes_em.eq(0).text()),
				free_chance = parseInt(login_yes_em.eq(1).text());

			if(paid_chance == 0 && free_chance == 0) {
				dialog('今天的抽奖次数已用完<br/>欢迎明天再来。');
				return;
			}
			$.ajax({
				url: 'https://bbs-act.meizu.cn/index.php',
				type: 'POST',
				data: {
					mod: 'index',
					action: 'draw',
					id: drawtype
				},
				dataType: 'json',
				success: function(rep) {
					var code = rep.code,
						message = rep.message,
						data = rep.data;
					if(code >= 200 && code < 300) {
						var award_id = typeof(data) != 'undefined' ? parseInt(data.award_id) : 0;
						var award_type = typeof(data) != 'undefined' ? parseInt(data.award_type) : 0;
						if(drawarr.length == 0) {
							getAwardInfo(function() {
								$('.pointer').click();
							});
						} else {
							var num = $.inArray(parseInt(award_id), drawarr),
								item = (code == 200) ? (num > -1 ? num : _empty) : _empty;
							message = message.replace(/“/g, '“<span class="c_blue">').replace(/”/g, '</span>”');
							rotateFn(item, item * 45, message);
							if(parseInt(award_type) === 3) {
								isBlankAddress = !isBlankAddress;
								$('#getinfo_id').val(data.win_id);
								$('.draw_tip').html(message);
								getAddressInfo();
							}
						}

					} else if(code == 401) {
						dialog('尚未登录，请先<a class="c_blue" href="/index.php?mod=member&action=login">登录</a>');
					} else {
						dialog(message);
						getDrawCountInfo();
					}
				},
				error: function() {
					isRotate = false;
					dialog('网络不给力，请检查网络后重试');
				}
			});
		});
		getWinnerList();

		//弹出框
		function dialog(cont) {
			layer.open({
				type: 1,
				title: "温馨提示",
				skin: 'layui-layer-rim', //加上边框
				area: ['410px', 'auto'], //宽高
				content: '<div class="dialog_cont">' + cont + '</div>'
			});
		}
		//获取抽奖次数信息 http://bbs.meizu.cn/app.php?mod=lottery&action=get_user_count&id=1
		function getDrawCountInfo() {
			$.ajax({
				url: 'https://bbs-act.meizu.cn/index.php',
				type: 'POST',
				data: {
					mod: 'index',
					action: 'get_user_count',
					id: drawtype
				},
				dataType: 'json',
				success: function(rep) {
					if(200 == rep.code) {
						var data = rep.data;
						login_yes_em.eq(0).text(parseInt(data.paid_chance) + parseInt(data.free_chance));
						login_yes_em.eq(1).text(data.free_chance);
						login_yes_em.eq(2).text(data.mb);
						$('.login_no').addClass('hide');
						$('.login_yes').removeClass('hide');
					}
				}
			})
		}

		//获取收货信息http://bbs.meizu.cn/app.php?mod=shop&action=single_address
		function getAddressInfo() {
			$.ajax({
				url: 'https://bbs-act.meizu.cn/index.php',
				type: 'GET',
				data: {
					mod: 'index',
					action: 'single_address'
				},
				cache: false,
				dataType: 'json',
				success: function(rep) {
					var dat = rep.data,
						res = rep.code;
					if(res == 200) {
						if(typeof(dat) == 'object' && dat.id) {
							$('.getinfo_name input').val(dat.name);
							$('.getinfo_name span').text(dat.name);
							$('.getinfo_phone input').val(dat.phone);
							$('.getinfo_phone span').text(dat.phone);
							$('.getinfo_address input').val(dat.address);
							$('.getinfo_address span').text(dat.address);
							$('.blank_no').addClass('hide');
							$('.blank_yes').removeClass('hide');
						}
					}
				}
			})
		}

		function wrongTip(txt) {
			postFlag = !postFlag;
			var layerH = $('.layui-layer-content').height();
			$('.layui-layer .blank_btn p').text(txt).fadeIn('200', function() {
				if($(this).hasClass('hide')) {
					$('.layui-layer-content').height(layerH + 30);
				}
				$('.layui-layer .blank_btn p').removeClass('hide');

			})
			setTimeout(function() {
				$('.layui-layer .blank_btn p').fadeOut('slow', function() {
					$('.layui-layer-content').height(layerH);
					$('.layui-layer .blank_btn p').addClass('hide');
					postFlag = !postFlag;
				});
			}, 3000);
			return false;
		}
		//提交收货信息
		function postAddressInfo() {
			var name = $('.layui-layer .getinfo_name input').val(),
				phone = $('.layui-layer .getinfo_phone input').val(),
				address = $('.layui-layer .getinfo_address input').val();
			if(!postFlag) {
				return;
			}
			if(name == '' || phone == '' || address == '') {
				wrongTip('带 * 项为必填');
			} else if(!/^[A-Za-z\u4e00-\u9fa5]*$/.test(name) || name.length > 20) {
				wrongTip('姓名只能是汉字或字母，且不能超过20个字');
			} else if(!/^1[3|4|5|7|8]\d{9}$/.test(phone)) {
				wrongTip('手机号格式不对');
			} else if(address.length > 100) {
				wrongTip('地址长度不得大于100字符');
			} else {
				$.ajax({
					url: './index.php',
					type: 'POST',
					data: {
						mod: 'index',
						action: 'update_address',
						id: drawtype,
						name: name,
						phone: phone,
						address: address,
						win_id: $('#getinfo_id').val()
					},
					dataType: 'json',
					success: function(rep) {
						var res = rep.code;
						if(res == 200) {
							layer.closeAll();
							dialog('提交成功');
						} else {
							wrongTip(rep.message);
						}
					}
				})
			}
		}
		//获取中奖名单
		var listWheelF, wheelTime = 3000;

		function getWinnerList() {
			$.ajax({
				url: 'https://bbs-act.meizu.cn/index.php',
				type: 'POST',
				data: {
					mod: 'index',
					action: 'win_list',
					limit: 20,
					id: drawtype
				},
				dataType: 'json',
				success: function(rep) {
					if(rep.code == 200) {
						var listArr = rep.data.list,
							len = listArr.length,
							listStr = '',
							listHtml = '';
						if(len == 0) {
							$('.winner_list ul').append('<li>暂无用户中奖！</li>')
						} else {
							for(i = 0; i < len; i++) {
								listStr += '<li><span class="giftname c_blue">' + listArr[i].award_name + '</span><em class="uname" title="' + listArr[i].username + '">' + listArr[i].username + '</em></li>';
							}
							if(listArr.length < minLen && $('.draw_people ul li').length < minLen) {
								for(j = 0; j < minLen / listArr.length; j++) {
									listHtml += listStr;
								}
								listStr = listHtml;
							}
							$('.winner_list ul').append(listStr)
						}
						clearTimeout(listWheelF);
						setTimeout('listWheel()', wheelTime);
					}
				}
			});
		}

		//名单轮播
		listWheel = function() {
			var ulEle = $('.winner_list ul'),
				liLen = $('.winner_list ul li').length; //('marginTop', '-24px')
			ulEle.animate({
				marginTop: '-35px'
			}, 800, function() {
				ulEle.css('marginTop', '0px').find('li').eq(0).remove();
			})
			if(liLen <= minLen) {
				clearTimeout(listWheelF);
				getWinnerList();
			}
			listWheelF = setTimeout('listWheel()', wheelTime);
		}
		/** 限制输入框只能输入数字 **/
		$.fn.numberInput = function(len, flt) {
			$(this).css("ime-mode", "disabled").bind('propertychange input', function() {
				if(/\D/.test($(this).val())) {
					$(this).val($(this).val().replace(/\D/g, ""));
				}
				if($(this).val().length > len && len != 0) {
					$(this).val($(this).val().substring(0, len));
				}
			});
		};

	});

})(window.jQuery);