$(function () {
    $('#SITES').addClass('open active');
    $('#SITES_FORUM').addClass('active');

    var $form = $('#form');

    var beforeEditName = function () {
        return false;
    };

    var beforeRemove = function (treeId, treeNode) {
        if (treeNode.id <= 0) {
            return false;
        }
        $.messager.confirm("提示", "确定删除" + treeNode.name + "吗?", function () {
            $("#forumId").val(treeNode.id);
            formSubmit($form, null, function () {
                var treeObj = $.fn.zTree.getZTreeObj("forum-tree");
                treeObj.removeNode(treeNode);
            })

        });

        return false;
    };

    var addHoverDom = function (treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) {
            return;
        }
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add'></span>";
        sObj.after(addStr);

        var addBtn = $("#addBtn_" + treeNode.tId);
        if (addBtn) {
            addBtn.bind("click", function () {
                $("#myModal").modal({
                    backdrop: 'static',
                    remote: ctx + '/dashboard/sites/forum/create?parentForumId=' + treeNode.id
                });
            });
        }

        if (treeNode.id > 0) {
            var editBtn = $("#" + treeNode.tId + "_edit");
            if (editBtn) {
                editBtn.bind("click", function () {
                    $("#myModal").modal({
                        remote: ctx + '/dashboard/sites/forum/' + treeNode.id + '/edit'
                    });
                });
            }
        }
    };

    var removeHoverDom = function (treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
    };

    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom
        },
        edit: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove
        }
    };

    $.fn.zTree.init($("#forum-tree"), setting, zNodes);

});