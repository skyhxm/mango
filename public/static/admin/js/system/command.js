define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'system.command/index',
        add_url: 'system.command/add',
        edit_url: 'system.command/edit',
        delete_url: 'system.command/delete',
        export_url: 'system.command/export',
        modify_url: 'system.command/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'type', title: '类型'},                    {field: 'params', title: '参数'},                    {field: 'command', title: '命令'},                    {field: 'executetime', title: '执行时间'},                    {field: 'createtime', title: '创建时间'},                    {field: 'updatetime', title: '更新时间'},                    {field: 'status', title: '状态', templet: ea.table.switch},                    {width: 250, title: '操作', templet: ea.table.tool},
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});