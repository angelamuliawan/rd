var ArticleList = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){
		var nodes = this.props.data.map(function(item) {
			const articleItemProps = {
				data: item,
				key: item.id,
			}

            return (
				<ArticleItem {...articleItemProps} />
            )
        }.bind(this));

		return (
			<ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
				{nodes} 
			</ReactCSSTransitionGroup>
		);
	}
});

var ArticleItem = React.createClass({
	shouldComponentUpdate(nextProps, nextState) {
		return !equal(this.props, nextProps);
	},
	render: function(){

		var data 		 	= this.props.data;

		var article_id 	 	= data.ArticleID;
		var article_title  	= data.ArticleTitle;
		var image 		 	= data.ArticleImage;
		var slug 		 	= data.Slug;

		var url 		 = serviceUri + 'artikel/' + article_id + '/' + slug;
		var path_image 	 = 'resources/images/uploads/article/primary/thumbs/' + image;
		var custom_image = serviceUri + path_image;

		return (
			<li className="no-ul-type">
				<a href={url} title={article_title}>
					<Image className="bg-holder" src={custom_image} title={article_title} />
					<p className="article-title">
						{ article_title }
					</p>
		    	</a>
			</li>
		)
	},
});

window.ArticleList = ArticleList;