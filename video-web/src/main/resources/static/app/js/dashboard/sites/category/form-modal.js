$(function () {
    var $modal = $('.modal');
    var $form = $modal.find("form");
    var $btn = $modal.find("button[data-type=submit]");

    $form.validate({
        rules: {
            categoryCode: {
                required: true,
                rangelength: [1, 20],
                remote: {
                    url: ctx + "/validate/categoryCode",
                    type: 'post',
                    data: {
                        'categoryCode': function () {
                            return $('#categoryCode').val()
                        },
                        'oldCategoryCode': function () {
                            return $("#old-categoryCode").val();
                        }
                    }
                }
            },
            categoryName: {
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