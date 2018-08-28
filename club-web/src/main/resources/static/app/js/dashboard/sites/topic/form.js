$(function () {
    $('#SITES').addClass('open active');
    $('#SITES_TOPIC').addClass('active');

    var $form = $("#form");
    var $btn = $form.find("button");

    $form.validate({
        ignore: '',
        rules: {
            forumId: {
                required: true
            },
            title: {
                required: true,
                rangelength: [1, 128]
            },
            content: {
                required: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();

            $btn.button('loading');
            formSubmit($(form), $btn, function () {
                $btn.button('reset');
                window.location.href = ctx + "/dashboard/sites/topic";
            });
        }
    });
});