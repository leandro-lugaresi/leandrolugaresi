var optionsSearchMultiSelect = {
    selectableHeader: "<input type='text' class='form-control' style='margin-bottom: 10px;' autocomplete='off' placeholder='Filter entries...'>",
    selectionHeader:  "<input type='text' class='form-control' style='margin-bottom: 10px;' autocomplete='off' placeholder='Filter entries...'>",
    selectableFooter: "<div class='list-group-item'><i class='icon-check-empty'></i> Itens disponíveis</div>",
    selectionFooter: "<div class='list-group-item'><i class='icon-check'></i> Itens selecionados</div>",
    afterInit: function(ms){
        var that = this,
            $selectableSearch = that.$selectableUl.prev(),
            $selectionSearch = that.$selectionUl.prev(),
            selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
            selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

        that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
        .on('keydown', function(e){
            if (e.which === 40){
                that.$selectableUl.focus();
                return false;
            }
        });

        that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
        .on('keydown', function(e){
            if (e.which == 40){
                that.$selectionUl.focus();
                return false;
            }
        });
    },
    afterSelect: function(){
        this.qs1.cache();
        this.qs2.cache();
    },
    afterDeselect: function(){
        this.qs1.cache();
        this.qs2.cache();
    }
};

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

