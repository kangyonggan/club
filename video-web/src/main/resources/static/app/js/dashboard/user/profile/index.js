$(function () {
    $('#USER').addClass('open active');
    $('#USER_PROFILE').addClass('active');

    var $form = $('#form');
    var $btn = $form.find("button");

    $form.validate({
        rules: {
            password: {
                required: true,
                isPassword: true
            },
            rePassword: {
                required: true,
                equalTo: "#password"
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            formSubmit($(form), $btn, function () {
                $form.find("input[type=password]").val("");
            });
        }
    });
})