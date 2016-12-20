window.RecipeAction = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	_handleToggleLove: function(type, recipeId, id, e){
		e.preventDefault();
		var payload = {
            action: "TIMELINE_TOGGLE_LOVE",
            params: {
                type: type,
				recipeId: recipeId,
				id: id,
            }
        }

        this.props._onAction(payload);
	},
	_handleToggleLoveRecook: function(type, recookId, id, e){
		e.preventDefault();
		var payload = {
            action: "TIMELINE_TOGGLE_LOVE_RECOOK",
            params: {
                type: type,
				recookId: recookId,
				id: id,
            }
        }

        this.props._onAction(payload);
	},
	_handleToggleCookmark: function(type, recipeId, cookmarkId, id, e){
		e.preventDefault();
		var payload = {
            action: "TIMELINE_TOGGLE_COOKMARK",
            params: {
                type: type,
				recipeId: recipeId,
				cookmarkId: cookmarkId,
				id: id,
            }
        }

        this.props._onAction(payload);
	},
	render: function(){

		var data = this.props.data;
		var userId = this.props.userId;

		var id = data.id;
		var recipeId = data.RecipeID;
		var recookId = data.RecookID;
		var slug = data.Slug;

		var flagLove = data.FlagLove;
		var flagCookmark = data.FlagCookmark;
		var flagRecook = data.FlagRecook;
		var flagCreator = data.FlagCreator;

		var loveIcon = <img src={serviceUri + 'resources/icons/love.png'} className="love-icon" data-disable-progressive="1" />
		var recookIcon 	= <img src={serviceUri + 'resources/icons/retweet.png'} data-disable-progressive="1" />
		var cookmarkIcon = <img src={serviceUri + 'resources/icons/cookmark.png'} data-disable-progressive="1" />
		var printIcon = <img src={serviceUri + 'resources/icons/print.png'} data-disable-progressive="1" />

		var textRecook = 'Recook';
		var textCookmark = 'Cookmark';

		if( recookId ) {
			flagLove =  data.FlagRecookLove;
		}

		if( userId ) {

			if( flagLove ) {
				loveIcon = <img src={serviceUri + 'resources/icons/love_r.png'} className="love-icon" data-disable-progressive="1" />
			}

			if( flagRecook ) {
				textRecook = 'Recooked';
				recookIcon = <img src={serviceUri + 'resources/icons/retweet_o.png'} data-disable-progressive="1" />
			}

			if( flagCreator ) {
				textCookmark = '';
			} else if( flagCookmark ) {
				cookmarkIcon = <img src={serviceUri + 'resources/icons/cookmark_o.png'} data-disable-progressive="1" />
			}
		}

		loveIcon = createFragment({
		    icon: loveIcon,
		    text: <span className="ml5 iconText">Love</span>,
		});
		recookIcon = createFragment({
		    icon: recookIcon,
		    text: <span className="ml5 iconText">{textRecook}</span>,
		});
		cookmarkIcon = createFragment({
			icon: cookmarkIcon,
		    text: <span className="ml5 iconText">{textCookmark}</span>,
		});

		var urlLove = false;
		var urlRecook = false;
		var urlCookmark = false;

		if( userId ) {
			urlRecook = serviceUri + 'recipe/recook_item/' + recipeId;

			if( !flagLove ) {
				if( recookId ) {
					loveIcon = <a onClick={this._handleToggleLoveRecook.bind(null, 'love', recookId, id)} href="#" title="Love">{loveIcon}</a>
				} else {
					loveIcon = <a onClick={this._handleToggleLove.bind(null, 'love', recipeId, id)} href="#" title="Love">{loveIcon}</a>
				}
			} else {
				if( recookId ) {
					loveIcon = <a onClick={this._handleToggleLoveRecook.bind(null, 'unlove', recookId, id)} href="#" title="Unlove">{loveIcon}</a>
				} else {
					loveIcon = <a onClick={this._handleToggleLove.bind(null, 'unlove', recipeId, id)} href="#" title="Unlove">{loveIcon}</a>
				}
			}
			
			if( flagCreator ) {
				recookIcon = '';
				cookmarkIcon = '';
			} else {

				if( !flagCookmark ) {
					cookmarkIcon = <a onClick={this._handleToggleCookmark.bind(null, 'cookmark', recipeId, flagCookmark, id)} href="#" title={textCookmark}>{cookmarkIcon}</a>
				} else {
					cookmarkIcon = <a onClick={this._handleToggleCookmark.bind(null, 'uncookmark', recipeId, flagCookmark, id)} href="#" title={textCookmark}>{cookmarkIcon}</a>
				}
			}
		} else {
			urlLove = urlRecook = urlCookmark = serviceUri + 'users/login';

			loveIcon = <a title="Love" href={urlLove} className="ajax-modal">{loveIcon}</a>
			cookmarkIcon = <a title="Cookmark" href={urlCookmark} className="ajax-modal">{cookmarkIcon}</a>
		}

		var url = serviceUri + 'resep-masak/' + recipeId + '/' + slug;
		if( recookId ) {
			url = serviceUri + 'recipe/view_recook/' + recookId + '/' + slug;
		}

		// ======================================================
		var loveButton = loveIcon;
		var recookButton = false;
		var cookmarkButton = false;

		if( flagRecook ) {
			if( recookIcon ) {
				recookButton = <a title="Recooked" href="javascript:void(0);">{recookIcon}</a>;
			}
		} else if( !flagCreator ) {
			recookButton = <a title="Recook" className="ajax-modal" href={urlRecook}>{recookIcon}</a>;
		}
		
		if( !recookId ){
			cookmarkButton = cookmarkIcon;
		}

		return (
			<div className="action-bottom mt15 wrapper-ajax-link">
				{ loveButton }
				{ recookButton }
				{ cookmarkButton }
				<ShareToFacebook url={url} slug={slug} />
			</div>
		)
	}
});