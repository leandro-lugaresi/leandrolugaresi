jQuery(function(){

	var updateOutput = function(e)
    {
        var list   = e.length ? e : $(e.target);
        if (window.JSON) {
            return window.JSON.stringify(list.nestable('serialize'));//, null, 2));
        } else {
            return false;
        }
    };

	$('body').on('click', 'a.menu-collapse', function(event){
	    $(this).children().toggleClass("icon-chevron-down icon-chevron-up");
	    $(this).closest(".dd3-content").next().toggleClass("in");
	    $(this).closest(".dd3-content").toggleClass('rounded-bottom');
	    return false;
	});

	$("#nestable-menu-itens").nestable({maxDepth:3});

	$('.add-menu-item').on('click',function(event){
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
	    ajax.send(function(data){
	    	if (typeof data.itens !== 'undefined') {
	    		$('#nestable-menu-itens .first-depth').append(data.itens);
	    	};
	    });
	    $botao.removeClass('disabled');
    });

	$('body').on('click', '.update-menu-item', function(event){
		event.preventDefault();
        if ( $(this).is('.disabled') ) return;

        var $form = $(this).closest('.form-horizontal'),
	        $fields = 'input , textarea , select',
	        $botao = $(this),
	        $element = $form.parent().parent();

		$($form).find($fields).each(function(){
	        var $v = $(this).val(),
	            $n = $(this).attr('name');
	        $element.data( $n, $v );
	        if($n == 'label'){
				$element.children('.dd3-content').find('span').text($v);
	        }
	    });
		$botao.removeClass('disabled');
		$element.children('.dd3-content').find('a.menu-collapse').trigger('click');
	});

	$('body').on('click', '.delete-menu-item', function(event){
		event.preventDefault();
        if ( $(this).is('.disabled') ) return;

        var $form = $(this).closest('.form-horizontal'),
	        $fields = 'input , textarea , select',
	        $botao = $(this),
	        $element = $form.parent().parent();


		$element.children('ol.dd-list').children().detach().appendTo($element.closest('ol.dd-list'));
		$botao.removeClass('disabled');
		$element.remove();
	});

	$('.update-menu').on('click',function(event){
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
	    ajax.setData({dados:getDados($form,$fields),itens:updateOutput($('#nestable-menu-itens'))});
	    $botao.addClass('disabled');
	    ajax.send(function(data){});
	    $botao.removeClass('disabled');
    });

});