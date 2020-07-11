Crazy.theme = {
    ID: 0,
    listID: [],
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
    extract:function(id) {
        var self = this;
        if(id){
            var msg = "bạn có chắc chắn muốn giải nén <strong>" + $('#crazy-item-' + id).data('name') + "</strong>?";
            Crazy.modal.confirm(msg, function(ans){
                if(ans){
                    ajaxRequest(self.urls.extract, "POST", {id:id}, function(res){
                        if(res.status){
                            Crazy.modal.success(res.message);
                        }else{
                            Crazy.modal.warning(res.message);
                        }
                    }, function(e){
                        Crazy.modal.error("Lỗi không xác định. Vui lòng thử lại sau giay lát.");
                    });
                }
            });
        }
    }
    
};

$(function(){
    if (typeof window.crazyThemeInit == 'function') {
        window.crazyThemeInit();
        window.crazyThemeInit = null;
    }
    if($('.crazy-list').length){
        $(document).on('click', '.crazy-list .btn-extract', function() {
            var id = $(this).data('id');
            Crazy.theme.extract(id);
            return false;
        });
    }

});