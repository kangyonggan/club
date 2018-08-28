$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            menuCode: {
                required: true,
                isMenuCode: true,
                remote: {
                    url: "/validate/menuCode",
                    type: 'post',
                    data: {
                        'menuCode': function () {
                            return $('#menuCode').val()
                        },
                        'oldMenuCode': function () {
                            return $('#old-menuCode').val();
                        }
                    }
                }
            },
            menuName: {
                required: true,
                rangelength: [1, 20]
            },
            sort: {
                isInt: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');

            formSubmit($(form), $btn, function () {
                $modal.modal('hide');
                window.location.reload();
            });
        }
    });


});