$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            dictType: {
                required: true
            },
            dictCode: {
                required: true,
                rangelength: [1, 64],
                remote: {
                    url: ctx + "/validate/dictCode",
                    type: 'post',
                    data: {
                        'dictType': function () {
                            return $('#dictType').val()
                        },
                        'dictCode': function () {
                            return $('#dictCode').val()
                        },
                        'oldDictCode': function () {
                            return $("#old-dictCode").val();
                        }
                    }
                }
            },
            value: {
                required: true,
                rangelength: [1, 128]
            },
            remark: {
                required: false,
                rangelength: [1, 128]
            },
            sort: {
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