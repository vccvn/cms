function customFileChoose (){
    $(prefixClass+ "custom-file .custom-file-input").off();
    $(document).on("change", prefixClass+ "custom-file .custom-file-input",function(){
        var t=$(this).val();
        var self = this;
        $(this).next(".custom-file-label").addClass("selected").html(t);

        var onc = $(self).data('on-change');
        var files = this.files;
        var callback = function (fs){
            if(!fs) fs = [];
            if(onc){
                let oncbs = onc.split(',');
                if(oncbs.length>1){
                    oncbs.forEach(element => {
                        let func = element.trim();
                        if(App.func.check(func)){
                            App.func.call(func, [self, fs]);
                        }
                    });
                    
                }
                else if(App.func.check(onc)){
                    App.func.call(onc, [self, fs]);
                }
            
            }
        };
        if (window.File && window.FileList && files && files.length) {
            var list = [];
            var lsName  = [];
            let max = files.length - 1;
            for (var i = 0; i < files.length; i++) {
                let file = files[i];
                lsName.push(file.name);
                if(onc && window.FileReader){
                    (function(file, index, coumt) {
                        let fileReader = new FileReader();
                        fileReader.onload = function(f) {
                            let src = f.target.result;
                            let data = {
                                filename: file.name,
                                size: file.size,
                                data: src    
                            };
                            
                            list.push(data);
                            if(index == coumt){
                                callback(list);
                            }
                        };
                        fileReader.readAsDataURL(file);
                    })(file, i, max);
                }
                if(i == max){
                    $(self).next(".custom-file-label").addClass("selected").html(lsName.join(', '));
                }
                
            }
        }else{
            callback([]);
        }
    });
}
customFileChoose();