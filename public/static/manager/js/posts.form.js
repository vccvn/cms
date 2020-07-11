(function () {
    const PostForm = function (options) {
        this.init_list = ["icons", "inputs", "post_type", "use_gallery"];
        this.post_type = 'article';
        this.use_gallery = false;
        this.contentType = "text";
        var self = this;
        /**
         * init
         * @param {object} args 
         */
        this.init = args => {
            Crazy.setup(this, args || this.options);
            this.onStart();
        };

        

        this.onStart = function () {
            var contentType = $('#content_type').val();
            self.changePostType(contentType);
            
        };

        this.changePostType = function(type){
            this.hideAll();
            if(type == "gallery"){
                this.show(type);
            }
            else if(type == "video_embed"){
                this.show("video_url");
            }else if(type == "news"){
                this.show("source");
            }
        };

        this.hideAll = function(){
            var list = ["video_url", "gallery", "video_embed", "source"];
            for (let index = 0; index < list.length; index++) {
                const field = list[index];
                this.hide(field);
            }
        };

        this.show = function(field){
            $("#"+field + "-form-group").show();
        };
        this.hide = function(field){
            $("#"+field + "-form-group").hide();
        };
        
    };
    
    if(typeof Crazy.posts == "undefined"){
        Crazy.posts = {};
    }
    Crazy.posts.form = new PostForm();
    Crazy.posts.form.hideAll();

    var options = {};
    if(typeof post_data == "object"){
        options = post_data;
    }
    $(function(){
        Crazy.posts.form.init(options);
        
    });

}());