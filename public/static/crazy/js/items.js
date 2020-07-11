/**
 * doi tuong quan li item
 * @type {Object}
 */
Crazy.items = {
    currentID: 0,
    listID: [],
    module:"",
    title: "khoản mục",
    urls: {},
    templates: {},
    init_list: ["urls", "templates", "module", "title"],

    init: function(args) {
        if (!args || typeof args == 'undefined') return;
        for (var key of this.init_list) {
            if (typeof args[key] != 'undefined') {
                var d = args[key];
                var t = Crazy.getType(d);

                var t2 = (typeof(this[key]) != 'undefined') ? Crazy.getType(this[key]) : "string";
                if ((t == 'array' && t2 == 'array') || (t == 'object' && t2 == 'object')) {
                    for (var k in d) {
                        var v = d[k];
                        this[key][k] = v;
                    }
                } else {
                    this[key] = d;
                }
            }
        }
    },

    callApi:function(method, ids){
        var self = this;
        var params = {
            trash:["chuyển", "vào thùng rác", self.urls.move_to_trash_url],
            delete: ["xóa vĩnh viễn", "", self.urls.delete_url],
            restore:["khôi phục", "", self.urls.restore_url]
        };
        this.listID = ids;
        var msg = "Bạn có chắc chắn muốn " + params[method][0] + " " + (
            (ids.length > 1 )? (ids.length + " "+ this.title +" này") :(
                "<strong>" + $('#crazy-item-' + ids[0]).data('name') + "</strong>"
            )
        ) + " " + params[method][1] + "?";
        Crazy.modal.confirm(msg, function(ans) {
            if (ans) {
                showLoading();
                Crazy.ajax(params[method][2], "POST", { ids: self.listID }, function(rs) {
                    hideLoading();
                    if (rs.status) {
                        if (rs.data) {

                            for (var i = 0; i < rs.data.length; i++) {
                                var rmid = rs.data[i];
                                $('#crazy-item-' + rmid + ', .crazy-list .crazy-item-' + rmid).hide(400, function() {
                                    $(this).remove();
                                });
                            }

                        }
                        if(rs.errors.length){
                            Crazy.modal.warning(rs.errors.join("<br>"));
                        }
                    }
                    else if(rs.message){
                        Crazy.modal.warning(rs.message);
                    }
                    else {
                        Crazy.modal.alert("Đã có lỗi bất ngờ xảy ra. Vui lòng thử lại sau giây lát");
                    }
                }, function(){
                    hideLoading();
                });
            }
        });
    },

    moveToTrash: function(ids) {
        this.callApi("trash", ids);
    },

    delete: function(ids) {
        this.callApi("delete", ids);
    },

    restore: function(ids) {
        this.callApi("restore", ids);
    },

    checkAll: function () {
        $('.crazy-list input[type="checkbox"].crazy-check-item, .crazy-list input[type="checkbox"].crazy-check-all').prop('checked', true);
    },
    
    unCheckAll: function () {
        $('.crazy-list input[type="checkbox"].crazy-check-item, .crazy-list input[type="checkbox"].crazy-check-all').prop('checked', false);
    }
};

$(function() {
    if (typeof window.crazyItemsInit == 'function') {
        window.crazyItemsInit();
        window.crazyItemsInit = null;
    }
    if($('.crazy-list').length){
        // delete item
        // su kien click xoa
        $(document).on('click', '.crazy-list .btn-move-to-trash', function() {
            var id = $(this).data('id');
            Crazy.items.moveToTrash([id]);
            return false;
        });
        

        $(document).on('click', '.crazy-list .btn-restore', function() {
            var id = $(this).data('id');
            Crazy.items.restore([id]);
            return false;
        });
        

        $(document).on('click', '.crazy-list .btn-delete', function() {
            var id = $(this).data('id');
            Crazy.items.delete([id]);
            return false;
        });


        var check_selector = '.crazy-list input[type="checkbox"].crazy-check-';
        // danh dau tat ca
        $(document).on('click', check_selector+'all', function() {
            if ($(this).is(':checked')) {
                Crazy.items.checkAll();
            } else {
                Crazy.items.unCheckAll();
            }
        });
        
        $(document).on('click', '.crazy-btn-check-all', function() {
            if ($(check_selector+'all').is(':checked')) {
                Crazy.items.unCheckAll();
            } else {
                Crazy.items.checkAll();
            }
        });
        
        

        // danh dau item
        $(document).on('click', check_selector+'item', function() {
            var s = true;
            var cs = $(check_selector+'item');
            for (var i = 0; i < cs.length; i++) {
                if (!$(cs[i]).is(':checked')) {
                    s = false;
                }
            }
            if (s) {
                $(check_selector+'all').prop('checked', true);
            } else {
                $(check_selector+'all').prop('checked', false);
            }
        });
        
        // delete all item
        $(document).on('click', '.crazy-btn-move-to-trash-all', function() {
            var list = $(check_selector+'item:checked');
            var ids = [];
            if (list.length == 0) {
                return Crazy.modal.alert("Bạn chưa chọn mục nào");
            }
            for (var i = 0; i < list.length; i++) {
                ids[ids.length] = $(list[i]).val();
            }
            Crazy.items.moveToTrash(ids);
            return false;
        });

        // delete all item
        $(document).on('click', '.crazy-btn-delete-all', function() {
            var list = $(check_selector+'item:checked');
            var ids = [];
            if (list.length == 0) {
                return Crazy.modal.alert("Bạn chưa chọn mục nào");
            }
            for (var i = 0; i < list.length; i++) {
                ids[ids.length] = $(list[i]).val();
            }
            Crazy.items.delete(ids);
            return false;
        });

        // restore
        $(document).on('click', '.crazy-btn-restore-all', function() {
            var list = $(check_selector+'item:checked');
            var ids = [];
            if (list.length == 0) {
                return Crazy.modal.alert("Bạn chưa chọn mục nào");
            }
            for (var i = 0; i < list.length; i++) {
                ids[ids.length] = $(list[i]).val();
            }
            Crazy.items.restore(ids);
            return false;
        });
    }
    

});