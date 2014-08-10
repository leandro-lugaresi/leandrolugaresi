/**
 * @license Copyright (c) 2014-2016, Leandro Lugaresi. All rights reserved.
 */

tinymce.init({
    selector: "textarea.tinymce",
    theme: "modern",
	//skin: 'light',
    // width: 300,
    height: 300,
    remove_script_host : false,
    relative_urls : false,
    plugins: [
         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality template paste textcolor modulus"
   ],
   //content_css: "css/content.css",
   toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor",
   toolbar2: "link image media | print preview fullpage | addVideo addImage |",

 });