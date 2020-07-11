$(function(){
    const SliderItem = function(options) {
        this.urls = {};
        this.id = 0;
        this.template = "";
        this.init_list = ["urls", "template"];
        this.options = options;
        var self = this;
        this.init = args => {
            Crazy.setup(this, args || this.options);
            this.onStart();
        };
        this.onStart = function() {
            this.enableSort();
            
            $(document).on('click', '.item-actions .btn-delete-item', function(){
                self.delete($(this).data('id'));
            });
        };

        this.enableSort = function(){
            Crazy.func.call("Crazy.nestable.add", ['#crazy-slider-item-list']);
        };
        this.disableSort = function(){
            Crazy.func.call("Crazy.nestable.remove", ['#crazy-slider-item-list']);
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
            Crazy.modal.confirm("bạn có chắc chắn muốn xóa slider này?", function(status){
                if(status){
                    showLoading();
                    Crazy.ajax(self.urls.delete, "POST", {ids:[id]}, function(rs){
                        hideLoading();
                        if(rs.status){
                            $('#crazy-slider-item-list').nestable('remove', id);
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
    if(typeof slider_item_data == 'object'){
        options = slider_item_data;
    }
    else if(typeof crazy_data == 'object'){
        let urls = {};
        let list = ["add", "create", "update", "detail", "delete", "sort"];
        for (let i = 0; i < list.length; i++) {
            const act = list[i];
            if(typeof crazy_data[act+"_slider_item_url"] == "string"){
                urls[act+"_url"] = crazy_data[act+"_slider_item_url"];
            }
        }
        options.urls = urls;
    }

    let slider_item = new SliderItem(options);
    slider_item.init();
    if(typeof Crazy.slider != "object"){
        Crazy.slider = {};
    }
    Crazy.slider.items = slider_item;

});
