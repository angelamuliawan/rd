var ReplyCommentWrapper = React.createClass({
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	      	userId: 0,
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

		var replyCommentForm = false;
		if( this.props.userId && this.props.commentId == this.props.formReplyComment.id ) {

			const replyCommentFormProps = {
				timelineId: this.props.timelineId,
				userId: this.props.userId,
				loggedInUserName: this.props.loggedInUserName,
				loggedInUserPhoto: this.props.loggedInUserPhoto,
				formReplyComment: this.props.formReplyComment,
				type: this.props.type,
				_onAction: this._onAction,
			}

			replyCommentForm = <ReplyCommentForm {...replyCommentFormProps} />
		}

		const replyCommentListProps = {
			timelineId: this.props.timelineId,
			commentId: this.props.commentId,
			data: this.props.data,
			userId: this.props.userId,
			formEditReplyComment: this.props.formEditReplyComment,
			type: this.props.type,
			_onAction: this._onAction,
		}

		return (
			<div className="wrapper-reply-comment hidden-print">
				{ replyCommentForm }
				<ReplyCommentList {...replyCommentListProps} />
			</div>
		)
	},
});

var ReplyCommentForm = React.createClass({
	getInitialState: function(){
		return {
			formReplyComment: {
	    		text: '',
	    	},
		}
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	formReplyComment: {
	    		id: 0,
	    		text: '',
	    		replyMode: false,
	    		onProcessingRequest: false,
	    	},
	    	type: 'recipe_comment',
	    };
	},
	shouldComponentUpdate(nextProps, nextState) {
		return (!equal(this.props, nextProps) || !equal(this.state, nextState));
	},
	_handleValueChange(e) {
		this.setState({
			formReplyComment : {
				text: e.target.value,
			},
		});
	},
	_handleSubmit: function(e){
		e.preventDefault();

		var payload = {
            action: "REPLY_COMMENT_STORE",
            params: {
            	timelineId: this.props.timelineId,
            	id: this.props.formReplyComment.id,
            	type: this.props.type,
            	text: this.state.formReplyComment.text,
            },
        }

        this.setState({
        	formReplyComment : {
        		text: '',	
        	},
        }, function(){
        	this.props._onAction(payload);
        });
	},
	_disableReplyMode: function(e){
		e.preventDefault();
		var payload = {
	        action: "COMMENT_DISABLE_REPLY_MODE",
	        params: false,
	    }

		this.props._onAction(payload);
	},
	render: function(){

		const userId = this.props.userId;
		const loggedInUserName = this.props.loggedInUserName;
		const loggedInUserPhoto = this.props.loggedInUserPhoto;

		const urlUser = serviceUri + 'users/profile/' + userId + '/' + $.slugify(loggedInUserName);
		const image = serviceUri + 'resources/images/uploads/users/thumbs/' + loggedInUserPhoto;

		const cancelButton = createFragment({
		    button: <a onClick={this._disableReplyMode} href="#"> <span className="comment-action"> { $.translate('cancel') } </span> </a>,
		});

		const replyCommentInputProps = {
			id: "formReplyCommentText",
			name: "text",
			formName: "formReplyComment",
			text: this.state.formReplyComment.text,
			placeholder: $.translate('write_comment'),
			maxLength: 200,
			autoResize: true,
			_handleValueChange: this._handleValueChange,
		}

		return (
			<form onSubmit={this._handleSubmit} className="mt10" method="post" acceptCharset="utf-8">
				<div className="media"> 
					<div className="pull-left">
						<a href={ urlUser } title={ loggedInUserName }>
							<Image src={image} showFirstLetter={true} firstLetterText={ loggedInUserName.trim().charAt(0) } className="media-object" title={loggedInUserName} />
						</a>
					</div>
					<div className="media-body">
						<a href={ urlUser } title={ loggedInUserName }>
							<h5 className="media-heading fbold no-mg mt5">{ loggedInUserName }</h5>
						</a>
						<div className="form-group mt5">
					 		<Textarea  {...replyCommentInputProps} />
					  	</div>
					  	<button disabled={!this.state.formReplyComment.text.trim().length || this.props.formReplyComment.onProcessingRequest} type="submit" className="btn btn-orange">
					  		{ this.props.formReplyComment.onProcessingRequest ? <Loading withIcon={false} /> : $.translate('reply') }
					  	</button>
					  	<span className="comment-separator"> &middot; </span>
					  	{ cancelButton }
					</div>
				</div>
			</form>
		)
	},
});

var ReplyCommentList = React.createClass({
	propTypes: {
	    type: React.PropTypes.string,
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	commentId: 0,
	      	userId: 0,
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

				const id = ( this.props.type == 'recipe_comment' ) ? item.CommentReplyID : item.RecookCommentReplyID;
				const replyCommentItemProps = {
					timelineId: this.props.timelineId,
					commentId: this.props.commentId,
					data: item,
					id: id,
					key: id,
					userId: this.props.userId,
					formEditReplyComment: this.props.formEditReplyComment,
					type: this.props.type,
					_onAction: this._onAction,
				}

	            return (
					<ReplyCommentItem {...replyCommentItemProps} />
	            )
	        }.bind(this));

			return (
				<div className="wrapper-reply-comment-list mt10">
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

var ReplyCommentItem = React.createClass({
	propTypes: {
	    type: React.PropTypes.string,
	},
	getInitialState: function(){
		return {
			formEditReplyComment: {
	    		text: '',
	    	},
		}
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	commentId: 0,
	    	id: 0,
	      	userId: 0,
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
			if( this.props.formEditReplyComment.editMode == nextProps.formEditReplyComment.editMode && this.props.id == nextProps.formEditReplyComment.id ) {
				res = true;
			} else if( this.props.id == nextProps.formEditReplyComment.id ) {
				res = true;
			} else if( this.props.formEditReplyComment.editMode != nextProps.formEditReplyComment.editMode ) {
				res = true;
			} else if ( this.props.formEditReplyComment.editMode == nextProps.formEditReplyComment.editMode && this.props.formEditReplyComment.id == nextProps.formEditReplyComment.id ) {
				res = true;
			}
		}

		return res;
	},
	_handleToggleLike: function(likeStatus, type, commentId, replyId, id, e){
		e.preventDefault();
		var payload = {
            action: "REPLY_COMMENT_TOGGLE_LIKE",
            params: {
            	likeStatus: likeStatus,
            	type: type,
				commentId: commentId,
				replyId: replyId,
				id: id,
            }
        }

        this.props._onAction(payload);
	},
	_handleRemove: function(type, id, commentId, timelineId, e){
		e.preventDefault();

		var conf = confirm($.translate('confirm_delete'));
		if( conf ) {
			var payload = {
	            action: "REPLY_COMMENT_DESTROY",
	            params: {
	            	timelineId: timelineId,
	            	commentId: commentId,
					id: id,
					type: type,
	            }
	        }

			this.props._onAction(payload);
		}
	},
	_handleEdit: function(type, commentId, timelineId, e){
		e.preventDefault();

		var payload = {
	        action: "REPLY_COMMENT_UPDATE",
	        params: {
	        	timelineId: timelineId,
	        	commentId: commentId,
	        	type: type,
	        	text: this.state.formEditReplyComment.text,
	        },
	    }

		this.props._onAction(payload);
	},
	_enableReplyEditMode: function(comment, id, e){
		e.preventDefault();

		var payload = {
	        action: "COMMENT_ENABLE_REPLY_EDIT_MODE",
	        params: {
	            id: id,
				text: comment,
	        },
	    }

	    this.setState({
	    	formEditReplyComment: {
	    		text: comment,
	    	},
	    });

		this.props._onAction(payload);
	},
	_disableReplyEditMode: function(e){
		e.preventDefault();
		var payload = {
	        action: "COMMENT_DISABLE_REPLY_EDIT_MODE",
	        params: false,
	    }

		this.props._onAction(payload);
	},
	_handleValueChange(e) {
		this.setState({
			formEditReplyComment : {
				text: e.target.value,
			},
		});
	},
	render: function(){

		var data = this.props.data;
		var timelineId = this.props.timelineId;
		var commentId = this.props.commentId;
		var userId = this.props.userId;
		var type = this.props.type;
		
		var editReplyCommentId = this.props.formEditReplyComment.id;
		var editReplyCommentText = this.props.formEditReplyComment.text;
		var editMode = this.props.formEditReplyComment.editMode;

		var userName = false;
		var userPhoto = false;
		var comment = false;
		var commentReplyId = false;
		var commentUserId = false;
		var commentDate = false;
		var flagLike = false;
		var totalLike = false;

		if( type == 'recipe_comment' ) {
			comment = data.CommentReply;
			commentReplyId = data.CommentReplyID;
			commentDate = data.CommentDate;
			flagLike = data.FlagLove;
			totalLike = data.NumberOfComment;
		} else if( type == 'recook_comment' ) {
			comment = data.RecookCommentReply;
			commentReplyId = data.RecookCommentReplyID;
			commentDate = data.CommentDate;
			flagLike = data.FlagLove;
			totalLike = data.NumberOfComment;
		}

		userName = data.UserName;
		userPhoto = data.UserPhoto;
		commentUserId = data.UserID;

		var urlUser = serviceUri + 'users/profile/' + commentUserId + '/' + $.slugify(userName);

		var path_image = 'resources/images/uploads/users/thumbs/' + userPhoto;
		var custom_image = serviceUri + path_image;

		var submitButton = false;
		var cancelButton = false;
		var likeButton = false;
		var editButton = false;
		var deleteButton = false;

		var emojiText = $.emoticons.replace(comment);
		var CommentInput = <p className="comment " dangerouslySetInnerHTML={{__html: emojiText}} />;

		if( userId && editReplyCommentId != commentReplyId ) {
			var flagTextLike = 'Like';
			if( flagLike ) {
				flagTextLike = 'Unlike';
			}

			likeButton = createFragment({
			    button: <a onClick={this._handleToggleLike.bind(null, flagTextLike, type, commentId, commentReplyId, timelineId)} href="#"> <span className="comment-action"> { $.translate(flagTextLike) } </span> </a>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
		}

		if( editReplyCommentId == commentReplyId && editMode ) {

			const commentInputProps = {
				id: 'formEditReplyText',
				name: "text",
				formName: "formEditReplyComment",
				text: this.state.formEditReplyComment.text,
				className: 'form-control mt10 mb10',
				placeholder: $.translate('write_comment'),
				maxLength: 200,
				autoResize: true,
				autoFocus: true,
				_handleValueChange: this._handleValueChange,
			}

			submitButton = createFragment({
			    button: <button disabled={!this.state.formEditReplyComment.text.trim().length || this.props.formEditReplyComment.onProcessingRequest} type="button" onClick={this._handleEdit.bind(null, type, commentId, timelineId)} className="btn btn-orange"> { this.props.formEditReplyComment.onProcessingRequest ? <Loading withIcon={false} /> : $.translate('save') } </button>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
			cancelButton = createFragment({
			    button: <a onClick={this._disableReplyEditMode} href="#"> <span className="comment-action"> { $.translate('cancel') } </span> </a>,
			    text: <span className="comment-separator"> &middot; </span>,
			});
			CommentInput = <Textarea {...commentInputProps} />;

		} else if( userId == commentUserId ) {
			editButton = createFragment({
			    button: <a onClick={this._enableReplyEditMode.bind(null, comment, commentReplyId)} href="#"> { $.translate('edit') } </a>,
			});
			deleteButton = createFragment({
			    button: <a onClick={this._handleRemove.bind(null, type, commentReplyId, commentId, timelineId)} href="#"> { $.translate('delete') } </a>,
			});
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

					{ totalLike > 0 && editReplyCommentId != commentReplyId ? <p className="mb5"> <Image src={ serviceUri + 'resources/icons/like_o.png' } className="like-button" /> {totalLike} </p> : '' }

					<div className="wrapper-comment-action dpinline">
						{ likeButton }
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
				</div>
			</div>
		)
	},
});

window.ReplyCommentWrapper = ReplyCommentWrapper;