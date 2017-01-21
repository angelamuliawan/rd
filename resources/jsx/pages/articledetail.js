var NewestArticleRoot = React.createClass({
	getInitialState: function(){
		return {
			data: [],
		}
	},
	componentDidMount: function(){
		this._loadData();
	},
	_loadData: function( ajaxGlobal ) {

		if (ajaxGlobal === undefined) {
	        ajaxGlobal = false;
	    }

		$.ajax({
            url: apiUri + this.props.url,
            type: 'GET',
            dataType: 'json',
            global: ajaxGlobal,
            success: function(data) {
            	this._appendNewData(data);
            }.bind(this),
            error: function(xhr, status, err) {
                // console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    _appendNewData: function( data ){
    	this.setState({
        	data: update(this.state.data, {$set: data.results}),
        });
	},
	render: function(){

		const articleListProps = {
			data: this.state.data
		}

		return (
			<ul>
				<ArticleList {...articleListProps} />
			</ul>
		)
	},
});

ReactDOM.render(
    <NewestArticleRoot url="pages/getNewestArticle" />,
    document.getElementById('newest-article-container')
);