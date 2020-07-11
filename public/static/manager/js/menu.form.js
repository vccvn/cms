$(function(){
    const MenuForm = function(options) {
        this.urls = {};
        this.id = 0;
        this.template = "";
        this.actionTemplate = "";
        this.init_list = ["urls", "template"];
        this.options = options;
        var self = this;
        this.init = args => {
            Crazy.setup(this, args || this.options);
            this.onStart();
        };
        this.checkType = function(type){
            this.toggleBy('type', type == 'post');
        };

        this.toggleBy = function (ref, status) {
            var refNode = $('.toggle-by-'+ref);
            if(refNode.length){
                if(status){
                    refNode.removeClass("hide-by-"+ref);
                }else if(!refNode.hasClass("hide-by-"+ref)){
                    refNode.addClass("hide-by-"+ref);
                }
            }

            var rNode = $('.rtoggle-by-'+ref);
            if(rNode.length){
                if(!status){
                    rNode.removeClass("hide-by-"+ref);
                }else if(!rNode.hasClass("hide-by-"+ref)){
                    rNode.addClass("hide-by-"+ref);
                }
            }
        };
        
        this.onStart = function() {
            this.checkType($('.crazy-form input#type').val());
            this.enableSort();
            
            $(document).on('click', '.item-actions .btn-delete-menu', function(){
                self.delete($(this).data('id'));
            });
            
        };
        this.enableSort = function(){
            Crazy.func.call("Crazy.nestable.add", ['#crazy-menu-list']);
        };
        this.disableSort = function(){
            Crazy.func.call("Crazy.nestable.remove", ['#crazy-menu-list']);
        };

        this.sortCallback = function(l, e){
            var self = this;
            let raw = $(l).nestable('toArray');
            let data = {};
            raw.map(function (item, i) {
                data[item.id] = i+1;
            });
    
            Crazy.ajax(self.urls.sort, "POST", {data:data}, function(rs){
                if(rs.status){
                    console.log(rs.message);
                }
                else{
                    Crazy.modal.error(rs.message);
                }
            }, function(err){
                Crazy.modal.error("Lỗi không xác định");
            });
        };
        this.delete = function(id){
            Crazy.modal.confirm("bạn có chắc chắn muốn xóa menu này?", function(status){
                if(status){
                    showLoading();
                    Crazy.ajax(self.urls.delete, "POST", {ids:[id]}, function(rs){
                        hideLoading();
                        if(rs.status){
                            $('#crazy-menu-list').nestable('remove', id);
                        }else{
                            Crazy.modal.error(rs.message);
                        }
                    }, function(err){
                        //
                        hideLoading();
                        Crazy.modal.error("Lỗi không xác định!");
                    });
                }
            });
        };

    };

    
    
    let options = {};
    if(typeof menu_form_data == 'object'){
        options = menu_form_data;
    }
    
    let menu_form = new MenuForm(options);
    menu_form.init();
    if(typeof Crazy.menu != "object"){
        Crazy.menu = {};
    }
    Crazy.menu.form = menu_form;

});
