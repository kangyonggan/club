$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            mobileNo: {
                required: true,
                rangelength: [1, 20],
                remote: {
                    url: ctx + "/validate/mobileNo",
                    type: 'post',
                    data: {
                        'mobileNo': function () {
                            return $('#mobileNo').val()
                        },
                        'oldMobileNo': function () {
                            return $("#old-mobileNo").val();
                        }
                    }
                }
            },
            password: {
                required: true,
                isPassword: true
            },
            rePassword: {
                required: true,
                equalTo: "#password"
            },
            email: {
                required: false,
                isEmail: true,
                remote: {
                    url: ctx + "/validate/email",
                    type: 'post',
                    data: {
                        'email': function () {
                            return $('#email').val()
                        },
                        'oldEmail': function () {
                            return $("#old-email").val();
                        }
                    }
                }
            },
            name: {
                required: false,
                rangelength: [1, 20]
            },
            idNo: {
                required: false,
                isIdNo: true,
                remote: {
                    url: ctx + "/validate/idNo",
                    type: 'post',
                    data: {
                        'idNo': function () {
                            return $('#idNo').val()
                        }
                    }
                }
            }
        },
        messages: {
            idNo: {
                remote: "身份证不合法"
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