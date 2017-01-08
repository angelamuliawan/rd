var Root = React.createClass({
	mixins: [FormMixin],
	getInitialState: function(){
		return {
			dataTimeline: [],
			dataThumbnail: [],
			onProcessingRequest: false,
			limitTimeline: 0,
			limitThumbnail: 15,
			limitComment: [],
			needToUpdateState: true,
			userId : null,
			userPhoto: null,
			userName: null,
			viewerId: $('#userIdViewer').val(),
			filterView : $.getUrlParameter('param'),
			viewMode: ( $.getCookie('viewMode') ) ? $.getCookie('viewMode') : 'timeline',
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
		};
	},
	componentWillMount: function(){
	},
	componentDidMount: function(){
		var _this = this;
		window.addEventListener('scroll', _this._handleScroll);

		$('.btn-timeline-navigation').click(function(e){
			e.preventDefault();
			var param = $(this).attr('data-param');
			_this.setState({
				needToUpdateState: true,
				filterView : param,
				limitTimeline: 0,
				limitThumbnail: 15,
				dataTimeline: [],
				dataThumbnail: [],
			}, function(){
				_this._loadData();
			});
		});

		this._loadData();
	},
	_getKeyViewMode: function( option ){
		return option + $.ucFirst(this.state.viewMode);
	},
	_loadData: function( ajaxGlobal ) {

		if (ajaxGlobal === undefined) {
	        ajaxGlobal = false;
	    }

		if( !this.state.onProcessingRequest && this.state.needToUpdateState ) {

			var keySourceData = this._getKeyViewMode('limit');

			this.setState({
				[keySourceData]: this.state[keySourceData] + 5
			}, function(){
				$.ajax({
		            url: apiUri + this.props.url,
		            type: 'POST',
		            dataType: 'json',
		            global: ajaxGlobal,
		            data: {
		            	view_mode : this.state.viewMode,
				        viewer_id : this.state.viewerId,
				        filter_view : this.state.filterView,
				        limit : this.state[keySourceData],
				        limitComment: this.state.limitComment,
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
		                console.error(this.props.url, status, err.toString());
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
        	viewerId: data.viewerId,
        });

        var keySourceData = this._getKeyViewMode('data');

        if( JSON.stringify(data.results) == JSON.stringify(this.state[keySourceData]) ) {
        	this.setState({
    			needToUpdateState: false
    		});

    		setTimeout(function(){ 
    			this.setState({
	    			needToUpdateState: true
	    		});
    		}.bind(this), 20000);
        } else {
        	var limitComment = this.state.limitComment;
        	var length = data.results.length;

        	for(var n = 0; n < length; n++){
        		if( typeof limitComment[n] == 'undefined' ) {
            		limitComment[n] = 5;
            	}
        	}

            this.setState({
            	[keySourceData]: update(this.state[keySourceData], {$set: data.results}),
            	limitComment: limitComment,
            });
        }

    	this.setState({
    		onProcessingRequest: false,
    	});
	},
	_handleScroll: function(e) {
	    if($(window).scrollTop() + $(window).height() > ($(document).height()/2) + 300 ) {
	    	this._loadData();
	    }
	},
	_handleTimelineRemove: function(obj){

		var activity = obj.activity;
		var id = obj.id;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl = false;

		if( activity == 'InsertRecipe' ) {
			ajaxUrl = 'recipe';
		} else if( activity == 'Recook' ) {
			ajaxUrl = 'recook';
		} else if( activity == 'Cookmark' ) {
			ajaxUrl = 'cookmark';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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
				    this.setState({
				    	limitComment: update(this.state.limitComment, { $splice: [[timelineIndex, 1]] }),
				    	dataTimeline: update(this.state.dataTimeline, { $splice: [[timelineIndex, 1]] }),
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
	_handleTimelineToggleLove: function(obj){
		var type = obj.type;
		var itemId = obj.recipeId;
		var ajaxMethodType = false;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.id
		});

		if( type == 'love' ) {
			ajaxMethodType = 'POST';
		} else if( type == 'unlove' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + 'love',
            type: ajaxMethodType,
            dataType: 'json',
            data: {
		        'id' : itemId,
		    },
		    global: false,
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
				    var newState = update(this.state.dataTimeline, {
				      	[timelineIndex] : {
				      		FlagLove: {$set: data.loveStatus},
				      		NumberOfLove: {$set: this.state.dataTimeline[timelineIndex].NumberOfLove + data.flagNumberOfLove},
				      	}
				    });

				    this.setState({
				    	dataTimeline: newState,
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
	_handleTimelineToggleLoveRecook: function(obj){
		var type = obj.type;
		var itemId = obj.recookId;
		var ajaxMethodType = false;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.id
		});

		if( type == 'love' ) {
			ajaxMethodType = 'POST';
		} else if( type == 'unlove' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + 'recooklove',
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
					var newState = update(this.state.dataTimeline, {
				      	[timelineIndex] : {
				      		FlagRecookLove: {$set: data.loveStatus},
				      		NumberOfRecookLove: {$set: this.state.dataTimeline[timelineIndex].NumberOfRecookLove + data.flagNumberOfRecookLove},
				      	}
				    });

				    this.setState({
				    	dataTimeline: newState,
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
	_handleTimelineToggleCookmark: function(obj){

		var type = obj.type;
		var itemId = false;
		var ajaxMethodType = false;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.id
		});

		if( type == 'cookmark' ) {
			itemId = obj.recipeId;
			ajaxMethodType = 'POST';
		} else if( type == 'uncookmark' ) {
			itemId = obj.cookmarkId;
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + 'cookmark',
            type: ajaxMethodType,
            dataType: 'json',
            data: {
		        'id' : itemId,
		    },
		    global: false,
		    beforeSend: function(){
		    	this.setState({
					onProcessingRequest: true,
				});
		    }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
					var newState = update(this.state.dataTimeline, {
				      	[timelineIndex] : {FlagCookmark: {$set: data.cookmarkId}}
				    });

				    this.setState({
				    	dataTimeline: newState,
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
	_handleToggleViewMode: function(viewMode, e){
		e.preventDefault();
		$.setCookie('viewMode', viewMode);

		if( this.state.viewMode != viewMode && !this.state.onProcessingRequest ) {
			this.setState({
				viewMode: viewMode,
				needToUpdateState: true,
			}, function(){
				var keySourceData = this._getKeyViewMode('data');
				if( !this.state[keySourceData].length ) {
					this._loadData();
				}
			});
		}
	},
	_handleCommentRemove: function(obj){

		var id = obj.id;
		var type = obj.type;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl;
		var keyId;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'comment';
			keyId = 'FoodCommentID';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'recookcomment';
			keyId = 'RecookCommentID';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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
					var removedIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == id
					});

					var currentLimit = this.state.limitComment[timelineIndex];
					var currentCommentsTotal = this.state.dataTimeline[timelineIndex].CommentsTotal;

				    this.setState({
				    	limitComment: update(this.state.limitComment, { [timelineIndex] : { $set: currentLimit - 1} }),
				    	dataTimeline: update(this.state.dataTimeline, { [timelineIndex] : { 
				    		Comments: {$splice: [[removedIndex, 1]]},
				    		CommentsTotal: { $set : currentCommentsTotal - 1},
				    	}}),
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
		
		var type = obj.type;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl;
		var keyId;
		var keyComment;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'comment';
			keyId = 'FoodCommentID';
			keyComment = 'Comment';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'recookcomment';
			keyId = 'RecookCommentID';
			keyComment = 'RecookCommentDesc';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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
					var editedIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == id
					});

				    this.setState({
				    	dataTimeline: update(this.state.dataTimeline, { [timelineIndex] : { Comments: { [editedIndex] : {[keyComment]: {$set: text}} }}}),
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
		
		var type = obj.type;
		var text = obj.text.trim().replace(/\r?\n/g, '<br />');
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'comment';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'recookcomment';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
            type: 'POST',
            data: {
            	id: obj.id,
            	comment: text,	
            },
            global: false,
            beforeSend: function(){
            	this.setState({
            		formComment: {
            			id: obj.id,
            			onProcessingRequest: true,
            		},
				});
            }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {
            		var currentLimit = this.state.limitComment[timelineIndex];
            		var currentCommentsTotal = this.state.dataTimeline[timelineIndex].CommentsTotal;

            		this.setState({
            			limitComment: update(this.state.limitComment, { [timelineIndex] : { $set: currentLimit + 1} }),
            			dataTimeline: update(this.state.dataTimeline, { [timelineIndex] : { 
            				Comments: { $unshift : data.newData},
            				CommentsTotal: { $set : currentCommentsTotal + 1},
            			}}),
            			formComment: {
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
	_handleCommentViewMore: function(obj){
		if( !this.state.onProcessingRequest ) {

			var id = obj.id;
			var type = obj.type;
			var timelineIndex = this.state.dataTimeline.findIndex(function(item){
				return item['id'] == obj.timelineId
			});

			var ajaxUrl;
			var currentLimit = this.state.limitComment[timelineIndex];

			if( type == 'recipe_comment' ) {
				ajaxUrl = 'comment';
			} else if( type == 'recook_comment' ) {
				ajaxUrl = 'recookcomment';
			}

			this.setState({
				limitComment: update(this.state.limitComment, { [timelineIndex] : {$set: currentLimit + 5} })
			}, function(){
				$.ajax({
		            url: apiUri + ajaxUrl + '/' + id,
		            type: 'GET',
		            dataType: 'json',
		            global: false,
		            data: {
				        'limit' : this.state.limitComment[timelineIndex],
				    },
		            beforeSend: function(){
		            	this.setState({
							onProcessingRequest: true,
						});
		            }.bind(this),
		            success: function(data) {
		            	this.setState({
		            		dataTimeline: update(this.state.dataTimeline, { [timelineIndex] : { Comments: {$set : data.results}}}),
		            		onProcessingRequest: false,
			            });
		            }.bind(this),
		            error: function(xhr, status, err) {
		                // console.error(this.props.url, status, err.toString());
		            }.bind(this)
		        });
			});
		}
	},
	_handleCommentToggleLike: function(obj){

		var itemId = obj.commentId;
		var likeStatus = obj.likeStatus;
		var type = obj.type;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.id
		});
		
		var ajaxUrl;
		var ajaxMethodType = false;
		var keyId = false;

		if( type == 'recipe_comment' ) {
			keyId = 'FoodCommentID'; 
			ajaxUrl = 'likecomment';
		} else if( type == 'recook_comment' ) {
			keyId = 'RecookCommentID';
			ajaxUrl = 'likerecookcomment';
		}

		if( likeStatus == 'Like' ) {
			ajaxMethodType = 'POST';
		} else if( likeStatus == 'Unlike' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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

				    var editedIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == itemId
					});

				    this.setState({
				    	dataTimeline: update(this.state.dataTimeline, { 
				    		[timelineIndex] : { 
					    		Comments: { 
					    			[editedIndex] : { 
						    			FlagLove: {$set: data.flagLove},
						    			NumberOfComment: {$set: this.state.dataTimeline[timelineIndex].Comments[editedIndex].NumberOfComment + data.flagNumberOfComment}
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
		var commentIndex = obj.id;
		var text = obj.text.trim().replace(/\r?\n/g, '<br />');
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl;
		var keyId;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'replycomment';
			keyId = 'FoodCommentID';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'replyrecookcomment';
			keyId = 'RecookCommentID';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
            type: 'POST',
            data: {
            	id: commentIndex,
            	comment: text,	
            },
            global: false,
            beforeSend: function(){
            	this.setState({
					formReplyComment: update(this.state.formReplyComment, { 
						onProcessingRequest: {$set : true},
					}),
				});
            }.bind(this),
            success: function(data) {
            	if( data.status == 'success' ) {

            		var editedIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == commentIndex
					});

            		this.setState({
            			dataTimeline: update(this.state.dataTimeline, { [timelineIndex] : { 
            				Comments: { 
            					[editedIndex] : { 
	            					ReplyComments: { $unshift : data.newData},
	            				}
	            			}
            			}}),
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
		var commentId = obj.commentId;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});
		
		var ajaxUrl;
		var keyId;
		var replyKeyId;
		var keyComment;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'replycomment';
			keyId = 'FoodCommentID';
			replyKeyId = 'CommentReplyID';
			keyComment = 'CommentReply';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'replyrecookcomment';
			keyId = 'RecookCommentID';
			replyKeyId = 'RecookCommentReplyID';
			keyComment = 'RecookCommentReply';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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
					var editedCommentIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == commentId
					});

					var editedReplyCommentIndex = this.state.dataTimeline[timelineIndex].Comments[editedCommentIndex].ReplyComments.findIndex(function(item){
						return item[replyKeyId] == id
					});

				    this.setState({
				    	dataTimeline: update(this.state.dataTimeline, { 
				    		[timelineIndex] : { 
				    			Comments: { 
				    				[editedCommentIndex] : {
				    					ReplyComments: { 
						    				[editedReplyCommentIndex] : {
						    					[keyComment]: {$set: text}
						    				}
						    			}
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
		var commentId = obj.commentId;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.timelineId
		});

		var ajaxUrl;
		var keyId;
		var replyKeyId;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'replycomment';
			keyId = 'FoodCommentID';
			replyKeyId = 'CommentReplyID';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'replyrecookcomment';
			keyId = 'RecookCommentID';
			replyKeyId = 'RecookCommentReplyID';
		}	

		$.ajax({
            url: apiUri + ajaxUrl,
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
					var editedCommentIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == commentId
					});

					var removedIndex = this.state.dataTimeline[timelineIndex].Comments[editedCommentIndex].ReplyComments.findIndex(function(item){
						return item[replyKeyId] == id
					});

				    this.setState({
				    	dataTimeline: update(this.state.dataTimeline, { 
				    		[timelineIndex] : { 
					    		Comments : {
					    			[editedCommentIndex]  : {
							    		ReplyComments: {$splice: [[removedIndex, 1]]},
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
	_handleReplyCommentToggleLike: function(obj){

		var commentId = obj.commentId;
		var replyId = obj.replyId;
		var likeStatus = obj.likeStatus;
		var type = obj.type;
		var timelineIndex = this.state.dataTimeline.findIndex(function(item){
			return item['id'] == obj.id
		});
		
		var ajaxUrl;
		var ajaxMethodType;
		var keyId;
		var replyKeyId;

		if( type == 'recipe_comment' ) {
			ajaxUrl = 'likereplycomment';
			keyId = 'FoodCommentID';
			replyKeyId = 'CommentReplyID';
		} else if( type == 'recook_comment' ) {
			ajaxUrl = 'likereplyrecookcomment';
			keyId = 'RecookCommentID';
			replyKeyId = 'RecookCommentReplyID';
		}

		if( likeStatus == 'Like' ) {
			ajaxMethodType = 'POST';
		} else if( likeStatus == 'Unlike' ) {
			ajaxMethodType = 'DELETE';
		}

		$.ajax({
            url: apiUri + ajaxUrl,
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
					var editedCommentIndex = this.state.dataTimeline[timelineIndex].Comments.findIndex(function(item){
						return item[keyId] == commentId
					});

					var editedReplyCommentIndex = this.state.dataTimeline[timelineIndex].Comments[editedCommentIndex].ReplyComments.findIndex(function(item){
						return item[replyKeyId] == replyId
					});

				    this.setState({
				    	dataTimeline: update(this.state.dataTimeline, { 
				    		[timelineIndex] : { 
					    		Comments: { 
					    			[editedCommentIndex] : {
					    				ReplyComments: { 
							    			[editedReplyCommentIndex] : { 
								    			FlagLove: {$set: data.flagLove},
								    			NumberOfComment: {$set: this.state.dataTimeline[timelineIndex].Comments[editedCommentIndex].ReplyComments[editedReplyCommentIndex].NumberOfComment + data.flagNumberOfComment}
								    		} 
							    		}
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
            case "TIMELINE_DESTROY":
            	this._handleTimelineRemove(payload.params);
            break;
            case "TIMELINE_TOGGLE_LOVE":
            	this._handleTimelineToggleLove(payload.params);
            break;
            case "TIMELINE_TOGGLE_LOVE_RECOOK":
            	this._handleTimelineToggleLoveRecook(payload.params);
            break;
            case "TIMELINE_TOGGLE_COOKMARK":
            	this._handleTimelineToggleCookmark(payload.params);
            break;
            case "COMMENT_VIEW_MORE":
            	this._handleCommentViewMore(payload.params);
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

		var profileViewDOM = false;

		if( this.state.viewMode == 'timeline' ) {
			const timelineListProps = {
				loggedInUserId: this.state.userId,
				loggedInUserPhoto: this.state.userPhoto,
				loggedInUserName: this.state.userName,
				viewerId: this.state.viewerId,
				data: this.state.dataTimeline,
				formComment: this.state.formComment,
				formEditComment: this.state.formEditComment,
				formReplyComment: this.state.formReplyComment,
				formEditReplyComment: this.state.formEditReplyComment,
				_onAction: this._onAction,
			}

			profileViewDOM = (
				<div>
		            <ul className="timeline">
		                <TimelineList {...timelineListProps} />
		                <li className="clearfix no-float"></li>
		            </ul>
		            <div className="mt20 ml20">
		            	{ (this.state.onProcessingRequest && this.state.needToUpdateState) ? <LoadingTimeline /> : '' }
		            </div>
		        </div>
	        );
		} else if( this.state.viewMode == 'thumbnail' ) {

			profileViewDOM = (
				<div>
		            <ul className="thumbnail-view">
		                <ThumbnailList data={this.state.dataThumbnail} />
		            </ul>
		            <div className="mt20 ml20">
		            	{ (this.state.onProcessingRequest && this.state.needToUpdateState) ? <Loading /> : '' }
		            </div>
		        </div>
	        );
		}

		return (
			<div>
				<div className="view-mode-navigation mb20">
					<div className="row">
						<div className="col-sm-6 col-xs-6 left-side">
							<div onClick={this._handleToggleViewMode.bind(null, 'timeline')} className={"navigation-wrapper " + ((this.state.viewMode == 'timeline') ? 'active' : '')}>
								<span className="glyphicon glyphicon-th-list"></span>
								<span className="navigation-text desktop-only">Timeline View</span>
							</div>
						</div>
						<div className="col-sm-6 col-xs-6 right-side">
							<div onClick={this._handleToggleViewMode.bind(null, 'thumbnail')} className={"navigation-wrapper " + ((this.state.viewMode == 'thumbnail') ? 'active' : '')}>
								<span className="glyphicon glyphicon-th"></span>
								<span className="navigation-text desktop-only">Thumbnail View</span>
							</div>
						</div>
					</div>
				</div>

				{ profileViewDOM }
			</div>
		)
	},
});

ReactDOM.render(
    <Root url="user/getTimeline" />,
    document.getElementById('profile-container')
);