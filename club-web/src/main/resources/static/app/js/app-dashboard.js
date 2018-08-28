$(function () {
    // modal form 提交
    $('.modal').on('click', '[data-type=submit]', function (e) {
        e.preventDefault();
        $($(this).parents('.modal').find("form")).submit();
    });

    // 查询。<@c.link type="submit" table_id="xxx" .../>
    $(document).on("click", "[data-type='submit']", function (e) {
        e.preventDefault();
        var $this = $(this);
        var $table = $("#" + $this.data("table-id"));

        var params = $this.parents("form").serializeForm();
        params.offset = 0;
        $table.bootstrapTable("refresh", {query: params});
        return false;
    });

    // 清除。<@c.link type="reset" .../>
    $(document).on("click", "[data-type='reset']", function (e) {
        e.preventDefault();
        var $this = $(this);
        var $form = $this.parents("form");

        $form.find("input").val("");
        $form.find("select").val("");
        $form.find(".chosen-select").trigger("chosen:updated");
        return false;
    });

    // 弹确认框。<@c.link type="confirm" title="" .../>
    $(document).on("click", "[data-type='confirm']", function (e) {
        e.preventDefault();
        var $this = $(this);
        var $table = $(this).parents("table");

        $.messager.confirm("提示", "确定" + $this.attr("title") + "吗?", function () {
            $.get($this.attr('href')).success(function () {
                Message.success("操作成功");
                var formId = $table.data("form-id");
                var params = $("#" + formId).serializeForm();
                $table.bootstrapTable("refresh", {query: params});
            }).error(function () {
                Message.error("网络错误，请稍后重试");
            })
        });
        return false;
    });
});

/**
 * 提交表单
 *
 * @param $form 表单
 * @param $btn 提交按钮
 * @param callback 回调
 */
function formSubmit($form, $btn, callback) {
    $form.ajaxSubmit({
        dataType: 'json',
        success: function (response) {
            if (response.respCo == '0000') {
                Message.success(response.respMsg);
                if (callback) {
                    callback(response);
                }
            } else {
                Message.error(response.respMsg);
            }
            if ($btn) {
                $btn.button('reset');
            }
        },
        error: function () {
            Message.error("服务器内部错误，请稍后再试。");
            if ($btn) {
                $btn.button('reset');
            }
        }
    });
}