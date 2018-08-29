$(function () {

    /**
     * 日期时间格式化
     *
     * @param fmt
     * @returns {*}
     */
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "H+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    };

    /**
     * art日期时间格式化
     */
    template.helper('datetimeFormat', function (date) {
        var d = new Date();
        d.setTime(date);
        return d.format("yyyy-MM-dd HH:mm:ss");
    });

    /**
     * art日期格式化
     */
    template.helper('dateFormat', function (date) {
        var d = new Date();
        d.setTime(date);
        return d.format("yyyy-MM-dd");
    });

    /**
     * art时间格式化
     */
    template.helper('timeFormat', function (date) {
        var d = new Date();
        d.setTime(date);
        return d.format("HH:mm:ss");
    });

    /**
     * art日期时间自定义格式化
     */
    template.helper('format', function (date, format) {
        var d = new Date();
        d.setTime(date);
        return d.format(format);
    });

    /**
     * art长度限定
     */
    template.helper('limit', function (str, len) {
        return str.substring(0, len);
    });

    // 有滚动条时才显示回到顶部按钮
    window.onscroll = function () {
        if (document.documentElement.scrollTop + document.body.scrollTop > 100) {
            document.getElementById("btn-scroll-up").style.display = "block";
        } else {
            document.getElementById("btn-scroll-up").style.display = "none";
        }
    };

    /**
     * 序列化表单
     */
    $.fn.serializeForm = function () {
        var json = {};
        var arr = this.serializeArray();
        $.each(arr, function () {
            if (json[this.name]) {
                if (!json[this.name].push) {
                    json[this.name] = [json[this.name]];
                }
                json[this.name].push(this.value || '');
            } else {
                json[this.name] = this.value || '';
            }
        });

        return json;
    };

    // 提示框
    $.messager.model = {
        cancel: {text: "<i class='ace-icon fa fa-times'></i>取消", classed: "btn-default"},
        ok: {text: "<i class='ace-icon fa fa-check'></i>确定"}
    };

    // 关闭时清除模态框的数据
    $(document).on('hidden.bs.modal', '.modal', function () {
        $(this).removeData('bs.modal');
    });

    // 让chosen select支持响应式
    $(window).off('resize.chosen').on('resize.chosen', function () {
        $('.chosen-select').each(function() {
            var $this = $(this);
            $this.next().css({'width': $this.parent().width()});
        })
    }).triggerHandler('resize.chosen');
});

// 提示信息
var last_gritter;
var showMessage = function (type, message) {
    if (last_gritter) {
        $.gritter.remove(last_gritter);
    }
    last_gritter = $.gritter.add({
        title: '消息',
        text: message,
        time: 1500,
        class_name: type
    });
};

var Message = {
    success: function (message) {
        showMessage('gritter-success', message);
    },

    warning: function (message) {
        showMessage('gritter-warning', message);
    },

    error: function (message) {
        showMessage('gritter-error', message);
    },

    info: function (message) {
        showMessage('gritter-info', message);
    }
};

/**
 * 创建富文本框
 *
 * @param kedit
 */
function kedit(kedit){
    return KindEditor.create(kedit,{
        uploadJson: ctx + '/file/editor',
        fileManagerJson: ctx + '/file/manager'
    });
}

/**
 * 创建简单版富文本框
 *
 * @param kedit
 */
function simkedit(kedit){
    return KindEditor.create(kedit,{
        uploadJson: ctx + '/file/editor',
        fileManagerJson: ctx + '/file/manager',
        items : [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    });
}