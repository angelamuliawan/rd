var Root = React.createClass({
	mixins: [FormMixin],
	getInitialState: function(){
		return {
			data: [],
			commentsTotal: 0,
			onProcessingRequest: false,
			fetchInterval: false,
			limit: 0,
			needToUpdateState: true,
			userId : null,
			userPhoto: null,
			userName: null,
			recookId: $('#recookId').val(),
			formComment: {
				id: 0,
				text: '',
				onProcessingRequest: false,
			},
			formEditComment: {
				id: 0,
				text: '',
				editMode: false,
				onProcessingRequest: false,
			},
			formReplyComment: {
				id: 0,
				text: '',
				replyMode: false,
				onProcessingRequest: false,
			},
			formEditReplyComment: {
				id: 0,
				text: '',
				editMode: false,
				onProcessingRequest: false,
			},
		}
	},
	componentDidMount: function(){

		var recookDesc = $('#recookDesc').text();
		$('#recookDesc').html($.emoticons.replace(recookDesc));

		window.addEventListener('scroll', this._handleScroll);
		this._loadData();
		// this._fetchCommentRegularly();
	},
	_handleScroll: function(e) {
	    if($(window).scrollTop() + $(window).height() > ($(document).height()/2) + 300 ) {
	    	this._loadData();
	    }
	},
	_loadData: function( ajaxGlobal ) {

		if (ajaxGlobal === undefined) {
	        ajaxGlobal = false;
	    }

		if( !this.state.onProcessingRequest && this.state.needToUpdateState ) {

			this.setState({
				limit: this.state.limit + 5
			}, function(){
				$.ajax({
		            url: apiUri + this.props.url + '/' + this.state.recookId,
		            type: 'GET',
		            dataType: 'json',
		            global: ajaxGlobal,
		            data: {
				        'limit' : this.state.limit,
				    },
		            beforeSend: function(){
		            	this.setState({
							onProcessingRequest: true,
						});
		            }.bind(this),
		            success: function(data) {
		            	this._appendNewData(data);
		            }.bind(this),
		            error: function(xhr, status, err) {
		                // console.error(this.props.url, status, err.toString());
		            }.bind(this)
		        });
		    });
		}
    },
    _appendNewData: function( data ){
    	this.setState({
        	userId: data.userId,
        	userPhoto: data.userPhoto,
        	userName: data.userName,
        });

        if( JSON.stringify(data.results) == JSON.stringify(this.state.data) ) {
        	this.setState({
    			needToUpdateState: false
    		});

    		setTimeout(function(){ 
    			this.setState({
	    			needToUpdateState: true
	    		});
    		}.bind(this), 20000);
        } else {
        	this.setState({
            	data: update(this.state.data, {$set: data.results}),
            	commentsTotal: update(this.state.commentsTotal, {$set: data.commentsTotal}),
            });
    	}

    	this.setState({
    		onProcessingRequest: false,
    	});
	},
	_handleCommentRemove: function(obj){
		$.ajax({
            url: apiUri + this.props.url,
            type: 'DELETE',
            dataType: 'json',
            global: false,
            data: {
		        'id' : obj.id,
		    },
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
					var removedIndex = this.state.data.findIndex(function(item){
						return item.RecookCommentID == obj.id
					});

				    this.setState({
				    	data: update(this.state.data, {$splice: [[removedIndex, 1]]}),
				    	commentsTotal: update(this.state.commentsTotal, {$set : this.state.commentsTotal - 1}),
				    	onProcessingRequest: false,
				   	});
				} else {
            		$.errorRedirect();
            	}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_handleCommentEdit: function(obj){

		var id = this.state.formEditComment.id;
		var text = obj.text.trim().replace(/\r?\n/g, '<br />');

		$.ajax({
            url: apiUri + this.props.url,
            type: 'PUT',
            dataType: 'json',
            data: {
		        'id' : id,
		        'comment' : text,
		    },
		    global: false,
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
					formEditComment: update(this.state.formEditComment, { 
						onProcessingRequest: {$set : true},
					}),
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
					var editedIndex = this.state.data.findIndex(function(item){
						return item.RecookCommentID == id
					});

				    this.setState({
				    	data: update(this.state.data, { [editedIndex] : {RecookCommentDesc: {$set: text}} }),
				    	onProcessingRequest: false,
				    	formEditComment: update(this.state.formEditComment, { 
							onProcessingRequest: {$set : false},
						}),
				   	}, function(){
				   		this._disableEditMode();
				   	});
				} else {
					$.errorRedirect();
				}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_handleCommentSubmit: function(obj){
		$.ajax({
            url: apiUri + this.props.url,
            type: 'POST',
            data: {
            	id: this.state.recookId,
            	comment: obj.text.trim().replace(/\r?\n/g, '<br />'),	
            },
            global: false,
            beforeSend: function(){
            	this.setState({
					onProcessingRequest: true,
					formComment: update(this.state.formComment, { 
						onProcessingRequest: {$set : true},
					}),
				});
            }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
	            	this.setState({
	            		data: update(this.state.data, {$unshift : data.newData}),
	            		commentsTotal: update(this.state.commentsTotal, {$set : this.state.commentsTotal + 1}),
						onProcessingRequest: false,
						formComment: update(this.state.formComment, { 
							text : {$set : ''},
							onProcessingRequest: {$set : false},
						}),
					});
				} else {
					$.errorRedirect();
				}
            }.bind(this),
            error: function(xhr, status, err) {
                // this.setState({data: param});
                // console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
	},
	_handleCommentToggleLike: function(obj){

		var itemId = obj.commentId;
		var likeStatus = obj.likeStatus;
		var type = obj.type;

		var ajaxMethodType = false;

		if( likeStatus == 'Like' ) {
			ajaxMethodType = 'POST';
		} else if( likeStatus == 'Unlike' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + 'likerecookcomment',
            type: ajaxMethodType,
            dataType: 'json',
            global: false,
            data: {
		        'id' : itemId,
		    },
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {

				    var editedIndex = this.state.data.findIndex(function(item){
						return item['RecookCommentID'] == itemId
					});

				    this.setState({
				    	data: update(this.state.data, { 
			    			[editedIndex] : {
				    			FlagLove: {$set: data.flagLove},
				    			NumberOfComment: {$set: this.state.data[editedIndex].NumberOfComment + data.flagNumberOfComment}
				    		} 
					    }),
				    	onProcessingRequest: false,
				   	});

				} else {
					$.errorRedirect();
				}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_enableEditMode: function(obj){
		this._disableEditMode(function(){
			this.setState({
				formEditComment: update(this.state.formEditComment, { 
					id: {$set: obj.id}, 
					text: {$set: obj.text},
					editMode: {$set: true},
				})
			});
		});
	},
	_disableEditMode: function(callback){
		this.setState({
			formEditComment: update(this.state.formEditComment, {
				id: {$set: 0},
				text: {$set: ''},
				editMode: {$set: false},
			})
		}, callback);
	},
	_enableReplyMode: function(obj){
		this._disableReplyMode(function(){
			this.setState({
				formReplyComment: update(this.state.formReplyComment, { 
					id: {$set: obj.id},
					text: {$set: ''},
					replyMode: {$set: true},
				})
			});
		});
	},
	_disableReplyMode: function(callback){
		this.setState({
			formReplyComment: update(this.state.formReplyComment, {
				id: {$set: 0},
				text: {$set: ''},
				replyMode: {$set: false},
			})
		}, callback);
	},
	_enableReplyEditMode: function(obj){
		this._disableReplyEditMode(function(){
			this.setState({
				formEditReplyComment: update(this.state.formEditReplyComment, { 
					id: {$set: obj.id}, 
					text: {$set: obj.text},
					editMode: {$set: true},
				})
			});
		});
	},
	_disableReplyEditMode: function(callback){
		this.setState({
			formEditReplyComment: update(this.state.formEditReplyComment, {
				id: {$set: 0},
				text: {$set: ''},
				editMode: {$set: false},
			})
		}, callback);
	},
	_handleCommentReplySubmit: function(obj){

		var type = obj.type;
		var text = obj.text.trim().replace(/\r?\n/g, '<br />');
		var commentIndex = this.state.data.findIndex(function(item){
			return item['RecookCommentID'] == obj.id
		});

		$.ajax({
            url: apiUri + 'replyrecookcomment',
            type: 'POST',
            data: {
            	id: obj.id,
            	comment: text,	
            },
            global: false,
            beforeSend: function(){
            	this.setState({
					onProcessingRequest: true,
					formReplyComment: update(this.state.formReplyComment, { 
						onProcessingRequest: {$set : true},
					}),
				});
            }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {

            		this.setState({
            			data: update(this.state.data, { 
        					[commentIndex] : {
            					ReplyComments: { $unshift : data.newData},
            				}
            			}),
            			formReplyComment: {
							onProcessingRequest: false,
						},
					});
            	} else {
            		$.errorRedirect();
            	}
            }.bind(this),
            error: function(xhr, status, err) {
                // this.setState({data: param});
                // console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
	},
	_handleCommentReplyEdit: function(obj){

		var id = this.state.formEditReplyComment.id;
		var text = obj.text.trim().replace(/\r?\n/g, '<br />');
		
		var type = obj.type;
		var commentIndex = this.state.data.findIndex(function(item){
			return item['RecookCommentID'] == obj.commentId
		});

		$.ajax({
            url: apiUri + 'replyrecookcomment',
            type: 'PUT',
            dataType: 'json',
            data: {
		        'id' : id,
		        'comment' : text,
		    },
		    global: false,
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
					formEditReplyComment: update(this.state.formEditReplyComment, { 
						onProcessingRequest: {$set : true},
					}),
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {

					var editedReplyCommentIndex = this.state.data[commentIndex].ReplyComments.findIndex(function(item){
						return item['RecookCommentReplyID'] == id
					});

				    this.setState({
				    	data: update(this.state.data, { 
				    		[commentIndex] : { 
		    					ReplyComments: { 
				    				[editedReplyCommentIndex] : {
				    					RecookCommentReply: {$set: text}
				    				}
				    			}
				    		}
				    	}),
				    	onProcessingRequest: false,
				    	formEditReplyComment: update(this.state.formEditReplyComment, { 
							onProcessingRequest: {$set : false},
						}),
				   	}, function(){
				   		this._disableReplyEditMode();
				   	});
				} else {
            		$.errorRedirect();
            	}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_handleReplyCommentRemove: function(obj){

		var id = obj.id;
		var type = obj.type;
		var commentIndex = this.state.data.findIndex(function(item){
			return item['RecookCommentID'] == obj.commentId
		});

		$.ajax({
            url: apiUri + 'replyrecookcomment',
            type: 'DELETE',
            dataType: 'json',
            global: false,
            data: {
		        'id' : id,
		    },
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {

					var removedIndex = this.state.data[commentIndex].ReplyComments.findIndex(function(item){
						return item['RecookCommentReplyID'] == id
					});

				    this.setState({
				    	data: update(this.state.data, { 
				    		[commentIndex] : { 
							    ReplyComments: {$splice: [[removedIndex, 1]]},
					    	}
					    }),
				    	onProcessingRequest: false,
				   	});
				} else {
            		$.errorRedirect();
            	}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_handleReplyCommentToggleLike: function(obj){

		var replyId = obj.replyId;
		var likeStatus = obj.likeStatus;
		var commentIndex = this.state.data.findIndex(function(item){
			return item['RecookCommentID'] == obj.commentId
		});
		
		var ajaxMethodType;

		if( likeStatus == 'Like' ) {
			ajaxMethodType = 'POST';
		} else if( likeStatus == 'Unlike' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + 'likereplyrecookcomment',
            type: ajaxMethodType,
            dataType: 'json',
            global: false,
            data: {
		        'id' : replyId,
		    },
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
					var editedReplyCommentIndex = this.state.data[commentIndex].ReplyComments.findIndex(function(item){
						return item['RecookCommentReplyID'] == replyId
					});

				    this.setState({
				    	data: update(this.state.data, { 
				    		[commentIndex] : { 
			    				ReplyComments: { 
					    			[editedReplyCommentIndex] : { 
						    			FlagLove: {$set: data.flagLove},
						    			NumberOfComment: {$set: this.state.data[commentIndex].ReplyComments[editedReplyCommentIndex].NumberOfComment + data.flagNumberOfComment}
						    		} 
					    		}
						    }
					    }),
				    	onProcessingRequest: false,
				   	});

				} else {
					$.errorRedirect();
				}
            }.bind(this),
            error: function(xhr, status, err) {

            }.bind(this)
        });
	},
	_onAction: function(payload){
		switch(payload.action){
			case "HANDLE_VALUE_CHANGE":
            	this._handleValueChange(payload.params);
            break;
            case "COMMENT_STORE":
            	this._handleCommentSubmit(payload.params);
            break;
            case "COMMENT_UPDATE":
            	this._handleCommentEdit(payload.params);
            break;
            case "COMMENT_DESTROY":
            	this._handleCommentRemove(payload.params);
            break;
            case "COMMENT_ENABLE_EDIT_MODE":
            	this._enableEditMode(payload.params);
            break;
            case "COMMENT_DISABLE_EDIT_MODE":
            	this._disableEditMode(payload.params);
            break;
            case "COMMENT_TOGGLE_LIKE":
            	this._handleCommentToggleLike(payload.params);
            break;
            case "COMMENT_ENABLE_REPLY_MODE":
            	this._enableReplyMode(payload.params);
            break;
            case "COMMENT_DISABLE_REPLY_MODE":
            	this._disableReplyMode(payload.params);
            break;
            case "REPLY_COMMENT_STORE":
            	this._handleCommentReplySubmit(payload.params);
            break;
            case "REPLY_COMMENT_UPDATE":
            	this._handleCommentReplyEdit(payload.params);
            break;
            case "REPLY_COMMENT_DESTROY":
            	this._handleReplyCommentRemove(payload.params);
            break;
            case "COMMENT_ENABLE_REPLY_EDIT_MODE":
            	this._enableReplyEditMode(payload.params);
            break;
            case "COMMENT_DISABLE_REPLY_EDIT_MODE":
            	this._disableReplyEditMode(payload.params);
            break;
            case "REPLY_COMMENT_TOGGLE_LIKE":
            	this._handleReplyCommentToggleLike(payload.params);
            break;
          	default:
            	console.warn("Action: '" + payload.action + "' was not handled.");
        }
	},
	render: function(){

		const commentWrapperProps = {
			loggedInUserId: this.state.userId,
			loggedInUserPhoto: this.state.userPhoto,
			loggedInUserName: this.state.userName,
			data: this.state.data,
			commentsTotal: this.state.commentsTotal,
			userId: this.state.userId,
			formComment: this.state.formComment,
			formEditComment: this.state.formEditComment,
			formReplyComment: this.state.formReplyComment,
			formEditReplyComment: this.state.formEditReplyComment,
			type: 'recook_comment',
			showEmpty: false,
			_onAction: this._onAction,
			paddingClass: 'pt15',
		}

		var loginToCommentButton = false;
		if( !this.state.userId ) {
			loginToCommentButton = <Anchor href={ serviceUri + 'users/login' } title="Komentari Recook Ini" className="btn btn-orange ml10 mb10 ajax-modal" />
		}

		return (
			<div>
				<CommentWrapper {...commentWrapperProps} />
				{ loginToCommentButton }
			</div>
		)
	},
});

ReactDOM.render(
    <Root url="recookcomment" />,
    document.getElementById('comment-container')
);