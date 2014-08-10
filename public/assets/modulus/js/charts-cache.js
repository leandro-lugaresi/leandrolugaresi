$(function () {
	$('.cache-chart').each(function(){

		$.ajax({
			url: $(this).data('url'),
			id: $(this).attr('id'),
			type: "GET",
			dataType: "json",
			success: function(data){
			    
			    console.log($(this).attr('url'));
				$.plot('#'+$(this).attr('id'), data, {
			        series: {
			            pie: {
			                show: true,
			                radius: 3/4,
				            label: {
				                show: true,
				                radius: 3/4,
				                background: {
				                    opacity: 0.7,
				                    color: '#000'
				                }
				            }
			            }
			        },
			        grid: {
			            hoverable: true,
			            clickable: true
			        }
			    });
			}
		});
	});


});
