

jQuery(function(){
    //Confirmação para a exclusão
    $('.buttonDelete').click(function(event){
        event.preventDefault();
        bootbox.confirm("Você tem certeza que deseja excluir este item?", function(result) {
            if (result) {
                window.location.href = $(event.currentTarget).attr('href');
            }
        });
    });

    $('.button-confirm').click(function(event){
        event.preventDefault();
        var text = $(this).data('text');
        if(text == "" || text == 'undefined'){
            text = 'Você tem certeza que deseja realizar está ação?';
        }
        bootbox.confirm(text, function(result) {
            if (result) {
                window.location.href = $(event.currentTarget).attr('href');
            }
        });
    });

    //Abilita a edição de elementos
    $(function(){
        $('.x-editable').editable();
    });

    //Save the secundary forms
    $('.form-secundary-save').on('click',function(event){
        event.preventDefault();


        if ( $(this).is('.disabled') ) return;

        var $row = $(this).parent().parent().parent().parent().parent();
            $form = $row.find('.form-horizontal'),
            $fields = 'input , textarea , select',
            $botao = $(this),
            $url = $form.attr('action');

        if( $url == "undefined" || $url == null){
            $url = document.URL;
        }


        var ajax = new Ajax();
        ajax.setUrl($url);
        ajax.setData({dados:getDados($form,$fields)});
        $botao.addClass('disabled');
        ajax.send(function(data){});
        $botao.removeClass('disabled');
    });

});

