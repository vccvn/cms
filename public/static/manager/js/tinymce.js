

if ($('textarea.tiny-mce').length) {
    var h = 500;
    if ($('textarea.tiny-mce').attr('height')) {
        h = $('textarea.tiny-mce').attr('height');
    }
    tinymce.init({
        selector: 'textarea.tiny-mce',
        height: h,
        menubar: false,
        plugins: [
            "advlist autolink link image lists charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
            "table contextmenu directionality emoticons paste textcolor code openGallery"
        ],
        image_advtab: true ,
        relative_urls : false,
        remove_script_host : false,
        convert_urls : true,


        toolbar: 'insert | undo redo | styleselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | image | link | table | removeformat | openGallery | code',
        content_css: [
            '//fonts.googleapis.com/css?family=Source+Sans+Pro',
            '/static/plugins/tinymce/style.css'
            
        ]
    });
}
