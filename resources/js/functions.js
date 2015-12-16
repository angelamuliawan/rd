$(document).ready(function() {

	var serviceUri = 'http://localhost/rd/';

	$(document).ajaxStart(function() {
		$('.overlay').css('visibility', 'visible');
	});
	$(document).ajaxComplete(function() {
		$('.overlay').css('visibility', 'hidden');
	});

    $('body').on('submit', function(e){
        $('.wrapper-template').remove();
    });

	$('body').on('submit', '.ajax-form', function(e){
		
		var self = $(this);
		var form_data = self.serialize();
		var form_id = '#'+self.attr('id');
		var form_action = self.attr('action');
		var data_reload = self.attr('data-reload');

		$.ajax({
            url: serviceUri+form_action,
            type: 'POST',
            dataType: 'html',
            data: form_data,
            success: function( result ) {
            	var message = $(result).find('#msg-text').html();
            	var status = $(result).find('#msg-status').html();
 
            	var contentHTML = $(result).find(form_id).html();
            	$(form_id).html(contentHTML);

            	if( status == 'success' ) {
            		if( data_reload == 'true' ) {
            			window.location.reload();
            		}
            	}
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert('Gagal melakukan proses. Silahkan coba beberapa saat lagi.');
                return false;
            }
        });

		return false;
	});

    $.ajaxModal();
    $.tabs();
    $.replaceText();

    $('body').on('click', '.clone-button', function(){

    	var self = $(this);
    	var target = self.attr('data-clone');
    	
        var parent = $('.' + target).closest('.parent-template');
    	var model = parent.attr('model');

        var template = $('.' + target).clone().removeClass(target).removeClass('hide').removeClass('wrapper-template');
    	var total_children = parent.children().length;

    	template.find('.template-order').text(total_children);
        $('.inputField', template).each(function(){
            var _self = $(this);
            var field_name = _self.attr('name');
            _self.attr('name', model+'['+(total_children-1)+']'+'['+field_name+']');
        });

    	parent.append(template);
    });
});

$.ajaxModal = function(options){
	var obj = $('.ajax-modal');
    if( obj.length > 0 ) {
        obj.off('click');
        obj.click(function() {
            var self = $(this);
	        var url = self.attr('href');
	        var title = self.attr('title');

	        $.ajax({
	            url: url,
	            type: 'POST',
	            success: function(response, status) {

	                $('#myModal').replaceWith(response);
	                $('#myModal').modal('show');

	                return false;
	            },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {
	                alert('Gagal melakukan proses. Silahkan coba beberapa saat lagi.');
	                return false;
	            }
	        });

            return false;
        });

        $('body').on('click', '.close-modal', function(){
            $('#myModal').modal('hide');
            return false;
        });
    }
}

$.tabs = function(){
	$('body').on('click', 'ul.nav.nav-tabs a',function(e) {
        e.preventDefault();
        $( this ).tab( 'show' );
    });
}

$.replaceText = function(){
	$('body').on('click', '.replace-text li', function(){
		var self = $(this);
		var parent = self.closest('.nav.replace-text');
		var target = '.' + parent.attr('text-target');
		var text = self.find("*").last().text();
		$(target).text(text);
	});
}