Crazy.tags = {
    urls: {},
    id: 0,
    template: "",
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
    edit:function(id,name) {
        this.id = id;
        var self = this;
        Crazy.modal.popup({
            title: "Cập nhật thẻ",
            btnDone:"Cập nhật",
            inputs: {
                name:{
                    type: "text",
                    label: "Thẻ",
                    placeholder: "Nhập thẻ",
                    value:name,
                    validate: function(val){
                        return (val.length && val.split(",").length <= 1);
                    }
                }
            },
            done: function(data){
                var updateData = {
                    id: self.id,
                    tag: data.name
                }
                Crazy.ajax(self.urls.update_url, "PUT", updateData, function(rs){
                    if(rs.status){
                        let $tagItem = $('#crazy-item-'+rs.data.id);
                        $tagItem.data('name', rs.data.name);
                        $tagItem.find('.data-name').html(rs.data.name);
                    }else{
                        Crazy.modal.error(rs.message, function(){
                            Crazy.modal.hide_callback = function(){
                                Crazy.modal.show("popup-modal");
                            };
                        });
                    }
                }, function(e){
                    Crazy.modal.error("lỗi ko xác định", function(){
                        Crazy.modal.hide_callback = function(){
                            Crazy.modal.show("popup-modal");
                        };
                    });
                })
            }
        })

    },
    create:function(){
        var self = this;
        Crazy.modal.popup({
            title: "Thêm thẻ",
            btnDone:"Thêm",
            inputs: {
                tags:{
                    type: "text",
                    label: "Thẻ",
                    placeholder: "Nhập thẻ",
                    validate: function(val){
                        return val.length;
                    }
                }
            },
            done: function(data){
                showLoading();
                Crazy.ajax(self.urls.create_url, "POST", data, function(rs){
                    hideLoading();
                    if(rs.status){
                        
                        if(rs.data.length){
                            var created = 0;
                            var ignore = 0;
                            for (let i = 0; i < rs.data.length; i++) {
                                const tag = rs.data[i];
                                if(!$('#crazy-item-'+tag.id).length){
                                    let ith = Crazy.str.eval(self.template, tag);
                                    $('.crazy-list-body').append(ith);
                                    created++;
                                }else{
                                    ignore++;
                                }
                            }
                            if(created){
                                Crazy.modal.success("Đã thêm "+created+" thẻ mới thành công"+(ignore? ", và "+ignore +" thẻ đã được thêm trước đó":"") + "!");
                            }
                            else if(ignore){
                                Crazy.modal.warning("Tất cả các thẻ đã được thêm trước đó!");
                            }
                        }else{
                            Crazy.modal.error("Lỗi không xác định! Vui lòng thử lại sau giây lát!", function(){
                                Crazy.modal.hide_callback = function(){
                                    Crazy.modal.show("popup-modal");
                                };
                            });
                        }
                    }else{
                        Crazy.modal.error(rs.message, function(){
                            Crazy.modal.hide_callback = function(){
                                Crazy.modal.show("popup-modal");
                            };
                        });
                    }
                }, function(e){
                    Crazy.modal.error("lỗi ko xác định", function(){
                        Crazy.modal.hide_callback = function(){
                            Crazy.modal.show("popup-modal");
                        };
                    });
                })
            }
        })
    }
    
};

$(function(){
    if (typeof window.tagsInit == 'function') {
        window.tagsInit();
        window.tagsInit = null;
    }
    $(document).on('click', '.crazy-list .btn-edit-tag', function() {
        var id = $(this).data('id');
        Crazy.tags.edit(id, $('#crazy-item-'+id).data("name"))
        return false;
    });
    

    $('.btn-create-tag').click(function(){
        Crazy.tags.create();
    });
});