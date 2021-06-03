define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'test.user/index',
        add_url: 'test.user/add',
        edit_url: 'test.user/edit',
        delete_url: 'test.user/delete',
        export_url: 'test.user/export',
        modify_url: 'test.user/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'id'},                    {field: 'name', title: 'mingcheng'},                    {field: 'user_id', title: 'user_id'},                    {field: 'testUserPro.name', title: 'mingcheng'},                    {width: 250, title: '操作', templet: ea.table.tool},
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