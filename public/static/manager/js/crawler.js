Crazy.crawler = {
    urls: {},
    id: 0,
    init_list: ["urls"],

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
        var $tpl = $('.tag-templates');
        if($tpl.length){
            this.template = $tpl.text();
            $tpl.remove();
        }
    },
    changeDynamicID:function(id){
        Crazy.ajax(this.urls.get_category_url, "GET", {dynamic_id:id}, function(rs){
            if(rs.status){
                if(rs.data){
                    Crazy.htmlSelect.changeOptions('category_id', rs.data);
                }else{
                    Crazy.htmlSelect.changeOptions('category_id', {"0": "Không"});
                }
            }else{
                Crazy.htmlSelect.changeOptions('category_id', {"0": "Không"});
            }
        })
    },
    changeTaskStatus:function (status, elem) {
        var data = {status:status,id:$(elem).data('task-id')};
        Crazy.ajax(this.urls.change_status_url, "POST", data, function(rs){
            cl(rs.status);
        })
    },
    runTask: function(ids) {
        var self = this;
        var msg = "bạn có chắc chắn muốn chạy " + (ids.length > 1 ? ids.length + " Task" : "<strong>" + $('#crazy-item-' + ids[0]).data('name') + "</strong>") + "?";
        Crazy.modal.confirm(msg, function(ans) {
            if (ans) {
                showLoading();
                Crazy.ajax(self.urls.run_url, "POST", { ids: ids }, function(rs) {
                    hideLoading();
                    if (rs.status) {
                        if (rs.data.count) {
                            Crazy.modal.info("Đã crawl được "+rs.data.count+" mới");
                        }else{
                            Crazy.modal.warning("Chông crawl được bài viết nào!");
                        }
                    } else {
                        Crazy.modal.error("Đã có lỗi bất ngờ xảy ra. Vui lòng thử lại sau giây lát");
                    }
                }, function (e){
                    hideLoading();
                    Crazy.modal.error("Đã có lỗi bất ngờ xảy ra. Vui lòng thử lại sau giây lát");
                });
            }
        });
    },

};

$(function(){
    var check_selector = '.crazy-list input[type="checkbox"].crazy-check-';
    if (typeof window.crawlerInit == 'function') {
        window.crawlerInit();
        window.tagsInit = null;
    }
    if(typeof crawler_urls != 'undefined' && Crazy.getType(crawler_urls) == 'object'){
        for (const key in crawler_urls) {
            if (crawler_urls.hasOwnProperty(key)) {
                const url = crawler_urls[key];
                Crazy.crawler.urls[key] = url;
            }
        }
    }

    if($('.btn-run-task').length){
        $(document).on('click', '.btn-run-task', function() {
            var id = $(this).data('id');
            Crazy.crawler.runTask([id]);
            return false;
        });
    }
    if($('.crazy-btn-run-all-task').length){
        $(document).on('click', '.crazy-btn-run-all-task', function() {
            var list = $(check_selector+'item:checked');
            var ids = [];
            if (list.length == 0) {
                return Crazy.modal.alert("Bạn chưa chọn mục nào");
            }
            for (var i = 0; i < list.length; i++) {
                ids[ids.length] = $(list[i]).val();
            }
            Crazy.crawler.runTask(ids);
            return false;
        });
    }
    
});