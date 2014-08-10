// ---------------- submit
	$('body').on('submit','form.form',function(event){
		event.preventDefault();
		$(this).find('.form-button').last().trigger('click');
	});
	$('body').on('click','.form-button',function(event,data){
		event.preventDefault();

		if ( $(this).is('.disabled') ) return;

		var $dados = new Object,
			$pacote,
			$form = $(this).closest('.form'),
			$blocks = $form.find('.field-block'),
			$fields = 'input , textarea , select',
			$botao = $(this),
			$url;

		// acao do form
		$dados['acao'] = $form.data('acao');

		// cycle blocks
		$blocks.each(function(){

			// não valida
			if ( $(this).is('.no-valid') || !$(this).is(':visible') ) return;

			var	$c = $(this).data('chave');

			if ( !$dados[ $c ]  ) {
				$dados[ $c ] = new Object;
			}
			else {
				$dados[ $c ] = $dados[ $c ];
			}

			// cycle fields
			$(this).find($fields).each(function(){
				var $v = $(this).val(),
					$n = $(this).attr('name');

				// radio
				if ( $(this).attr('type') == 'radio' ) {
					if ( $(this).is(':checked') )
						$dados[ $c ][ $n ] = $v;
				}
				// checkbox
				else if ( $(this).attr('type') == 'checkbox' ) {
					$dados[ $c ][ $n ] = $(this).is(':checked');
				}
				// array
				else if ( $(this).is('.ipt-list') ) {
					if ( !$dados[ $c ][ $n ]  ) {
						$dados[ $c ][ $n ] = new Array;
					}
					else {
						$dados[ $c ][ $n ] = $dados[ $c ][ $n ];
					}
					$dados[ $c ][ $n ].push( $v );
					return;
				}
				// input / select
				else {
					$dados[ $c ][ $n ] = $v;
				}

			});
		});

		$pacote = JSON.stringify( $dados );

		var ajax = new Ajax();
        ajax.setUrl(filemanagerExecute+'/save-galeria');
        ajax.setData($pacote);
        $botao.addClass('disabled');
        ajax.send(function(data){});
		$botao.removeClass('disabled');
	});