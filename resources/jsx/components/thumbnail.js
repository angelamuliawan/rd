var ThumbnailList = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){
		var nodes = this.props.data.map(function(item) {

			if( item.Activity == 'InsertRecipe' || item.Activity == 'Recook' || item.Activity == 'Cookmark' ) {
				const thumbnailItemProps = {
					data: item,
					key: item.id,
				}

	            return (
					<ThumbnailItem {...thumbnailItemProps} />
	            )
			}

        }.bind(this));

		return (
			<ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
				{nodes} 
			</ReactCSSTransitionGroup>
		);
	}
});

var ThumbnailItem = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){

		var data = this.props.data;

		var id = data.id;
		var activity = data.Activity;
		var activity_desc = data.ActivityDesc;
		var recipe_id = data.RecipeID;
		var recook_id = data.RecookID;
		var cookmark_id = data.CookmarkID;
		var image = data.RecipePhoto;
		var slug = data.Slug;

		var url = serviceUri + 'p/' + recipe_id + '/' + slug;

		if( activity == 'Recook' ) {
			url = serviceUri + 'recook/' + recook_id + '/' + slug;
		}

		var path_image = 'resources/images/uploads/recipe/primary/thumbs/' + image;
		if( activity == 'Recook' ) {
			image = data.RecookPhoto;
			path_image = 'resources/images/uploads/recipe/recook/thumbs/' + image;
		}

		var custom_image = serviceUri + path_image;

		return (
			<li>
				<a href={url}>
		    		<div className="wrapper-thumbnail-image">
		    			<Image src={custom_image} title={activity_desc} />
		    		</div>
		    	</a>
			</li>
		)
	},
});

window.ThumbnailList = ThumbnailList;