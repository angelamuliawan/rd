var TimelineList = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){
		var loggedInUserId = this.props.loggedInUserId;
		var loggedInUserName = this.props.loggedInUserName;
		var loggedInUserPhoto = this.props.loggedInUserPhoto;
		var viewerId = this.props.viewerId;

		var nodes = this.props.data.map(function(item) {

			const timelineItemProps = {
				loggedInUserId: loggedInUserId,
				loggedInUserName: loggedInUserName,
				loggedInUserPhoto: loggedInUserPhoto,
				viewerId: viewerId,
				data: item,
				key: item.id,
				formComment: this.props.formComment,
				formEditComment: this.props.formEditComment,
				formReplyComment: this.props.formReplyComment,
				formEditReplyComment: this.props.formEditReplyComment,
				_onAction: this._onAction,
			}

            return (
				<TimelineItem {...timelineItemProps} />
            )
        }.bind(this));

		return (
			<ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
				{nodes} 
			</ReactCSSTransitionGroup>
		);
	}
});

var TimelineItem = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){

		var data = this.props.data;
		var loggedInUserId = this.props.loggedInUserId;
		var loggedInUserName = this.props.loggedInUserName;
		var loggedInUserPhoto = this.props.loggedInUserPhoto;
		var viewerId = this.props.viewerId;

		var id = data.id;
		var userId = data.UserID;
		var userName = data.UserName;
		var userPhoto = data.UserPhoto;
		var activity = data.Activity;
		var activity_desc = data.ActivityDesc;
		var activity_date = data.ActivityDate;
		var intro = data.RecipeIntro;
		var recipe_id = data.RecipeID;
		var recook_id = data.RecookID;
		var cookmark_id = data.CookmarkID;
		var image = data.RecipePhoto;
		var slug = data.Slug;
		var comments = data.Comments;
		var comments_total = data.CommentsTotal;

		var blocked_recipe_reason = data.BlockedRecipeReason;
		var blocked_recook_reason = data.BlockedRecookReason;

		var flag_cookmark = data.FlagCookmark;
		var flag_recook = data.FlagRecook;
		var flag_creator = data.FlagCreator;

		var url = serviceUri + 'resep-masak/' + recipe_id + '/' + slug;

		var badge = false;
		var icon_class = false;
		var desc_reason = false;
		var activity_link = false;
		var additional_text = false;

		if( activity == 'Recook' ) {
			intro = data.RecookIntro;
			image = data.RecookPhoto;
		}		

		if( blocked_recipe_reason ) {
			desc_reason = blocked_recipe_reason;
		} else if( blocked_recook_reason ) {
			desc_reason = blocked_recook_reason;
		}

		if( activity == 'Recook' || activity == 'CommentRecook' ) {
			url = serviceUri + 'recipe/view_recook/' + recook_id + '/' + slug;
		}

		if( activity == 'InsertRecipe' ) {
			additional_text = $.translate('create_recipe');
			icon_class = 'glyphicon-edit';
			badge = 'add';
		} else if( activity == 'Recook' ) {
			additional_text = $.translate('recooked');
			icon_class = 'glyphicon-retweet';
			badge = 'recook';
		} else if( activity == 'Cookmark' ) {
			additional_text = $.translate('cookmark');
			icon_class = 'glyphicon-bookmark';
			badge = 'cookmark';
		} else if( activity == 'CommentRecipe' ) {
			additional_text = $.translate('comment_recipe');
			icon_class = 'glyphicon-comment';
			badge = 'comment';
		} else if( activity == 'CommentRecook' ) {
			additional_text = $.translate('comment_recook');
			icon_class = 'glyphicon-comment';
			badge = 'comment';
		} else {
			additional_text = $.translate('join_cookindo');
			icon_class = 'glyphicon-road';
			url = '#';
		}

		if( activity == 'Join' ) {
			activity_link = <span> {additional_text} </span>;
		} else {
			activity_link = <span> {additional_text} <Anchor href={url} title={activity_desc} className="fbold" /> </span>;
		}

		var path_image = 'resources/images/uploads/recipe/primary/thumbs/' + image;
		if( activity == 'Recook' ) {
			path_image = 'resources/images/uploads/recipe/recook/thumbs/' + image;
		}
		var custom_image = serviceUri + path_image;

		var badgeData = {
			badge : badge,
			iconClass : icon_class,
			url : url,
			title : activity_desc
		}

		var headingData = {
			timelineId: id,
			activityLink : activity_link,
			activityDate : activity_date,
			loggedInUserId : loggedInUserId,
			userId: userId,
			userName: userName,
			userPhoto: userPhoto,
			activity : activity,
			recipeId : recipe_id,
			recookId : recook_id,
			cookmarkId : cookmark_id,
		}

		var bodyData = {
			intro: intro,
			activity : activity,
			image: custom_image,
			url : url,
			activityDesc : activity_desc,
 		}

 		var _timelineAction = false;
 		if( activity != 'CommentRecipe' && activity != 'CommentRecook' && activity != 'Join' ) {

 			const timelineActionProps = {
 				data: data,
 				loggedInUserId: loggedInUserId,
 				viewerId: viewerId,
 				descReason: desc_reason,
 				_onAction: this._onAction,
 			}

 			_timelineAction = <TimelineAction {...timelineActionProps} />
 		}

 		const timelineFooterProps = {
 			timelineId: id,
 			id: ( activity == 'InsertRecipe') ? recipe_id : recook_id,
 			data: comments,
 			commentsTotal : comments_total,
 			loggedInUserId: loggedInUserId,
 			loggedInUserName: loggedInUserName,
 			loggedInUserPhoto: loggedInUserPhoto,
 			formComment: this.props.formComment,
 			formEditComment: this.props.formEditComment,
 			formReplyComment: this.props.formReplyComment,
 			formEditReplyComment: this.props.formEditReplyComment,
 			activity: activity,
			type: ( activity == 'InsertRecipe') ? 'recipe_comment' : 'recook_comment',
			_onAction: this._onAction,
 		}

		if( ( blocked_recipe_reason || blocked_recook_reason) && loggedInUserId != viewerId ) {
			return (
				<div></div>
			)
		} else {
			return (
				<li className="timeline-inverted">
					<TimelineBadge data={badgeData} />
					<div className="timeline-panel">
						<TimelineHeading data={headingData} _onAction={this._onAction} />
						<TimelineBody data={bodyData} />
						{_timelineAction}
						<TimelineFooter {...timelineFooterProps} />
					</div>
				</li>
			)
		}
	},
});

var TimelineBadge = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){
		return (
			<div className={"timeline-badge " + this.props.data.badge}>
    			<a href={this.props.data.url} title={this.props.data.title}>
    				<span className={"glyphicon glyphicon " + this.props.data.iconClass}></span>
    			</a>    
    		</div>
		)
	},
});

var TimelineHeading = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){

		var data = this.props.data;
		var loggedInUserId = data.loggedInUserId;
		var timelineId = data.timelineId;
		var activityLink = data.activityLink;
		var activityDate = data.activityDate;
		var userId = data.userId;
		var userName = data.userName;
		var userPhoto = data.userPhoto;
		var activity = data.activity;
		var recipeId = data.recipeId;
		var recookId = data.recookId;
		var cookmarkId = data.cookmarkId;

		var urlUser = serviceUri + 'users/profile/' + userId + '/' + $.slugify(userName);
		var image = serviceUri + 'resources/images/uploads/users/thumbs/' + userPhoto;

		var custom_action = false;

		if( ( activity == 'InsertRecipe' || activity == 'Recook' || activity == 'Cookmark' ) && loggedInUserId == userId ) {
			var customActionData = {
				timelineId : timelineId,
				activity : activity,
				recipeId : recipeId,
				recookId : recookId,
				cookmarkId : cookmarkId,
			}
			custom_action = <TimelineCustomAction data={customActionData} _onAction={this._onAction} />
		}

		return (
        	<div className="timeline-heading">
				<div className="pull-left wrapper-left-side">
					<a href={urlUser}>
                    	<Image src={image} showFirstLetter={true} firstLetterText={ userName.trim().charAt(0) } title={userName} />
                    </a>  
				</div>
				{ custom_action }
				<div className="wrapper-right-side">
					<a href={urlUser}>
						<h5 className="media-heading">{ userName }</h5>
					</a>
					{ activityLink }
					<p className="created-date">{ activityDate }</p>
				</div>
			</div>
		)
	},
});

var TimelineCustomAction = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_handleRemove: function(activity, id, timelineId, e){
		e.preventDefault();

		var conf = confirm($.translate('confirm_delete'));
		if( conf ) {
			var payload = {
	            action: "TIMELINE_DESTROY",
	            params: {
	                activity: activity,
					id: id,
					timelineId: timelineId,
	            }
	        }

			this.props._onAction(payload);
		}
	},
	render: function(){

		var data = this.props.data;
		var timelineId = data.timelineId;
		var activity = data.activity;
		var recipeId = data.recipeId;
		var recookId = data.recookId;
		var cookmarkId = data.cookmarkId;

		var id = false;
		var buttonStyle = {
			borderColor: '#fff'
		};
		var editButton = false;

		// Check Edit Button
		if( activity == 'InsertRecipe' ) {
			id = recipeId;
			editButton = <li> 
				<Anchor href={serviceUri + 'recipe/edit/' + recipeId} title={ $.translate('edit') } /> 
			</li>
		}

		// Check Delete Button
		if( activity == 'Recook' ) {
			id = recookId;
		} else if( activity == 'Cookmark' ) {
			id = cookmarkId;
		}

		return (
			<div className="pull-right">
	        	<div className="btn-group">
				    <button style={buttonStyle} type="button" className="btn btn-default dropdown-toggle no-pd" data-toggle="dropdown">
				      	<span className="glyphicon glyphicon-chevron-down"></span>
				    </button>
				    <ul className="dropdown-menu custom-timeline">
				    	{editButton}
		      			<li>
		      				<a onClick={this._handleRemove.bind(null, activity, id, timelineId)} href="#" title="Hapus"> { $.translate('delete') } </a>
		      			</li>
				    </ul>
			  	</div>
			</div>
		)
	}
});

var TimelineBody = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){

		var intro = this.props.data.intro;
		var activity = this.props.data.activity;
		var image = this.props.data.image;
		var url	= this.props.data.url;
		var activityDesc = this.props.data.activityDesc;
		var emojiText = false;
		var _customImage = false;
		if( activity != 'CommentRecipe' && activity != 'CommentRecook' && activity != 'Join' ) {
			_customImage = <Image src={image} title={activityDesc} />
		}


		if( intro ) {
			emojiText = <p dangerouslySetInnerHTML={{__html: $.emoticons.replace(intro)}} />	
		}

		return (
			<div className="timeline-body">
				{ emojiText }
				<a href={url} title={activityDesc}>
					{_customImage}					
				</a>
			</div>
		)
	}
});

var TimelineAction = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	render: function(){
		
		var loggedInUserId = this.props.loggedInUserId;
		var viewerId = this.props.viewerId;
		var descReason = this.props.descReason;

		var data = this.props.data;
		var totalLove = data.NumberOfLove;
		var totalView = data.NumberOfView;
		var loveIcon = false;
		var viewIcon = false;

		if( data.RecookID ){
			totalLove = data.NumberOfRecookLove;
		}
		if( totalLove > 0 ) {
			loveIcon = createFragment({
			    // icon: <img src={serviceUri + 'resources/icons/love_b.png'} className="love-icon" data-disable-progressive="1" />,
			    text: <span className="ml5 iconText">{totalLove} Likes</span>,
			});
		}
		if( totalView > 0 ) {
			viewIcon = createFragment({
			    // icon: <img src={serviceUri + 'resources/icons/view.png'} data-disable-progressive="1" />,
			    text: <span className="ml5 iconText">{totalView} Views</span>,
			});
		}

		var blockedSection = false;
		if( descReason && loggedInUserId == viewerId ) {
			blockedSection = <div>
				<span className="label label-danger">Blocked</span>
				<p className="mt10">
					Resep ini tidak ditampilkan karena <b>{descReason}</b>
				</p>
			</div>
		}

		return (
			<div className="timeline-action">
				<RecipeAction data={data} userId={loggedInUserId} _onAction={this._onAction} />
				{
					(loveIcon || viewIcon) &&
					<div className="action-bottom mt10 fs12">
						{
							loveIcon &&
							<div className="pull-left">
								{ loveIcon }
							</div>
						}
						{
							viewIcon && 
							<div>
								{
									(loveIcon) &&
									<div className="pull-left">
										<span className="ml5"> &middot; </span>
									</div>
								}
								<div className="pull-left">
									{ viewIcon }
								</div>
							</div>
						}
					</div>
				}
				{ blockedSection }
			</div>
		)
	},
});

var TimelineFooter = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	id: 0,
	    };
	},
	_onAction: function(payload){
		this.props._onAction(payload);
	},
	_handleViewMoreComment: function(e){
		e.preventDefault();

		var payload = {
            action: "COMMENT_VIEW_MORE",
            params: {
            	timelineId: this.props.timelineId,
            	type: this.props.type,
            	id: this.props.id,
            },
        }

        this.props._onAction(payload);
	},
	render: function(){

		var timelineCommentForm = false;
		var loggedInUserId = this.props.loggedInUserId;

		if( loggedInUserId && ( this.props.activity == 'InsertRecipe' || this.props.activity == 'Recook' ) ) {

			const timelineCommentFormProps = {
				loggedInUserId: loggedInUserId,
				loggedInUserName: this.props.loggedInUserName,
				loggedInUserPhoto: this.props.loggedInUserPhoto,
				timelineId: this.props.timelineId,
				id: this.props.id,
				formComment: this.props.formComment,
				type: this.props.type,			
				_onAction: this._onAction,
			}

			timelineCommentForm = <TimelineCommentForm {...timelineCommentFormProps} />
		}

        const commentListProps = {
        	timelineId: this.props.timelineId,
			data: this.props.data,
			userId: loggedInUserId,
 			loggedInUserName: this.props.loggedInUserName,
 			loggedInUserPhoto: this.props.loggedInUserPhoto,
			formEditComment: this.props.formEditComment,
			formReplyComment: this.props.formReplyComment,
			formEditReplyComment: this.props.formEditReplyComment,
			type: this.props.type,
			_onAction: this._onAction,
		}

		return (
			<div className="timeline-footer">
				<div className="comment-box">
					<div className="wrapper">
						{ timelineCommentForm }
						<CommentList {...commentListProps} />
						{ loggedInUserId && this.props.commentsTotal > this.props.data.length ? <div> <hr className="mt10 mb10" /> <Anchor href='#' title={ $.translate('view_more_comment') } onClick={this._handleViewMoreComment} /> </div> : false }
			        </div>  
		         </div>
	        </div>
		)
	},
});

var TimelineCommentForm = React.createClass({
	getInitialState: function(){
		return {
			formComment: {
	    		text: '',
	    	},
		}
	},
	getDefaultProps: function() {
	    return {
	    	timelineId: 0,
	    	id: 0,
	    	formComment: {
	    		onProcessingRequest : false,
	    	},
	    	loggedInUserId: null,
	    	loggedInUserName: null,
	    	loggedInUserPhoto: null,
	    }
	},
	shouldComponentUpdate(nextProps, nextState) {
		return (!equal(this.props, nextProps) || !equal(this.state, nextState));
	},
	_handleValueChange(e) {
		this.setState({
			formComment : {
				text: e.target.value,
			},
		});
	},
	_handleKeyDown: function(e){
		var keyCode = e.nativeEvent.keyCode;
		if( keyCode == 13 && this.state.formComment.text.trim().length ) {
			e.preventDefault();
			this._handleSubmit(e);
		} else if( keyCode == 13 && !this.state.formComment.text.trim().length ) {
			e.preventDefault();
		}
	},
	_handleSubmit: function(e){
		e.preventDefault();

		var payload = {
            action: "COMMENT_STORE",
            params: {
            	timelineId: this.props.timelineId,
            	id: this.props.id,
            	type: this.props.type,
            	text: this.state.formComment.text,
            },
        }

        this.setState({
        	formComment : {
        		text: '',	
        	},
        }, function(){
        	this.props._onAction(payload);
        });
	},
	render: function(){

		const loggedInUserId = this.props.loggedInUserId;
		const loggedInUserName = this.props.loggedInUserName;
		const loggedInUserPhoto = this.props.loggedInUserPhoto;

		const urlUser = serviceUri + 'users/profile/' + loggedInUserId + '/' + $.slugify(loggedInUserName);
		const image = serviceUri + 'resources/images/uploads/users/thumbs/' + loggedInUserPhoto;
		const commentInputProps = {
			id: "formCommentText",
			name: "text",
			formName: "formComment",
			text: this.state.formComment.text,
			placeholder: $.translate('write_comment'),
			maxLength: 200,
			autoResize: true,
			className: 'form-control mb20',
			disabled: this.props.formComment.onProcessingRequest,
			_handleValueChange: this._handleValueChange,
			_handleKeyDown: this._handleKeyDown,
		}

		return (
			<div className="media"> 
                <div className="pull-left">
                    <a href={urlUser}>
                    	<Image src={image} showFirstLetter={true} firstLetterText={ loggedInUserName.trim().charAt(0) } className="media-object" title={loggedInUserName} />
                    </a>    
                </div>
                <div className="media-body">
					<Textarea  {...commentInputProps} />
					{ this.props.id == this.props.formComment.id && this.props.formComment.onProcessingRequest ? <Loading withIcon={true} withText={false} className="small ml0 mb20" /> : '' }
				</div>
            </div>
		)
	},
});

window.TimelineList = TimelineList;