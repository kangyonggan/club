$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            nickName: {
                required: true,
                rangelength: [1, 20]
            },
            gender: {
                required: true
            },
            coin: {
                required: true,
                isInt: true
            },
            exp: {
                required: true,
                isInt: true
            },
            level: {
                required: true,
                isInt: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            formSubmit($(form), $btn, function () {
                $modal.modal('hide');
                var params = $("#form").serializeForm();
                $('#table').bootstrapTable("refresh", {query: params});
            });
        }
    });
});