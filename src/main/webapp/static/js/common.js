const ajax = function (options) {
    return $.ajax({
        type: options.type || 'post',
        url: options.url,
        cache: options.cache || true,
        timeout: options.timeout,
        data: options.data || {},
        dataType: options.dataType || 'json',
        contentType: options.contentType !== undefined ? options.contentType : 'application/x-www-form-urlencoded',
        processData: options.processData !== undefined ? options.processData : true,
        success: options.success,
        complete: options.complete,
        error: options.error || function () {
            alert('请求错误，请重试！');
        }
    });
};

/**
 * guid
 */
function guid() {
    return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        let r = Math.random() * 16 | 0, v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

/**
 * 验证输入的邮件地址是否合法
 */
function isEmail(emailInput) {
    let reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!reg.test(emailInput)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 判断是否为手机号
 */
function isPhone(phone) {
    let reg = /^[1][3,4,5,7,8][0-9]{9}$/;
    if (!reg.test(phone)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 判断是否为电话号码
 */
function isTel(tel) {
    let reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
    if (!reg.test(tel)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 校验是数字
 */
function isNum(val) {
    let reg = /^([1-9]\d*|[0]{1,1})$/;
    if (reg.test(val)) {
        return true;
    } else {
        return false;
    }
}

let t = setTimeout(time, 1000);

function time() {
    clearTimeout(t);
    dt = new Date();
    var y = dt.getYear() + 1900;
    var mm = dt.getMonth() + 1;
    var d = dt.getDate();
    var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var day = dt.getDay();
    var h = dt.getHours();
    var m = dt.getMinutes();
    var s = dt.getSeconds();
    if (h < 10) {
        h = "0" + h;
    }
    if (m < 10) {
        m = "0" + m;
    }
    if (s < 10) {
        s = "0" + s;
    }
    if (document.getElementById("timeShow") != null) {
        document.getElementById("timeShow").innerHTML = "Local time：" + y + "-" + mm + "-" + d + " " + weekday[day] + " " + h + ":" + m + ":" + s + "";
    }
    t = setTimeout(time, 1000);
}

layui.use(['element', 'form', 'layer'], function () {
    const layer = layui.layer, form = layui.form;

    $('#logout').click(function () {
        layer.confirm('您确定要退出吗？', {btn: ['确定', '取消'], icon: 3}, function () {
            $('#logout-form').submit();
        });
    });

    $('#modify-pwd').click(function () {
        layer.open({
            type: 1,
            title: '修改密码',
            area: '500px',
            content: $('#form_modify_pwd_html').html(),
            success: function (layero, index) {
                form.render();
                form.verify({
                    pass: function (value) {
                        if (!/^[A-Za-z0-9]+$/.test(value)) {
                            return '密码必须是英文或数字';
                        }
                    }
                });
                $('#form_modify_pwd_close').click(function () {
                    layer.close(index);
                });
            }
        });
    });

    form.on('submit(formModifyPwd)', function (data) {
        ajax({
            url: "../modifyPwd",
            data: data.field,
            success: function (res) {
                if (res.code > 0) {
                    layer.closeAll();
                }
                layer.msg(res.msg, {icon: res.code > 0 ? 1 : 2});
            }
        })
        return false;
    });
})