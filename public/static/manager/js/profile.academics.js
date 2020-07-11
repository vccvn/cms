if(typeof Profile == "undefined"){
    var Profile = {};
}

Profile.academics = {
    urls: {},
    id: 0,
    template: "",
    init_list: ["urls"],

    init: function(args) {
        Crazy.setup(this, args);
        
    },
    showAddForm:function(name) {
        var self = this;
        Crazy.modal.popup({
            title: "Thêm Trình độ học vấn",
            btnDone:"Thêm",
            inputs: {
                title:{
                    type: "text",
                    label: "Trình độ",
                    placeholder: "Nhập trình dộ học vấn",
                    value:name,
                    validate: function(val){
                        return (val.length > 0);
                    }
                },
                keywords: {
                    type: "text",
                    label: "Từ khóa",
                    placeholder: "Nhập Từ khóa"
                }
            },
            done: function(data){
                Crazy.ajax(self.urls.add_url, "POST", data, function(rs){
                    if(rs.status){
                        Crazy.htmlSelect.addOption('academic_id', rs.data.id, rs.data.title);
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
    if(typeof profile_academics == 'object'){
        Profile.academics.init(profile_academics);
    }
    else if(typeof profile_data == 'object'){
        if(typeof profile_data.add_academic_url == "string"){
            Profile.academics.init({
                urls:{
                    add_url: profile_data.add_academic_url
                }
            });
        }
    }

});