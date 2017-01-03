var source_data = {};
var apiUri = 'http://localhost/ckn/public/api/';
var serviceUri = 'http://localhost/cookindo/';

// var apiUri = 'http://api.cookindo.com/public/api/';
// var serviceUri = 'http://'+document.domain+'/';

var finished_ajax = true;
var arrTranslate = {
    'indonesian' : {
        'cancel' : 'Batal',
        'edit' : 'Ubah',
        'delete' : 'Hapus',

        'like' : 'Suka',
        'unlike' : 'Batal Suka',
        'reply' : 'Balas',
        'more' : 'More',
        'save' : 'Simpan',

        'confirm_delete' : 'Yakin ingin menghapus?',

        'comment' : 'Komentar',
        'write_comment' : 'Tuliskan komentar Anda',
        'send_comment' : 'Kirim Komentar',
        'comment_this_recipe' : 'Komentari Resep Ini',
        'comment_not_available' : 'Komentari tidak tersedia',
        'view_more_comment' : 'Lihat komentar lainnya',

        'create_recipe' : 'membuat resep',
        'recooked' : 'melakukan recook',
        'cookmark' : 'menyimpan resep',
        'comment_recipe' : 'mengomentari resep',
        'comment_recook' : 'mengomentari recook',
        'join_cookindo' : 'Bergabung di Cookindo',

        /* VALIDATION */
        'max' : 'Maksimal',
        'option' : 'opsi',

        /* ALERT */
        'failed_processing_data' : 'Gagal melakukan proses. Silahkan coba beberapa saat lagi',
    },
    'english' : {
        'cancel' : 'Cancel',
        'edit' : 'Edit',
        'delete' : 'Delete',

        'like' : 'Like',
        'unlike' : 'Unlike',
        'reply' : 'Reply',
        'more' : 'More',
        'save' : 'Save',

        'confirm_delete' : 'Delete this item?',

        'comment' : 'Comments',
        'write_comment' : 'Write a comment',
        'send_comment' : 'Post Comment',
        'comment_this_recipe' : 'Comment This Recipe',
        'comment_not_available' : 'Comment not available',
        'view_more_comment' : 'View more comment',

        'create_recipe' : 'create recipe',
        'recooked' : 'recooked',
        'cookmark' : 'cookmark',
        'comment_recipe' : 'commented on recipe',
        'comment_recook' : 'commented on recook',
        'join_cookindo' : 'joined Cookindo',

        /* VALIDATION */
        'max' : 'Maximum',
        'option' : 'option',

        /* ALERT */
        'failed_processing_data' : 'Failed processing data. Please try again later',
    }
}

$(document).ready(function() {

	$(document).ajaxStart(function() {
        finished_ajax = false;
        if( !$(document).find('.disable-overlay').length ) {
            $('.overlay').css('visibility', 'visible');
        }
	});
	
    $(document).ajaxComplete(function() {
        finished_ajax = true;
		$('.overlay').css('visibility', 'hidden');
        $('input[type=submit].with-loading, button[type=submit].with-loading').attr('disabled', false);
	});

    $('.with-loading').closest('form').submit(function(e) {
        e.preventDefault();
        if( finished_ajax ) {
            $('input[type=submit].with-loading, button[type=submit].with-loading').attr('disabled', true);
        }
        $(this).off('submit').submit();
    });
    
    $.customFunction();
    $.ajaxLink();
    $.ajaxForm();
    $.ajaxModal();
    $.tabs();
    $.replaceText();
    $.fileUpload();
    $.cloneButton();

    $.autocomplete();
    $.reorderData();
    $.magicSuggest();
    $.multipleSelect();
    $.carousel();

    $.froala();
    $.unveil();
    $.autoResizeTextarea();

    $.oauthpopup = function (options) {
        options.windowName = options.windowName || 'ConnectWithOAuth';
        options.windowOptions = options.windowOptions || 'location=0,status=0,width='+options.width+',height='+options.height+',scrollbars=1';
        options.callback = options.callback || function () {
            window.location.reload();
        };
        var that = this;
        that._oauthWindow = window.open(options.path, options.windowName, options.windowOptions);
        that._oauthInterval = window.setInterval(function () {
            if (that._oauthWindow.closed) {
                window.clearInterval(that._oauthInterval);
                options.callback();
            }
        }, 1000);
    };

    $('body').on('click', '.facebook-link', function(e){
        e.preventDefault();
        $.oauthpopup({
            path: serviceUri+'users/login_facebook',
            width : 600,
            height : 300,
            callback: function(){
                window.location.reload();
            }
        }); 
    });

    $.ajaxSetup({
        headers: {
            'Sid': $('#sid').val()
        }
    });
});

$.unveil = function(){
    $("img").unveil(300, function() {
        $(this).load(function() {
            this.style.opacity = 1;
        });
    });
    $("div[data-is-progressive='1']").unveil(300, function() {
        $(this).css('opacity', 1);
    });
}

$.froala = function(){
    if( $('.fr-custom-textarea').length ) {
        $('.fr-custom-textarea').editable({
            inlineMode: false, 
            imageUploadURL: serviceUri + 'ajax/upload_image_article'
            }).on('editable.imageError', function (e, editor, error) {
                // Custom error message returned from the server.
                if (error.code == 0) {  }

                // Bad link.
                else if (error.code == 1) {  }

                // No link in upload response.
                else if (error.code == 2) {  }

                // Error during image upload.
                else if (error.code == 3) {  }

                // Parsing response failed.
                else if (error.code == 4) {  }

                // Image too large.
                else if (error.code == 5) {  }

                // Invalid image type.
                else if (error.code == 6) {  }

                // Image can be uploaded only to same domain in IE 8 and IE 9.
                else if (error.code == 7) {  }
        });
    }
}

$.customFunction = function() {
    $('body').on('click', '*[slide-toggle-on-click]', function(e) {
        e.preventDefault();
        var self = $(this);
        var _class = self.attr('slide-toggle-on-click');

        if( self.attr('toggle-oveflow') == 'true' ) {
            if( $('body').css('overflow') == 'visible' ) {
                $('body').css('overflow', 'hidden');
            } else {
                $('body').css('overflow', 'visible');
            }
        }
        $(_class).stop().slideToggle();
    });
    $('body').on('click', '*[toggle-on-click]', function(e) {
        e.preventDefault();
        var self = $(this);
        var _class = self.attr('toggle-on-click');

        if( self.attr('toggle-oveflow') == 'true' ) {
            if( $('body').css('overflow') == 'visible' ) {
                $('body').css('overflow', 'hidden');
            } else {
                $('body').css('overflow', 'visible');
            }
        }
        $(_class).toggle();
    });
    $('body').on('click', '*[show-on-click]', function(e) {
        e.preventDefault();
        var self = $(this);
        var _class = self.attr('show-on-click');
        $(_class).show();

        if( $(_class).hasClass('hide') ) {
            $(_class).removeClass('hide');
        }
    });
    $('body').on('click', '*[hide-on-click]', function(e) {
        e.preventDefault();
        var self = $(this);
        var _class = self.attr('hide-on-click');
        $(_class).hide();
    });
    $('body').on('click', '*[trigger-on-click]', function(e) {
        e.preventDefault();
        var self = $(this);
        var _class = self.attr('trigger-on-click');
        $(_class).trigger('click');
    });
    $('body').on('click', 'a[data-submit="1"]', function(e) {
        e.preventDefault();
        var self = $(this);
        self.closest('form').submit();
    });
    $('body').on('keypress', '.submit-on-enter', function(e) {
        var code = e.keyCode;
        if (code == 13) {
            e.preventDefault();
            $(this).closest('form').submit();
        }
    });
    $('body').on('submit', function(e) {
        $('.wrapper-template').remove();
    });
    $('body').on('click', '.btnPrint', function(e) {
        e.preventDefault();
        window.print();
    });
    if( $(".ddlMeasureSize").length ) {
        $("body").on("change", ".ddlMeasureSize", function() {
            var e = $(this);
            var value = e.val();

            if( value == 9 || value == 10 ) {
                e.closest(".holder-template").find(".freeField").val(1).css({
                    "background-color": "#efefef",
                    "pointer-events": "none"
                });
            } else {
                e.closest(".holder-template").find(".freeField").removeAttr("style")
            }
        });
    }

    if ( $('.ajax-load-more').length ) {
        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() > ($(document).height()/2) + 300 ) {
                $('.ajax-form').submit();
            }
        });
    }

    $('body').on('click', '.disable-on-submit', function(e) {
        e.preventDefault();
        $(this).attr('disabled', true);
        $(this).closest('form').submit();
    });
}
$.getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
$.carousel = function() {
    $('#recook-carousel').carousel({
        interval: 4000
    })
    $('#recook-carousel .item').each(function() {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));
    });
}
$.ajaxLink = function() {
    $('body').on('click', '.ajax-link', function(e) {
        var self = $(this);
        var data_url = self.attr('href');
        var data_redirect = self.attr('data-redirect');
        var wrapper_class = '.' + self.attr('target-wrapper');
        var with_confirm = self.attr('with-confirm');
        var blockScreen = ( self.attr('data-block-screen') !== undefined ) ? true : false;
        var conf = true;
        if (with_confirm !== undefined) {
            conf = confirm(with_confirm);
        }
        if (conf == true) {
            $.ajax({
                url: data_url,
                type: 'GET',
                dataType: 'html',
                global: blockScreen,
                success: function(result) {
                    var contentHTML = '';                    
                    if (self.attr('remove') !== undefined) {
                        self.closest('.wrapper-ajax-link').slideUp(1500, function(){
                            self.closest('.wrapper-ajax-link').html('<div class="alert alert-success temp-alert">'+
                                '<a href="#" class="close" data-dismiss="alert" title="Tutup">×</a>'+
                                '<p>Data berhasil dihapus</p>'+
                            '</div>').slideDown();

                            setTimeout(function(){
                                $('.temp-alert').slideUp(1500, function(){
                                    $('.temp-alert').remove();
                                });
                            }, 5000);
                        });
                    } else if ($(result).find(wrapper_class).length) {
                        contentHTML = $(result).find(wrapper_class).html();
                        $(wrapper_class).html(contentHTML);
                    } else if( result ) {
                        self.closest('.wrapper-ajax-link').replaceWith(result);
                    } else {
                        if( data_redirect !== undefined ) {
                            window.location.replace(serviceUri+data_redirect);
                        } else {
                            window.location.reload();
                        }
                    }

                    $.unveil();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert($.translate('failed_processing_data'));
                    return false;
                }
            });
        }
        return false;
    });
}
$.ajaxForm = function() {
    $('body').on('submit', '.ajax-form', function(e) {
        e.preventDefault();
        if( finished_ajax ) {
            var self = $(this);
            var form_data = self.serialize();
            var form_id = '#' + self.attr('id');
            var form_action = self.attr('action');
            var data_reload = self.attr('data-reload');
            var data_redirect = self.attr('data-redirect');
            var selector_target = self.attr('selector-target');

            $.ajax({
                url: serviceUri + form_action,
                type: 'POST',
                dataType: 'html',
                data: form_data,
                success: function(result) {
                    var message = $(result).find('#msg-text').html();
                    var status = $(result).find('#msg-status').html();
                    var contentHTML = '';

                    if( $(result).find(selector_target).length ) {
                        contentHTML = $(result).find(selector_target).html();
                        $(selector_target).append(contentHTML);
                    } 

                    if ($(result).find(form_id).length) {

                        if( $(form_id).attr('replace') == 'true' ){
                            contentHTML = $(result).find(form_id);
                            $(form_id).replaceWith(contentHTML);
                        } else {
                            contentHTML = $(result).find(form_id).html();
                            $(form_id).html(contentHTML);
                        }
                    } else {
                        self.closest('.ajax-wrapper-form').replaceWith(result);
                    }

                    if (status == 'success') {
                        if( data_redirect !== undefined ) {
                            if( $(form_id).attr('data-redirect') !== undefined ) {
                                data_redirect = $(form_id).attr('data-redirect');
                            }

                            window.location.replace(serviceUri+data_redirect);
                        } else if (data_reload == 'true') {
                            window.location.reload();
                        }
                    }

                    $.fileUpload();
                    $.unveil();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert($.translate('failed_processing_data'));
                    return false;
                }
            });
            return false;
        }
    });
}
$.cloneButton = function() {
    $('body').on('click', '.clone-button', function() {
        var self = $(this);
        var target = self.attr('data-clone');
        var parent = $('.' + target).closest('.parent-template');
        var model = parent.attr('model');
        var template = $('.' + target).clone().removeClass(target).removeClass('hide').removeClass('wrapper-template');
        var total_children = parent.children('div').length;
        var max_step = self.attr('max-step');

        template.find('.template-order').text(total_children);
        $('.inputField', template).each(function() {
            var _self = $(this);
            var field_name = _self.attr('name');
            var id = _self.attr('id');
            var custom_id = '';
            if (id !== undefined) {
                custom_id = id + (total_children - 1);
            }
            var custom_field_name = model + '[' + (total_children - 1) + ']' + '[' + field_name + ']';
            var match_name_with_id = _self.attr('match-name-with-id');
            if (match_name_with_id !== undefined) {
                custom_field_name = custom_id;
            }
            _self.attr('name', custom_field_name);
            if (id !== undefined) {
                _self.attr('id', custom_id);
            }
        });

        if( max_step !== undefined && total_children == max_step ) {
            self.hide();
        }

        parent.append(template);
        $.autocomplete(template);
        $.autoResizeTextarea();
    });
}
$.multipleSelect = function() {
    $('.multiple-select').multiselect({
        maxHeight: 250,
        buttonWidth: '100%',
        onChange: function(element, checked) {
            var id = '#' + $(element).parent().attr('id');
            var self = $(id);
            if (self.attr('max-selected') !== undefined) {
                var max = self.attr('max-selected');
                var selected = $('.multiple-select option:selected').length;
                if (selected == 3) {
                    alert( $.translate('max') + ' ' + max + ' ' + $.translate('option') );
                    var value = $(element[0]).val();
                    $('.multiple-select').multiselect('deselect', value);
                }
            }
        }
    });
}
$.magicSuggest = function() {
    if ($('.ms-custom').length) {
        var source_ms = $('#hdnSuggestValue').val();
        var submitted_ms = [];
        if (source_ms != '') {
            source_ms = JSON.parse(source_ms);
        }
        if ($('#hdnSubmittedMsValue').val() != '') {
            submitted_ms = $('#hdnSubmittedMsValue').val().split(',');
        }
        $('.ms-custom').magicSuggest({
            data: source_ms,
            placeholder: '',
            displayField: 'name',
            name: 'CompositionID',
            value: submitted_ms,
        });
        $('#hdnSuggestValue').remove();
    }
}
$.fileUpload = function() {
    var action_type = '';
    if ($('#fileupload').attr('action-type') !== undefined) {
        action_type = $('#fileupload').attr('action-type');
    }

    $('#fileupload').fileupload({
        url: serviceUri + 'ajax/upload_image/' + action_type,
        dataType: 'html',
        done: function(e, data) {
            var result = data.result;
            var filename = $(result).attr('data-name');
            $('#fileupload').closest('.wrapper-ajax-upload').find('.wrapper-photo').empty().append(result);
            $('#progress .progress-bar').css('width', 0);
            $('#fuHiddenField').val(filename);
            if ($('#fileupload').attr('data-show') !== undefined) {
                var target_class = $('#fileupload').attr('data-show');
                $(target_class).show();
            }

            $.unveil();
        },
        progressall: function(e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css('width', progress + '%');
        },
    }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
}
$.reorderData = function() {
    $('body').on('click', '.reorder-data', function() {
        var self = $(this);
        var holder = self.closest('.holder-template');
        var parent = holder.closest('.parent-template');
        if (self.hasClass('move-data-up')) {
            holder.insertBefore(holder.prev());
        } else if (self.hasClass('move-data-down')) {
            holder.insertAfter(holder.next());
        } else if (self.hasClass('remove-data')) {
            holder.remove();
        }
        $.rebuildTemplate(parent);
    });
}
$.rebuildTemplate = function(parent) {
    var model = parent.attr('model');
    var total_children = 0;
    var max_step = parent.attr('max-step');

    $('.holder-template:visible', parent).each(function(index) {
        var _self = $(this);
        if (index == 0) {
            _self.find('.remove-data').addClass('hide');
        } else {
            _self.find('.remove-data').removeClass('hide');
        }
        $('.template-field', _self).each(function() {
            var self = $(this);
            if (self.hasClass('template-order')) {
                self.text((index + 1));
            } else {
                var _name = model + '[' + index + ']' + '[' + self.attr('data-model') + ']';
                var _id = self.attr('id');
                var match_name_with_id = self.attr("match-name-with-id");
                void 0 !== match_name_with_id && (_name = _id);
                self.attr('name', _name);
                if (_id !== undefined) {
                    _id = _id.replace(/[0-9]/g, '');
                    _id = _id + index;
                    self.attr('id', _id);
                }
            }
        });

        total_children++;
    });

    if( max_step !== undefined && total_children < max_step ) {
        parent.parent().next().find('.clone-button').removeClass('hide').show();
    }
}
$.autocomplete = function(objcontainer) {
    objcontainer = (typeof objcontainer != 'undefined') ? objcontainer : $('body');
    $('.autocomplete', objcontainer).each(function() {
        var self = $(this);
        var url = self.attr('data-url');
        var _class = self.attr('data-class');
        var blockScreen = ( self.attr('data-block-screen') !== undefined ) ? true : false;

        if (source_data.hasOwnProperty(_class)) {
            $.buildAutocomplete(self, _class);
        } else {
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                global: blockScreen,
                async: false,
                success: function(data) {
                    source_data[_class] = [];
                    for (var i in data) {
                        var row = data[i];
                        source_data[_class].push(JSON.stringify(row));
                    }
                    $.buildAutocomplete(self, _class);
                }
            });
        }
    });
}
$.buildAutocomplete = function(obj, _class) {
    var id = obj.attr('id');
    var redirectOnSelectedPath = obj.attr('redirect-on-selected-path');

    obj.typeahead({
        source: source_data[_class],
        items: 5,
        minLength: 0,
        highlighter: function(item) {

            var result = '<div>'+JSON.parse(item).name+'</div>';
            if( JSON.parse(item).hasOwnProperty('custom_field') ) {
                var image = serviceUri + obj.attr('data-path') + JSON.parse(item).custom_field;
                result = '<div class="autocomplete-item"> <img src="'+image+'" data-disable-progressive="1" onerror="$.onErrorImageAutocomplete(this)" /> <span class="autocomplete-text">'+JSON.parse(item).name+'</span> <div class="clearfix"></div> </div>';
            }

            return result;
        },
        matcher: function(item) {
            return JSON.parse(item).name.toLocaleLowerCase().indexOf(this.query.toLocaleLowerCase()) != -1;
        },
        updater: function(item) {
            var objItem = JSON.parse(item);
            var hiddenField = $('#hdnField' + id);
            if (hiddenField.length) {
                hiddenField.val(objItem.id);
            }

            if( redirectOnSelectedPath !== undefined ) {
                window.location.href = serviceUri + redirectOnSelectedPath + objItem.id;
            }

            return objItem.name;
        },
        showHintOnFocus: true,
    });
}
$.ajaxModal = function(options) {
    $('body').on('click', '.ajax-modal', function() {
        var self = $(this);
        var url = self.attr('href');
        var title = self.attr('title');
        $.ajax({
            url: url,
            type: 'POST',
            success: function(response, status) {
                $('#myModal').replaceWith(response);
                $('#myModal').modal('show');

                $.fileUpload();
                $.unveil();

                return false;
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert($.translate('failed_processing_data'));
                return false;
            }
        });
        return false;
    });
    $('body').on('click', '.close-modal', function() {
        $('#myModal').modal('hide');
        return false;
    });
}
$.tabs = function() {
    $('body').on('click', 'ul.nav.nav-tabs a, a.custom-nav-tabs', function(e) {
        e.preventDefault();
        var self = $(this);
        if(self.hasClass('custom-nav-tabs')){
            $('ul.nav.nav-tabs li').removeClass('active');
        }

        self.tab('show');
    });
}
$.replaceText = function() {
    $('body').on('click', '.replace-text', function() {
        var self = $(this);
        var target = self.attr('text-target');

        var text = self.find("*").last().text();
        if( self.attr('text-value') !== undefined ) {
            text = self.attr('text-value');
        }

        $(target).text(text);
    });
}
$.slugify = function(text){
    if( typeof text == 'string' ) {
        text = text.toString().toLowerCase()
            .replace(/\s+/g, '-')           // Replace spaces with -
            .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
            .replace(/\-\-+/g, '-')         // Replace multiple - with single -
            .replace(/^-+/, '')             // Trim - from start of text
            .replace(/-+$/, '');            // Trim - from end of text
    }

    return text;
}
$.errorRedirect = function(){
    window.location.reload();
}
$.setCookie = function(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}
$.getCookie = function(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
$.ucFirst = function(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}
$.onErrorImageAutocomplete = function(image){
    image.onerror = "";
    image.src = serviceUri + "resources/images/placeholder/recipe.jpg";
    return true;
}
$.translate = function( str ){
    return arrTranslate[$('#site_lang').val()][str.toLowerCase()];
}
$.autoResizeTextarea = function(){
    $('.autoResize').each(function(){
        var self = $(this);
        self.off('keydown').on('keydown', function(){
            setTimeout(function(){
                self.attr('style', 'height:auto; display: inline-block; width: 100%; max-width: ' + self.css('width') + '; min-height: 50px; resize: none; word-wrap: break-word; overflow: hidden; outline: none;');
                self.attr('style', 'resize:none; min-height: 50px; width: 100%; max-width: ' + self.css('width') + '; overflow: hidden; outline: none; height:' + self[0].scrollHeight + 'px');
            },0);
        });
        self.trigger('keydown');
    });
}