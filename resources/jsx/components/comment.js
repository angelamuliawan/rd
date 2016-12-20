var CommentWrapper = React.createClass({
	propTypes: {
	    paddingClass: React.PropTypes.string,
	    showTitle: React.PropTypes.bool,
	    showEmpty: React.PropTypes.bool,
	    className: React.PropTypes.string,
	    text: React.PropTypes.string,
	},
	getDefaultProps: function() {
	    return {
	    	userId: 0,
	      	loggedInUserName: '',
			loggedInUserPhoto: '',
	      	paddingClass: 'pd15',
	      	showTitle: true,
	      	showEmpty: true,
	      	className: '',
	      	text: '',
	    };
	},
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){

		var showTitle = false;
		var showEmpty = false;
		var commentForm = false;
		
		if( this.props.showTitle ) {
			showTitle = <h3> { $.translate('comment') } {this.props.commentsTotal > 0 ? <span dangerouslySetInnerHTML={{__html: '&middot; ' + this.props.commentsTotal}} />  : ''}</h3>
		}

		if( this.props.showEmpty && !this.props.data.length ) {
			showEmpty = <h5 className="mt5"> { $.translate('comment_not_available') } </h5>
		}

		if( this.props.userId ) {

			const commentFormProps = {
				formComment: this.props.formComment,				
				_onAction: this._onAction,
			}

			commentForm = <CommentForm {...commentFormProps} />
		}

		const commentListProps = {
			data: this.props.data,
			userId: this.props.userId,
			loggedInUserName: this.props.loggedInUserName,
 			loggedInUserPhoto: this.props.loggedInUserPhoto,
			formEditComment: this.props.formEditComment,
			formReplyComment: this.props.formReplyComment,
			formEditReplyComment: this.props.formEditReplyComment,
			type: this.props.type,
			_onAction: this._onAction,
		}

		return (
			<div className="comment-box bg-white hidden-print">
				<div className="row">
					<div className="col-sm-10">
						<div className={"wrapper " + this.props.paddingClass + ' ' + this.props.className}>

							{ showTitle }
							{ showEmpty }
							{ commentForm }

							<CommentList {...commentListProps} />

						</div>
					</div>
				</div>
			</div>
		)
	},
});

var CommentForm = React.createClass({
	getDefaultProps: function() {
	    return {
	    	formComment: {
	    		text: '',
	    		onProcessingRequest: false,
	    	},
	    };
	},
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_handleValueChange(e) {
		var payload = {
            action: "HANDLE_VALUE_CHANGE",
            params: e,
        }

		this.props._onAction(payload);
	},
	_handleSubmit: function(e){
		e.preventDefault();

		var payload = {
            action: "COMMENT_STORE",
            params: {
            	text: this.props.formComment.text,
            },
        }

		this.props._onAction(payload);
	},
	render: function(){

		const commentInputProps = {
			id: "formCommentText",
			name: "text",
			formName: "formComment",
			text: this.props.formComment.text,
			placeholder: $.translate('write_comment'),
			maxLength: 200,
			autoResize: true,
			_handleValueChange: this._handleValueChange,
		}

		return (
			<form onSubmit={this._handleSubmit} className="mt10" method="post" acceptCharset="utf-8">
			 	<div className="form-group">
			 		<Textarea  {...commentInputProps} />
			  	</div>
			  	<button disabled={!this.props.formComment.text.trim().length || this.props.formComment.onProcessingRequest} type="submit" className="btn btn-orange">
			  		{ this.props.formComment.onProcessingRequest ? <Loading withIcon={false} /> : $.translate('send_comment') }
			  	</button>
			</form>
		)
	},
});

window.CommentList = React.createClass({
	propTypes: {
	    type: React.PropTypes.string,
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	      	userId: 0,
	      	loggedInUserName: '',
 			loggedInUserPhoto: '',
		    formEditComment: {
		    	id: 0,
		    	text: '',
		    	editMode: false,
		    },
		    formReplyComment: {
		    	id: 0,
		    	text: '',
		    	replyMode: false,
		    },
		    formEditReplyComment: {
				id: 0,
				text: '',
				editMode: false,
				onProcessingRequest: false,
			},
		    type: 'recipe_comment',
	    };
	},
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){

		if( this.props.data.length ) {
			var nodes = this.props.data.map(function(item) {

				const id = ( this.props.type == 'recipe_comment' ) ? item.FoodCommentID : item.RecookCommentID;
				const commentItemProps = {
					timelineId: this.props.timelineId,
					data: item,
					id: id,
					key: id,
					userId: this.props.userId,
					loggedInUserName: this.props.loggedInUserName,
 					loggedInUserPhoto: this.props.loggedInUserPhoto,
					formEditComment: this.props.formEditComment,
					formReplyComment: this.props.formReplyComment,
					formEditReplyComment: this.props.formEditReplyComment,
					type: this.props.type,
					_onAction: this._onAction,
				}

	            return (
					<CommentItem {...commentItemProps} />
	            )
	        }.bind(this));

			return (
				<div className="wrapper-comment">
					<ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
						{ nodes }
					</ReactCSSTransitionGroup>
				</div>
			)
		} else {
			return false;
		}
	},
});

var CommentItem = React.createClass({
	propTypes: {
	    type: React.PropTypes.string,
	},
	getInitialState: function(){
		return {
			formEditComment: {
	    		text: '',
	    	},
		}
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	id: 0,
	      	userId: 0,
		    formEditComment: {
		    	id: 0,
		    	text: '',
		    	editMode: false,
		    	onProcessingRequest: false,
		    },
		    formEditReplyComment: {
				id: 0,
				text: '',
				editMode: false,
				onProcessingRequest: false,
			},
		    type: 'recipe_comment',
	    };
	},
	shouldComponentUpdate(nextProps, nextState) {
		var res = (!equal(this.props, nextProps) || !equal(this.state, nextState));
		if( !res ) {
			if( this.props.formEditComment.editMode == nextProps.formEditComment.editMode && this.props.id == nextProps.formEditComment.id ) {
				res = true;
			} else if( this.props.id == nextProps.formEditComment.id ) {
				res = true;
			} else if ( this.props.id == nextProps.formReplyComment.id ) {
				res = true;
			} else if ( this.props.formReplyComment.replyMode != nextProps.formReplyComment.replyMode ) {
				res = true;
			} else if( this.props.formEditReplyComment.editMode != nextProps.formEditReplyComment.editMode ) {
				res = true;
			} else if ( this.props.formEditReplyComment.editMode == nextProps.formEditReplyComment.editMode && this.props.formEditReplyComment.id == nextProps.formEditReplyComment.id ) {
				res = true;
			}
		}

		return res;
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	_handleToggleLike: function(likeStatus, type, commentId, id, e){
		e.preventDefault();
		var payload = {
            action: "COMMENT_TOGGLE_LIKE",
            params: {
            	likeStatus: likeStatus,
            	type: type,
				commentId: commentId,
				id: id,
            }
        }

        this.props._onAction(payload);
	},
	_handleRemove: function(type, id, timelineId, e){
		e.preventDefault();

		var conf = confirm($.translate('confirm_delete'));
		if( conf ) {
			var payload = {
	            action: "COMMENT_DESTROY",
	            params: {
	            	timelineId: timelineId,
					id: id,
					type: type,
	            }
	        }

			this.props._onAction(payload);
		}
	},
	_handleEdit: function(type, timelineId, e){
		e.preventDefault();

		var payload = {
	        action: "COMMENT_UPDATE",
	        params: {
	        	timelineId: timelineId,
	        	type: type,
	        	text: this.state.formEditComment.text,
	        },
	    }

		this.props._onAction(payload);
	},
	_enableEditMode: function(comment, id, e){
		e.preventDefault();

		var payload = {
	        action: "COMMENT_ENABLE_EDIT_MODE",
	        params: {
	            id: id,
				text: comment,
	        },
	    }

	    this.setState({
	    	formEditComment: {
	    		text: comment,
	    	},
	    });

		this.props._onAction(payload);
	},
	_enableReplyMode: function(id, e){
		e.preventDefault();

		var payload = {
	        action: "COMMENT_ENABLE_REPLY_MODE",
	        params: {
	            id: id,
	        },
	    }

		this.props._onAction(payload);
	},
	_disableEditMode: function(e){
		e.preventDefault();
		var payload = {
	        action: "COMMENT_DISABLE_EDIT_MODE",
	        params: false,
	    }

		this.props._onAction(payload);
	},
	_handleValueChange(e) {
		this.setState({
			formEditComment : {
				text: e.target.value,
			},
		});
	},
	render: function(){

		var data = this.props.data;
		var replycomments = data.ReplyComments;
		// var comments_total = data.CommentsTotal;

		var timelineId = this.props.timelineId;
		var userId = this.props.userId;
		var loggedInUserName = this.props.loggedInUserName;
		var loggedInUserPhoto = this.props.loggedInUserPhoto;
		var type = this.props.type;
		
		var editCommentId = this.props.formEditComment.id;
		var editCommentText = this.props.formEditComment.text;
		var editMode = this.props.formEditComment.editMode;

		var userName = false;
		var userPhoto = false;
		var comment = false;
		var commentId = false;
		var commentUserId = false;
		var commentDate = false;
		var flagLike = false;
		var totalLike = false;

		if( type == 'recipe_comment' ) {
			userName = data.UserName;
			userPhoto = data.UserPhoto;
			comment = data.Comment;
			commentId = data.FoodCommentID;
			commentUserId = data.UserID;
			commentDate = data.CommentDate;
		} else if( type == 'recook_comment' ) {
			userName = data.RecookUserName;
			userPhoto = data.UserPhoto;
			comment = data.RecookCommentDesc;
			commentId = data.RecookCommentID;
			commentUserId = data.UserID;
			commentDate = data.RecookCommentTime;
		}

		flagLike = data.FlagLove;
		totalLike = data.NumberOfComment;

		var urlUser = serviceUri + 'users/profile/' + commentUserId + '/' + $.slugify(userName);

		var path_image = 'resources/images/uploads/users/thumbs/' + userPhoto;
		var custom_image = serviceUri + path_image;

		var submitButton = false;
		var cancelButton = false;
		var likeButton = false;
		var replyButton = false;
		var editButton = false;
		var deleteButton = false;

		var emojiText = $.emoticons.replace(comment);
		var CommentInput = <p className="comment " dangerouslySetInnerHTML={{__html: emojiText}} />;

		if( userId && editCommentId != commentId ) {
			var flagTextLike = 'Like';
			if( flagLike ) {
				flagTextLike = 'Unlike';
			}

			likeButton = createFragment({
			    button: <a onClick={this._handleToggleLike.bind(null, flagTextLike, type, commentId, timelineId)} href="#"> <span className="comment-action"> { $.translate(flagTextLike) } </span> </a>,
			    text: <span className="comment-separator"> &middot; </span>,
			});

			replyButton = createFragment({
			    button: <a onClick={this._enableReplyMode.bind(null, commentId)} href="#"> <span className="comment-action"> { $.translate('reply') } </span> </a>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
		}

		if( editCommentId == commentId && editMode ) {

			const commentInputProps = {
				id: 'formEditText',
				name: "text",
				formName: "formEditComment",
				text: this.state.formEditComment.text,
				className: 'form-control mt10 mb10',
				placeholder: $.translate('write_comment'),
				maxLength: 200,
				autoResize: true,
				autoFocus: true,
				_handleValueChange: this._handleValueChange,
			}

			submitButton = createFragment({
			    button: <button disabled={!this.state.formEditComment.text.trim().length || this.props.formEditComment.onProcessingRequest} type="button" onClick={this._handleEdit.bind(null, type, timelineId)} className="btn btn-orange"> { this.props.formEditComment.onProcessingRequest ? <Loading withIcon={false} /> : $.translate('save') } </button>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
			cancelButton = createFragment({
			    button: <a onClick={this._disableEditMode} href="#"> <span className="comment-action"> { $.translate('cancel') } </span> </a>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
			CommentInput = <Textarea {...commentInputProps} />;

		} else if( userId == commentUserId ) {
			editButton = createFragment({
			    button: <a onClick={this._enableEditMode.bind(null, comment, commentId)} href="#"> { $.translate('edit') } </a>,
			});
			deleteButton = createFragment({
			    button: <a onClick={this._handleRemove.bind(null, type, commentId, timelineId)} href="#"> { $.translate('delete') } </a>,
			});
		}

		const replyCommentWrapperProps = {
        	timelineId: this.props.timelineId,
        	commentId: commentId,
			data: replycomments,
			userId: userId,
			loggedInUserName: this.props.loggedInUserName,
			loggedInUserPhoto: this.props.loggedInUserPhoto,
			formReplyComment: this.props.formReplyComment,
			formEditReplyComment: this.props.formEditReplyComment,
			type: this.props.type,
			_onAction: this._onAction,
		}

		return (
			<div className="media"> 
				<div className="pull-left">
					<a href={ urlUser } title={ userName }>
						<Image src={custom_image} showFirstLetter={true} firstLetterText={ userName.trim().charAt(0) } className="media-object" title={userName} />
					</a>
				</div>
				<div className="media-body">
					<a href={ urlUser } title={ userName }>
						<h5 className="media-heading fbold no-mg mt5">{ userName }</h5>
					</a>

					{ CommentInput }
					{ submitButton }
					{ cancelButton }

					{ totalLike > 0 && editCommentId != commentId ? <p className="mb5"> <Image src={ serviceUri + 'resources/icons/like_o.png' } className="like-button" /> {totalLike} </p> : '' }

					<div className="wrapper-comment-action dpinline">
						{ likeButton }
						{ replyButton }

						{
							(editButton || deleteButton) &&
							<span>
								<div className="dropdown dpinlineblock">
								    <a href="#" data-toggle="dropdown" className="dropdown-toggle"> { $.translate('more') } </a>
								    <ul className="dropdown-menu custom-more-button">
								        <li>{ editButton }</li>
								        <li>{ deleteButton }</li>
								    </ul>
								</div>
								<span className="comment-separator"> &middot; </span>
							</span>
						}
						<span className="comment-date">
							{ commentDate }
						</span>
					</div>

					<ReplyCommentWrapper {...replyCommentWrapperProps} />
				</div>
			</div>
		)
	},
});

window.CommentWrapper = CommentWrapper;