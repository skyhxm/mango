define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'addons/login_page/back/index',
        add_url: 'addons/login_page/back/add',
        edit_url: 'addons/login_page/back/edit',
        delete_url: 'addons/login_page/back/delete',
        export_url: 'addons/login_page/back/export',
        modify_url: 'addons/login_page/back/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'title', minWidth: 80, title: '页面名称'},
                    {field: 'status', title: '状态', width: 85, search: 'select', selectList: {0: '禁用', 1: '启用'}, templet: ea.table.switch},
                    {width: 250, title: '操作', templet: ea.table.tool,operat: ['edit']}
                ]],
                toolbar: ['refresh',
                      [],
                      'export'],
            });

            ea.listen();
        },
        add: function () {
            // alert(1)
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});