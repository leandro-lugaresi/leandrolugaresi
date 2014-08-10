jQuery(function(){

    /**
     * Funções para a galeria geral e para a integração com o TyniMCE
     */

    //visualizar dropzone
    $('.btn-uploader').on('click',function(event){
        if($(event.currentTarget).hasClass('active')){
            $(event.currentTarget).removeClass('active');
            $(event.currentTarget).find('i').removeClass().addClass('icon-upload');
            $(event.currentTarget).find('span').text('Upload');
            $('.uploader').hide(500);

        }else{
            $(event.currentTarget).addClass('active');
            $(event.currentTarget).find('i').removeClass().addClass('icon-remove-sign');
            $(event.currentTarget).find('span').text('Fechar');
            $('.uploader').show(500);
        }

    });

    //Adicionar video
    $('.btn-add-video').on('click',function(event){
        if($(event.currentTarget).hasClass('active')){
            $(event.currentTarget).removeClass('active');
            $(event.currentTarget).find('i').removeClass().addClass('icon-film');
            $(event.currentTarget).find('span').text('Add vídeo');
            $('.add-video').hide(500);

        }else{
            $(event.currentTarget).addClass('active');
            $(event.currentTarget).find('i').removeClass().addClass('icon-remove-sign');
            $(event.currentTarget).find('span').text('Fechar');
            $('.add-video').show(500);
        }

    });

    //On click of img
    $('ul.grid').on('click','.preview',function(event){
        event.preventDefault();
        var $buttons = {
            main: {
                label: "Fechar",
                className: "btn-primary",
            }
        }
        if($(event.currentTarget).data("editable")){
            $buttons.danger = {
                label: "Editar",
                className: "btn-danger",
                callback: function() {
                    window.location.href = $(event.currentTarget).attr('href');
                }
            }
        }
        bootbox.dialog({
            message: '<img class="img-responsive" src=' +$(event.currentTarget).attr("data-url")+ '></img>',
            title: 'Visualizar',
            buttons: $buttons
        });
    });

    $('ul.grid').on('click','.rename-file',function(){
        var _this = $(this);

        var file_container = _this.parent().parent().parent();
        var file_title = file_container.find('h4');
        var old_name = $.trim(file_title.text());
        //old_name = old_name.substring(0,old_name.lastIndexOf('.'));
        bootbox.prompt({
            title: "Renomear",
            value: old_name,
            callback: function(name) {
                if (name !== null){
                    name = fix_filename(name);
                    if (name != old_name) {
                        execute_action('rename_file',_this.attr('data-id'),_this.attr('data-thumb'),name,file_container,'refreshPage');
                    }
                }
            }
        });
    });

    $('ul.grid').on('click','.delete-file',function(){
        var _this = $(this);
        bootbox.confirm(_this.attr('data-confirm'), function(result) {
            if (result == true) {
                execute_action('delete_file',_this.attr('data-id'),'','','','refreshPage');
                //_this.parent().parent().parent().remove();
            }
        });
    });

    $('ul.grid').on('click','.link',function(){
        var _this = $(this);
        window[_this.attr('data-function')](_this.attr('data-file'),_this.attr('data-field_id'),_this);
    });
    /**
     * Fim das funções especificas da galeria geral
     */

    $('.gallery-select-file').on('click',function(event){
        event.preventDefault();
        var _this = $(this);

        var row_gallery = _this.parent().parent();
        var id = row_gallery.find('.gallery-file').attr('id');
        var entity = '';
        var entityId = '';

        if(typeof filemanager !== 'undefined'){
            entity = filemanager.entity;
            entityId = filemanager.entityId;
        }
        bootbox.dialog({
            message: '<iframe width="800" height="500" style="border-width: 0px;" tabindex="-1" src="'+filemanagerUrl+'/images?&track=' + id +'&entity=' +entity+ '&entityId=' + entityId +'">',
            title: 'Adicionar Imagem',
            className: 'modal-gallery',
            buttons: {
            }
        });
    });

    $('.form-image-select').on('click',function(event){
        event.preventDefault();
        var _this = $(this);

        var container = _this.parent();
        var id = container.find('.form-image-src').attr('id');
        var entity = '';
        var entityId = '';

        if(typeof filemanager !== 'undefined'){
            entity = filemanager.entity;
            entityId = filemanager.entityId;
        }
        bootbox.dialog({
            message: '<iframe width="800" height="500" style="border-width: 0px;" tabindex="-1" src="'+filemanagerUrl+'/images?&track=' + id +'&entity=' +entity+ '&entityId=' + entityId +'">',
            title: 'Adicionar Imagem',
            className: 'modal-gallery',
            buttons: {
            }
        });
    });

    $('.form-image-remove').on('click',function(event){
        event.preventDefault();
        var _this = $(this);

        var container = _this.parent(),
            imput = container.find('.form-image-src'),
            buttonSelect = container.find('.form-image-select'),
            buttonRemove = container.find('.form-image-remove');

        imput.val('');
        container.parent().find('.fileselect-preview').html('');
        buttonSelect.text('Selecionar imagem');
        buttonSelect.css("width", "150px");
        buttonRemove.addClass('fileselect-exists');
    });

    $(document).on('change','.form-image-src',function(){
        //event.preventDefault();
        var _this = $(this),
            container = _this.parent().parent(),
            image = container.find('.fileselect-preview'),
            buttonSelect = container.find('.form-image-select'),
            buttonRemove = container.find('.form-image-remove');

        if(_this.val() == ''){
            image.html('');
        }else{
            image.html('<img src="'+_this.val()+'" >');
        }
        buttonSelect.text('Trocar');
        buttonSelect.css("width", "auto");
        buttonRemove.removeClass('fileselect-exists');
    });

    /**
     * Inicio das funções para o plugin de galeria com drag and drop
     */

    var galerias = document.getElementsByClassName("galeria-sortable");
    var sortables = Array.prototype.filter.call(galerias, function(element){
        return new Sortable(element, {
            group: "imagens",
            //handle: ".galeria-sortable", // Restricts sort start click/touch to the specified element
            //draggable: ".imagem-sortable",   // Specifies which items inside the element should be sortable
            ghostClass: "sortable-ghost",
            onUpdate: function (evt){
                var itemEl = evt.item; // the current dragged HTMLElement
                imput = $(itemEl).parent().parent().find('.imput-sortable');
                update_plugingaleria(imput);
            },
        });
    });

    $('.add-sortable-file').on('click',function(event){
        event.preventDefault();
        var _this = $(this);

        var row_gallery = _this.parent().parent().parent().parent().parent().parent();
        var id = row_gallery.find('.imput-sortable').attr('id');
        var entity = '';
        var entityId = '';

        if(typeof filemanager !== 'undefined'){
            entity = filemanager.entity;
            entityId = filemanager.entityId;
        }

        bootbox.dialog({
            message: '<iframe width="800" height="500" style="border-width: 0px;" tabindex="-1" src="'+filemanagerUrl+'?&track=' + id +'&functionName=2&entity=' +entity+ '&entityId=' + entityId +'">',
            title: 'Adicionar Imagem',
            className: 'modal-gallery',
            buttons: {
            }
        });
    });

    $('.sortable-salvar').on('click',function(event){
        event.preventDefault();
        var _this = $(this);

        var row_gallery = _this.parent().parent().parent().parent().parent().parent();
        update_plugingaleria(row_gallery.find('.imput-sortable'));
        var imput = row_gallery.find('.imput-sortable').val();
        var entity = row_gallery.find('.entity-sortable').val();
        var id = row_gallery.find('.entityid-sortable').val();

        var ajax = new Ajax();
        ajax.setUrl(filemanagerExecute+'/save-galeria');
        ajax.setData({files: imput, entity: entity, id: id });
        ajax.send(function(data){});
    });

    $('ul.galeria-sortable').on('click','.delete-galeria',function(){
        var _this = $(this);
        var li = _this.parent().parent().parent();
        var imput = $(li).parent().parent().find('.imput-sortable');
        $(li).remove();

        update_plugingaleria(imput);
    });


});

function execute_action(action,file1,file2,name,container,function_name){
    if (name!==null) {
        name = fix_filename(name);
        $.ajax({
            type: "POST",
            url: filemanagerExecute+"/"+action,
            dataType : "json",
            data: {id: file1, id_thumb: file2, name: name.replace('/','')}
        }).done(function( data ) {
            if (data.status == 1) {
                bootbox.alert(data.mensagem, function() {
                    if (function_name!="") {
                        window[function_name](container,name);
                    }
                });
                return true;
            }else{
                bootbox.alert(data.mensagem);
                return false;
            }
        });
    }
}

//Fix Filenames
function fix_filename(stri) {
    if (stri!=null) {
        if ($('#transliteration').val()=="true") {
            stri=replaceDiacritics(stri);
            stri=stri.replace(/[^A-Za-z0-9\.\-\[\]\ \_]+/g, '');
        }
        stri=stri.replace('"','');
        stri=stri.replace("'",'');
        stri=stri.replace("/",'');
        stri=stri.replace("\\",'');
        stri=stri.replace(/<\/?[^>]+(>|$)/g, "");
        return $.trim(stri);
    }
    return null;
}

/**
 * Funções para integração com o editor de textos
 */
function apply(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    var base_url = $('#base_url').val();
    var alt_name=file.substr(0, file.lastIndexOf('.'));
    var ext=file.split('.').pop();
    ext=ext.toLowerCase();
    var fill='';
    var ext_audio=new Array('ogg','mp3','wav');
    var ext_video=new Array('mp4','ogg','webm');
    var ext_img=new Array('jpeg','jpg','png','gif');
    if($.inArray(ext, ext_img) > -1){
        fill='<img src="'+base_url+file+'" alt="'+alt_name+'" />';
    }else{
        if($.inArray(ext, ext_video) > -1){
            fill='<video controls source src="'+base_url+file+'" type="video/'+ext+'">'+alt_name+'</video>';
        }else{
            if($.inArray(ext, ext_audio) > -1 ){
                if (ext=='mp3') { ext='mpeg'; }
                fill='<audio controls src="'+base_url+file+'" type="audio/'+ext+'">'+alt_name+'</audio>';
            }else{
                fill='<a href="'+base_url+file+'" title="'+alt_name+'">'+alt_name+'</a>';
            }
        }

    }
    parent.tinymce.activeEditor.insertContent(fill);
    parent.tinymce.activeEditor.windowManager.close();
}



function apply_link(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    var base_url = $('#base_url').val();
    if (external!=""){
        var target = window_parent.document.getElementById(external);
        $(target).val(base_url+file);
        parent.$("#"+external).trigger("change");
        close_window();
    }
    else
        apply_any(base_url, file);
}

function apply_img(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    var base_url = $('#base_url').val();

    if (external!=""){
        var target = window_parent.document.getElementById(external);//$('#'+external, window_parent.document);
        $(target).val(base_url+file);

        parent.$("#"+external).trigger("change");
        //$(target).trigger( "change" );
        close_window();
    }
    else
        apply_any(base_url, file);
}

function apply_video(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    if (external!=""){
        var target = window_parent.document.getElementById(external);
        $(target).val(file);
        parent.$("#"+external).trigger("change");
        //$(target).trigger( "change" );
        close_window();
    }
    else
        apply_any('', file);
}

function apply_any(path, file) {
    path = path.replace('\\', '/');
    // parent.tinymce.activeEditor.insertContent(fill);
    // parent.tinymce.activeEditor.windowManager.close();
    parent.tinymce.activeEditor.windowManager.getParams().setUrl(path+file);
    parent.tinymce.activeEditor.windowManager.close();
    return false;
}

function close_window() {
    if ($('#popup').val()==1) window.close();
    else{
        var closed = window.parent.document.getElementsByClassName('modal-gallery');
        $(closed).find('.bootbox-close-button').trigger('click');
    }
}

//Integração com templates
function apply_img_template(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    file = String.format(filemanager.templateImagem,file);

    var base_url = $('#base_url').val();

    if (external!=""){
        var target = window.parent.document.getElementsByClassName('mce-img_'+external);
        var closed = window.parent.document.getElementsByClassName('mce-filemanager');
        $(target).val(file);
        $(closed).find('.mce-close').trigger('click');
    }
    else
        apply_any(base_url, file);
}

function apply_video_template(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;

    file = String.format(filemanager.templateVideo,file);

    if (external!=""){
        var target = window.parent.document.getElementsByClassName('mce-vid_'+external);
        var closed = window.parent.document.getElementsByClassName('mce-filemanager');
        $(target).val(file);
        $(closed).find('.mce-close').trigger('click');
    }
    else
        apply_any('', file);
}

//Integração com plugin galeria
function apply_img_plugingaleria(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    var base_url = $('#base_url').val();
    thumb = element.attr('data-thumb');
    id = element.attr('data-file-id');
    label = element.parent().find('h4').text();
    if (external!=""){
        var imput = $('#'+external,window_parent.document);
        var target = imput.parent().find('.galeria-sortable');
        var html = markups.sortable.item.replace(/{thumb}/, thumb );
        html = html.replace(/{id}/, id);
        html = html.replace(/{name}/, label);
        $(html).appendTo(target);
        update_plugingaleria(imput);
        close_window();
    }
}

function apply_video_plugingaleria(file, external, element){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    thumb = element.attr('data-thumb');
    id = element.attr('data-file-id');
    label = element.parent().find('h4').text();
    if (external!=""){
        var imput = $('#'+external,window_parent.document);
        var target = imput.parent().find('.galeria-sortable');
        var html = markups.sortable.item.replace(/{thumb}/, thumb );
        html = html.replace(/{id}/, id);
        html = html.replace(/{name}/, label);
        $(html).appendTo(target);
        update_plugingaleria(imput);
        close_window();
    }
}

function update_plugingaleria(imput){
        var _this = $(imput);
        var gallery = _this.parent();
        var values = new Array();
        $(gallery).find('li').each(function(i){

            values[i] = {
                'id' : $(this).find('img').attr('data-id')
            }
            i++;
        });
        _this.val(JSON.stringify( values ));
}

/**
 * FIm das Funções para integração com o editor de textos
 */


// ################ ################ ################ ################ ################ ################
// ################ ################ ################ ################ ################ ################
// ################ ################                                   ################ ################
// ################ ################        markups e variaveis        ################ ################
// ################ ################                                   ################ ################
// ################ ################ ################ ################ ################ ################
// ################ ################ ################ ################ ################ ################
//var filemanager = {};
var filemanagerUrl = '/modulus/filemanager'
var filemanagerExecute = '/modulus/filemanager/execute'

var markups = {
    sortable : {
        item : '\
            <li class="imagem-sortable" >\
                <figure>\
                    <div class="img-precontainer">\
                        <div class="img-container"><span></span>\
                            <img src="{thumb}" data-id="{id}">\
                        </div>\
                    </div>\
                    <div class="box">\
                        <h4 class="ellipsis">{name}</h4>\
                    </div>\
                    <figcaption>\
                        <a title="Apagar" class="tip-left erase-button delete-galeria" href="javascript:void(\'\')">\
                            <i class="icon-trash"></i>\
                        </a>\
                    </figcaption>\
                </figure>\
            </li>\
        '
    }
};

// ################ ################ ################ ################ ################ ################
// ################ ################ ################ ################ ################ ################
// ################ ################                                   ################ ################
// ################ ################          funções ativadas         ################ ################
// ################ ################                                   ################ ################
// ################ ################ ################ ################ ################ ################
// ################ ################ ################ ################ ################ ################

//reload the page
function refreshPage() {
    location.reload();
}


if (!String.format) {
  String.format = function(format) {
    var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function(match, number) {
      return typeof args[number] != 'undefined'
        ? args[number]
        : match
      ;
    });
  };
}
if(typeof Dropzone !== 'undefined'){
    Dropzone.options.dropzoneModulusGaleria = {
        init: function () {
            this.on("complete", function (file) {
                if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
                    refreshPage();
                }
            });
        }
    };
}