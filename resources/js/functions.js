
var source_data = {};

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
            var id = _self.attr('id');
            var custom_id = '';
            if( id !== undefined ) {
                custom_id = id + (total_children-1);
            }

            var custom_field_name = model+'['+(total_children-1)+']'+'['+field_name+']';
            var match_name_with_id = _self.attr('match-name-with-id');
            
            if( match_name_with_id !== undefined ) {
                custom_field_name = custom_id;
            }

            _self.attr('name', custom_field_name);

            if( id !== undefined ) {
                _self.attr('id', custom_id);
            }
        });

    	parent.append(template);
        $.autocomplete(template);
    });

    $.autocomplete();
    $.reorderData();
    $('.multiple-select').multiselect({
        maxHeight: 250,
        buttonWidth: '100%'
    });
});

$.reorderData = function(){
    $('body').on('click', '.reorder-data', function(){
        var self = $(this);
        var holder = self.closest('.holder-template');
        var parent = holder.closest('.parent-template');

        if( self.hasClass('move-data-up') ) {
            holder.insertBefore(holder.prev());
        } else if( self.hasClass('move-data-down') ) {
            holder.insertAfter(holder.next());
        } else if( self.hasClass('remove-data') ) {
            holder.remove();
        }
        $.rebuildTemplate(parent);
    });
}

$.rebuildTemplate = function(parent){
    var model = parent.attr('model');
    $('.holder-template:visible', parent).each(function(index){
        var _self = $(this);
        if( index == 0 ) {
            _self.find('.remove-data').addClass('hide');
        } else {
            _self.find('.remove-data').removeClass('hide');
        }
        $('.template-field', _self).each(function(){
            var self = $(this);
            if( self.hasClass('template-order') ) {
                self.text( (index+1) );
            } else {
                var _name = model+'['+index+']'+'['+self.attr('data-model')+']';
                var _id = self.attr('id');
                
                self.attr('name', _name);
                if( _id !== undefined ) {
                    _id = _id.replace(/[0-9]/g, '');
                    _id = _id + index;
                    self.attr('id', _id);
                }
            }
        });
    });
}

$.autocomplete = function(objcontainer){
    objcontainer = ( typeof objcontainer != 'undefined' ) ? objcontainer : $('body');
    $('.autocomplete', objcontainer).each(function(){
        var self = $(this);
        var url = self.attr('data-url');
        var _class = self.attr('data-class');

        if( source_data.hasOwnProperty(_class) ) {
            $.buildAutocomplete(self, _class);
        } else {
            $.ajax({
                url: url,
                type : 'GET',
                dataType : 'json',
                success : function(data) {
                    source_data[_class] = [];
                    for( var i in data ) {
                        var row = data[i];
                        source_data[_class].push(JSON.stringify(row));
                    }
                    $.buildAutocomplete(self, _class);
                }
            });
        }
    });
}

$.buildAutocomplete = function(obj, _class){
    var id = obj.attr('id');
    // var name = obj.attr('name');
    // var parent = obj.closest('.parent-template');
    // var model = parent.attr('model');

    console.log(id);
    obj.typeahead({
        source: source_data[_class],
        highlighter: function(item) {
            return JSON.parse(item).name;
        },
        matcher: function (item) {
            return JSON.parse(item).name.toLocaleLowerCase().indexOf(this.query.toLocaleLowerCase()) != -1;
        },
        updater: function (item) {
            
            var objItem = JSON.parse(item);
            var hiddenField = $('#hdnField'+id);
            console.log(hiddenField);

            if( hiddenField.length ) {
                hiddenField.val(objItem.value);
                console.log(objItem.value);
            } 
            // else {
                // var field = $('<input>').attr({
                //     'id' : 'hdnField'+id,
                //     'type' : 'hidden',
                //     'value' : objItem.value
                // });
                // obj.after(field);
            // }
            return objItem.name;
        }
    });
}

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