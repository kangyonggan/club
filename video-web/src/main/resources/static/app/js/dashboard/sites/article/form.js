$(function () {
    $('#SITES').addClass('open active');
    $('#SITES_ARTICLE').addClass('active');

    var $form = $("#form");
    var $btn = $form.find("button[data-type=submit]");

    $form.validate({
        rules: {
            categoryCode: {
                required: true
            },
            title: {
                required: true,
                rangelength: [1, 128]
            },
            summary: {
                required: false,
                rangelength: [1, 256]
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();

            var value = $.trim($(document.getElementsByTagName("iframe")[0].contentWindow.document.body).html());
            if(!value){
                Message.warning("请填写文章内容！");
                return;
            }

            $btn.button('loading');
            formSubmit($(form), $btn, function () {
                $btn.button('reset');
                window.location.href = ctx + "/dashboard/sites/article";
            });
        }
    });
});