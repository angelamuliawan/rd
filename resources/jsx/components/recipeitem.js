var RecipeList = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){
		var nodes = this.props.data.map(function(item) {
			const recipeItemProps = {
				data: item,
				key: item.id,
			}

            return (
				<RecipeItem {...recipeItemProps} />
            )
        }.bind(this));

		return (
			<ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
				{nodes} 
			</ReactCSSTransitionGroup>
		);
	}
});

var RecipeItem = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){

		var data 		 = this.props.data;

		var recipe_id 	 = data.RecipeID;
		var recipe_name  = data.RecipeName;
		var recipe_intro = data.RecipeIntro;
		var image 		 = data.PrimaryPhoto;
		var slug 		 = data.Slug;

		var totalView 	 = data.NumberOfView;
		var totalLove 	 = data.NumberOfLove;
		var totalComment = data.NumberOfComment;

		var viewIcon 	 = <img src={serviceUri + 'resources/icons/view_w.png'} data-disable-progressive="1" />
		var loveIcon 	 = <img src={serviceUri + 'resources/icons/love_w.png'} data-disable-progressive="1" />
		var commentIcon  = <img src={serviceUri + 'resources/icons/comment_w.png'} data-disable-progressive="1" />

		viewIcon = createFragment({
		    icon: viewIcon,
		    text: <span>{ totalView }</span>,
		});
		loveIcon = createFragment({
		    icon: loveIcon,
		    text: <span>{ totalLove }</span>,
		});
		commentIcon = createFragment({
			icon: commentIcon,
		    text: <span>{ totalComment }</span>,
		});

		var url 		 = serviceUri + 'p/' + recipe_id + '/' + slug;
		var path_image 	 = 'resources/images/uploads/recipe/primary/thumbs/' + image;
		var custom_image = serviceUri + path_image;

		return (
			<li className="no-ul-type with-border">
				<a href={url} title={recipe_name}>
					<div className="box-header">
						<Image src={custom_image} title={recipe_name} />
					</div>
		    		<div className="box-content">
		    			<h4>{recipe_name}</h4>
		    		</div>
		    		<div className="box-footer bg-orange">
		    			<div className="pull-right mr5" title={ $.translate('total_comment') }>
		    				{ commentIcon }
		    			</div>
		    			<div className="pull-right mr10" title={ $.translate('total_like') }>
		    				{ loveIcon }
		    			</div>
		    			<div className="pull-right mr10" title={ $.translate('total_view') }>
		    				{ viewIcon }
		    			</div>
		    		</div>
		    	</a>
			</li>
		)
	},
});

window.RecipeList = RecipeList;