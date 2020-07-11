$(function(){
    var $cs = $('.crazy-switch');
    
    if($cs.length){
        $(document).on('click', '.crazy-switch', function(){
            var self = this;
            setTimeout(function(){
                var stt = $(self).is(':checked');
                if($(self).data('on-check') && stt){
                    Crazy.func.call($(self).data('on-check'), [stt, self]);
                }
                if($(self).data('on-uncheck') && !stt){
                    Crazy.func.call($(self).data('on-uncheck'), [stt, self]);
                }
                if($(self).data('on-change')){
                    var onc = $(self).data('on-change');
                    
                    if(onc){
                        let oncbs = onc.split(',');
                        if(oncbs.length>1){
                            oncbs.forEach(element => {
                                let func = element.trim();
                                if(Crazy.func.check(func)){
                                    Crazy.func.call(func, [stt, self]);
                                }
                            });
                            
                        }
                        else if(Crazy.func.check(onc)){
                            Crazy.func.call(onc, [stt, self]);
                        }
                    }
                    
                }
            }, 50);

        })
    }
});