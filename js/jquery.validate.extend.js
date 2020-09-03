!(function($, conf){
    if(!$.validator) return;
    var key_rangeLengthByte = 'rangeLengthByte',   // 中文字两个字节
        key_zipCode = 'zipCode',                   // 邮政编码验证
        key_mobile = 'mobile',                     // 手机号
        key_landline = 'landline',                 // 国内座机电话
        key_phone = 'phone',                       // 电话格式(手机和座机)
        key_idNumber = 'idNumber',                 // 身份证号
        key_account = 'account',                   // 帐号
        key_cn = 'cn',                             // 只包含中文
        key_money = 'money',                       // 数字/货币金额（支持负数、千分位分隔符）
        key_alphanumeric = 'alphanumeric',         // 由数字和字母组成
        key_pwdStrength = 'pwdStrength',           // 密码强度，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
        key_numericUnderline = 'numericUnderline',               // 至少1个字母，1个数字和1个下划线
        key_alphaNumericChar = 'alphaNumericChar',               // 至少1个字母，1个数字和1个特殊字符
        key_alphaAlphaNumericChar = 'alphaAlphaNumericChar',     // 至少1个大写字母，1个小写字母，1个数字和1个特殊字符
        key_atLeastN = 'atLeastN',                 // 至少n个字符，默认为6
        key_startWithLetter = 'startWithLetter',   // 字母开头
        key_ipv4 = 'ipv4',                         // ip-v4
        key_ipv6 = 'ipv6';                         // ip-v6

    var cn = {
        required: "这是必填字段",
        remote: "请修正此字段",
        email: "请输入有效的电子邮件地址",
        url: "请输入有效的网址",
        date: "请输入有效的日期",
        dateISO: "请输入有效的日期 (YYYY-MM-DD)",
        number: "请输入有效的数字",
        digits: "只能输入数字",
        creditcard: "请输入有效的信用卡号码",
        equalTo: "你的输入不相同",
        extension: "请输入有效的后缀",
        maxlength: "最多可以输入 {0} 个字符",
        minlength: "最少要输入 {0} 个字符",
        rangelength: "请输入长度在 {0} 到 {1} 之间的字符串",
        range: "请输入范围在 {0} 到 {1} 之间的数值",
        step: "请输入 {0} 的整数倍值",
        max: "请输入不大于 {0} 的数值",
        min: "请输入不小于 {0} 的数值"
    };

    cn[key_rangeLengthByte] = '请输入在{0}-{1}个字节之间的字符(一个中文字算2个字节)';
    cn[key_zipCode] = '请输入有效的邮政编码';
    cn[key_mobile] = '请输入有效的手机号码';
    cn[key_landline] = '请输入有效的座机号码';
    cn[key_phone] = '请输入有效的电话号码';
    cn[key_idNumber] = '请输入有效的身份证号';
    cn[key_account] = '请输入在{0}-{1}位的有效的帐号';
    cn[key_cn] = '只能输入汉字';
    cn[key_money] = '请输入有效的货币金额';
    cn[key_alphanumeric] = '只能由数字和字母组成';
    cn[key_pwdStrength] = '密码强度不够';
    cn[key_ipv4] = 'ip(v4)格式不正确';
    cn[key_ipv6] = 'ip(v6)格式不正确';
    cn[key_numericUnderline] = '至少1个字母，1个数字和1个下划线';
    cn[key_alphaNumericChar] = '至少1个字母，1个数字和1个特殊字符';
    cn[key_alphaAlphaNumericChar] = '至少1个大写字母，1个小写字母，1个数字和1个特殊字符';
    cn[key_atLeastN] = '至少6个字符';
    cn[key_startWithLetter] = '只能字母开头';


    /* var className = conf.tipClass;
    var css = [
        '.'+className+'{position:absolute;right:0;top:100%;margin-top:5px;z-index:3;color:#a94442;font-style:normal;background:#fff;}',
        '.'+className+':not(:empty){border:1px solid rgba(169,68,66,.7);padding:1px 6px;}',
        '.'+className+':not(:empty)::before{content:"";position:absolute;border:7px solid transparent;border-bottom-color:rgba(169,68,66,.7);bottom:100%;left:10px;}',
        '.'+className+':not(:empty)::after {content:"";position:absolute;border:6px solid transparent;border-bottom-color:#fff;bottom:100%;left:11px;}'
    ].join('\n');


    if($('#validateCss_vj').length<=0){
        $('<style />').attr('id','validateCss_vj').html(css).appendTo('head');
    } */

    $.extend($.validator.messages, transMsg(cn));
    var validAdd = $.validator.addMethod;

    validAdd(key_rangeLengthByte, function(value, element, param) {
        var length = value.length;
        for(var i = 0; i < value.length; i++){
            if(value.charCodeAt(i) > 127) length++;
        }
        return this.optional(element) || (length >= param[0] && length <= param[1]);
    });
    validAdd(key_zipCode, function(value, element) {
        var reg = /^[0-9]{6}$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_mobile, function(value, element) {
        // var reg = /^1((3[\d])|(4[5,6,7,9])|(5[0-3,5-9])|(6[5-7])|(7[0-8])|(8[\d])|(9[1,8,9]))\d{8}$/;
        var reg = /^1\d{10}$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_landline, function(value, element) {
        var reg = /\d{3}-\d{8}|\d{4}-\d{7}/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_phone, function(value, element) {
        var reg = /^((0\d{2,3}-\d{7,8})|(1[345789]\d{9}))$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_idNumber, function(value, element) {
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_account, function(value, element, param) {
        var reg = /^[a-zA-Z][a-zA-Z0-9_]+$/;
        var length = value.length;
        return this.optional(element) || (reg.test(value) && length >= param[0] && length <= param[1]);
    });
    validAdd(key_cn, function(value, element) {
        var reg = /^[\u4e00-\u9fa5]+$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_money, function(value, element) {
        var reg = /(^[-]?[1-9]\d{0,2}($|(,\d{3})*($|(\.\d{1,2}$))))|((^[0](\.\d{1,2})?)|(^[-][0]\.\d{1,2}))$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_alphanumeric, function(value, element) {
        // var reg = /^[A-Za-z0-9]+$/;
        var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]*$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_pwdStrength, function(value, element) {
        var reg = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_ipv4, function(value, element) {
        var reg = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_ipv6, function(value, element) {
        var reg = /^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$/i;
        return this.optional(element) || (reg.test(value));
    });

    validAdd(key_numericUnderline, function(value, element) {
        var reg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[_]).{1,}$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_alphaNumericChar, function(value, element) {
        var reg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{1,}$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_alphaAlphaNumericChar, function(value, element) {
        var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{1,}$/;
        return this.optional(element) || (reg.test(value));
    });
    validAdd(key_atLeastN, function(value, element, param){
        param = (typeof param === 'number') ? param : 6;
        return this.optional(element) || (value.length >= param);
    });
    validAdd(key_startWithLetter, function(value, element){
        var reg = /^[a-zA-z].*/;
        return this.optional(element) || (reg.test(value));
    });


    var oo = {
        errorElement: "em",
        errorPlacement: function (error, element) {
            error.addClass(conf.ifTip ? conf.tipClass : 'help-block');
            if(element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
            if(conf.ifIco && !element.next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
            }
        },
        success : function (label, element) {
            if(conf.ifIco && !$(element).next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parent().addClass("has-error").removeClass("has-success");
            if(conf.ifIco) $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
        },
        unhighlight: function (element, errorClass, validClass) {
            var $e = $(element).parent().removeClass("has-error");
            if(conf.ifSuccess) $e.addClass("has-success");
            if(conf.ifIco) $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
        }
    };
    $.validator.setDefaults(oo);

    function transMsg(data){
        for(var key in data) {
            if(data[key].indexOf('{0}')>-1) data[key] = $.validator.format(data[key]);
        }
        return data;
    }

})(jQuery, {ifIco: false, ifTip: true, tipClass: 'vj-vld-tip', ifSuccess: false});