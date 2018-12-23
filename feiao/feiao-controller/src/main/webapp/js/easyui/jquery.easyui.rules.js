(function($){
	/** 自定义验证规则 */
	$.extend($.fn.validatebox.defaults.rules, {    
		equals: { // 验证两次密码是否一致
	        validator: function(value, param){     // 验证函数
	        	// value : 自己文本框中的值
	        	// param : 参数数组 param[0]: #password
	           return value == $(param[0]).val();
	        },    
	        message: "两次密码不一致！"    // 提示信息
	    },
	    phone: { // 验证手机号码
	        validator: function(value){     // 验证函数
	        	// value : 自己文本框中的值
	           return /^1[3|5|7|8]\d{9}$/.test(value)
	        },    
	        message: "手机号码格式不正确！"    // 提示信息
	    },
	    verify: { // 验证码
	        validator: function(value, param){     // 验证函数
	        	// value : 自己文本框中的值
	        	var reg = new RegExp("^\\d{"+ param[0] +"}$"); 
	            return reg.test(value)
	        },    
	        message: "验证码格式不正确！"    // 提示信息
	    }
	});
})(jQuery);