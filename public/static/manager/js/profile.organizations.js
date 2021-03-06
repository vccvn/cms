if(typeof Profile == "undefined"){
    var Profile = {};
}

Profile.organizations = {
    urls: {},
    id: 0,
    template: "",
    init_list: ["urls"],

    init: function(args) {
        Crazy.setup(this, args);
    },

    addBusiness:function(name, success){
        this.showAddForm("business", name, success);
    },
    addEducation:function(name, success){
        this.showAddForm("education", name, success);
    },
    showAddForm:function(type, name, success) {
        var self = this;
        var t = type.toLowerCase() == "business" ? "business": "education";
        var labels = {"business":"Doanh nghiệp", "education":"Giáo dục"};
        var label = labels[t];
        Crazy.modal.popup({
            title: "Thêm Tổ chức",
            btnDone:"Thêm",
            inputs: {
                type:{
                    type:"hidden",
                    value:t
                },
                name:{
                    type: "text",
                    label: label,
                    placeholder: "Nhập "+label,
                    value:name,
                    validate: function(val){
                        return (val.length > 0);
                    }
                },
                
                website: {
                    type: "text",
                    label: "trang web",
                    placeholder: "Nhập đường dẩn (không bắt buộc)"
                }
            },
            done: function(data){
                Crazy.ajax(self.urls.add_url, "POST", data, function(rs){
                    if(rs.status){
                        Crazy.htmlSelect.addOption('org_id', rs.data.id, rs.data.name);
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
    if(typeof profile_organizations == 'object'){
        Profile.organizations.init(profile_organizations);
    }
    else if(typeof profile_data == 'object'){
        if(typeof profile_data.add_organization_url == "string"){
            Profile.organizations.init({
                urls:{
                    add_url: profile_data.add_organization_url
                }
            });
        }
    }


});