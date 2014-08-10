Object.merge = function() {
    var al = arguments.length;
    var result;

    if (al < 2) {
        throw new Error('U need at least 2 objects to merge');
    }

    result = arguments[0];

    for (var i = 1; --al; ++i) {
        var current = arguments[i];

        Object.keys(current).map(function(key) {
            result[key] = current[key];
        });
    }

    return result;
};

function Mensagem(opt){
    var mensagem;
    var options = {
        title: "Enviando a requisição",
        type: 'info',
        icon: 'icon-spin icon-refresh',
        hide: false,
        closer: false,
        sticker: false,
        opacity: 0.80,
    };

    options = Object.merge(options, opt);
    mensagem = $.pnotify(options);

    this.show = function(opt) {
        options = Object.merge(options, opt);
        mensagem.pnotify(options);

        return mensagem;
    };

}

function Ajax() {
    var url;
    var dataType;
    var type;
    var data;
    var baseUrl;
    var loader;
    var msgLoader;
    var retornoAjax;
    var debug;

    this.setUrl = function(url) {
        this.url = url;
    };

    this.getUrl = function() {
        return this.url;
    };

    this.setDebug = function(debug) {
        this.debug = debug;
    };

    this.getDebug = function() {
        return this.defaultValue(this.debug, false);
    };

    this.setDataType = function(dataType) {
        this.dataType = dataType;
    };

    this.getDataType = function() {
        return  this.defaultValue(this.dataType, 'json');
    };

    this.setType = function(type) {
        this.type = type;
    };

    this.getType = function() {
        return this.defaultValue(this.type, 'post');
    };

    this.setData = function(data) {
        this.data = data;
    };

    this.getData = function() {
        return this.data;
    };

    this.setBaseUrl = function(baseUrl) {
        this.baseUrl = baseUrl;
    };

    this.getBaseUrl = function() {
        return this.defaultValue(this.baseUrl, '');
    };

    this.setLoader = function(loader) {
        this.loader = loader;
    };

    this.getLoader = function() {
        return this.defaultValue(this.loader, true);
    };

    this.setMensagemLoader = function(msgLoader) {
        this.msgLoader = msgLoader;
    };

    this.getMensagemLoader = function() {
        return this.defaultValue(this.msgLoader, 'Enviando a requisição...');
    };


    this.defaultValue = function(valor, valorPadrao) {
        if ($.trim(valor) == '' || valor == 'undefined')
            return valorPadrao;
        return valor;
    };

    this.setRetorno = function(retornoAjax) {
        this.retornoAjax = retornoAjax;
    };

    this.getRetorno = function() {
        return this.retornoAjax;
    };

    this.getInstace = function() {
        return this;
    };

    this.print = function() {
        return "Url : " + this.getUrl() +
                "<br />DataType : " + this.getDataType() +
                "<br />Type : " + this.getType() +
                "<br />Data : " + this.getData() +
                "<br />BaseUrl : " + this.getBaseUrl() +
                "<br />Loader : " + this.getLoader() +
                "<br />MsgLoader : " + this.getMensagemLoader() +
                "<br />Retorno : " + this.getRetorno();
    };


    this.send = function(fnc) {
        //event.preventDefault();
        var obj = this.getInstace();
        var mensagem;
        $.ajax({
            url: obj.getBaseUrl() + obj.getUrl(),
            data: obj.getData(),
            type: obj.getType(),
            dataType: obj.getDataType(),
            async: true,
            beforeSend: function() {
                if (obj.getLoader()) {
                    mensagem = new Mensagem({title:obj.getMensagemLoader()});
                }
            }

        }).fail(function(jqXHR, textStatus, errorThrown) {
            mensagem.show({
                title: jqXHR.responseJSON.httpStatus + ' - ' + jqXHR.responseJSON.title,
                text: jqXHR.responseJSON.detail,
                type: 'error',
                icon: 'icon-warning-sign',
                hide: true,
                closer: true,
                sticker: true,
                opacity: 1,
            });
        }).always(function(data, textStatus, errorThrown) {
            if (obj.getDebug()) {
                console.log(data);
            }

            if (data == 'undefined' || data == null) {
                mensagem.show({
                    title: "Oops",
                    text: "Retorno inválido! Tente novamente.",
                    icon: 'icon-warning-sign',
                    type: 'notice',
                    hide: true,
                    closer: true,
                    sticker: true,
                    opacity: 1,
                });
                return false;
            }

            if (textStatus != 'success') {
                data.abort();
            } else {

                if (!data.status) {
                    mensagem.show({
                        title: obj.defaultValue(data.title,'Ocorreu algum problema!'),
                        text: data.message,
                        icon: 'icon-warning-sign',
                        type: 'error',
                        hide: true,
                        closer: true,
                        sticker: true,
                        opacity: 1,
                    });
                } else {
                    mensagem.show({
                        title: obj.defaultValue(data.title,'Requisição concluida!'),
                        text: data.message,
                        icon: 'glyphicon glyphicon-ok-sign',
                        type: 'success',
                        hide: true,
                        closer: true,
                        sticker: true,
                        opacity: 1,
                    });
                    fnc(data);
                }
            }
        });
    };
}

function getDados(form,fields){

    var $dados = new Object,
        $pacote;

    // cycle fields
    $(form).find(fields).each(function(){
        var $v = $(this).val(),
            $n = $(this).attr('name');

        $n = $n.replace('[]','');

        // radio
        if ( $(this).attr('type') == 'radio' ) {
            if ( $(this).is(':checked') )
                $dados[ $n ] = $v;
        }
        // array
        else if ( $(this).is('.check-list') ) {
            if ( !$dados[ $n ]  ) {
                $dados[ $n ] = new Array;
            }
            else {
                $dados[ $n ] = $dados[ $n ];
            }
            if ( $(this).attr('type') == 'checkbox' ) {
                if ($(this).is(':checked') && !$(this).is(':disabled')) {
                    $dados[ $n ].push( $v );
                };
            }else{
                $dados[ $n ].push( $v );
            }
            return;
        }
        // checkbox
        else if ( $(this).attr('type') == 'checkbox' ) {
            $dados[ $n ] = $(this).is(':checked');
        }
        // input / select
        else {
            $dados[ $n ] = $v;
        }
    });

    $pacote = JSON.stringify( $dados );

    return $pacote;
}

// ---------------- submit
$('body').on('submit','form.form',function(event){
    event.preventDefault();
    $(this).find('.form-button').last().trigger('click');
});
$('body').on('click','.form-button',function(event,data){
    event.preventDefault();

    if ( $(this).is('.disabled') ) return;

    var $form = $(this).closest('.form-horizontal'),
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

$('body').on('click','.send-form',function(event,data){
    event.preventDefault();

    if ( $(this).is('.disabled') ) return;

    var $formId = $(this).data('target'),
        $form = $('#'+$formId),
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

