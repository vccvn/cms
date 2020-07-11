if(typeof Profile == "undefined"){
    var Profile = {};
}

Profile.works = {
    urls: {},
    id: 0,
    template: "",
    init_list: ["urls"],

    init: function(args) {
        Crazy.setup(this, args);
        
    },
    showAddForm:function(name, success) {
        var self = this;
        Crazy.modal.popup({
            size: 'md',
            title: "Thêm nghề nghiệp",
            btnDone:"Thêm",
            inputs: {
                title:{
                    type: "text",
                    label: "Tên công việc",
                    placeholder: "Nhập tên",
                    value:name,
                    validate: function(val){
                        return (val.length > 0);
                    }
                },
                work_group: {
                    type: "select",
                    label: "Nhóm công việc",
                    data: {
                        it: "Công nghệ thông tin",
                        office: "Văn phòng",
                        other: "khác"
                    }
                },
                description: {
                    type: "textarea",
                    label: "Mô tả công việc",
                    placeholder: "Nhập mô tả"
                }
            },
            done: function(data){
                Crazy.ajax(self.urls.add_url, "POST", data, function(rs){
                    if(rs.status){
                        Crazy.htmlSelect.addOption('work_id', rs.data.id, rs.data.title);
                        if(typeof success == "function"){
                            success(rs.data);
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
    if(typeof profile_works == 'object'){
        Profile.works.init(profile_works);
    }
    else if(typeof profile_data == 'object'){
        if(typeof profile_data.add_work_url == "string"){
            Profile.works.init({
                urls:{
                    add_url: profile_data.add_work_url
                }
            });
        }
    }


});