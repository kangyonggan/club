$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            channelNo: {
                required: true
            },
            respCo: {
                required: true,
                rangelength: [1, 64],
                remote: {
                    url: ctx + "/validate/respCo",
                    type: 'post',
                    data: {
                        'channelNo': function () {
                            return $('#channelNo').val()
                        },
                        'respCo': function () {
                            return $('#respCo').val()
                        },
                        'oldRespCo': function () {
                            return $("#old-respCo").val();
                        }
                    }
                }
            },
            respMsg: {
                required: true,
                rangelength: [1, 200]
            },
            merRespCo: {
                required: true,
                rangelength: [1, 64]
            },
            merRespMsg: {
                required: true,
                rangelength: [1, 200]
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