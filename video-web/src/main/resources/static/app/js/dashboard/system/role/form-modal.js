$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            roleCode: {
                required: true,
                isRoleCode: true,
                remote: {
                    url: ctx + "/validate/roleCode",
                    type: 'post',
                    data: {
                        'roleCode': function () {
                            return $('#mobileNo').val()
                        },
                        'oldRoleCode': function () {
                            return $("#old-roleCode").val();
                        }
                    }
                }
            },
            roleName: {
                required: true,
                rangelength: [1, 20]
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