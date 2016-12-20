window.createFragment = React.addons.createFragment;
window.update = React.addons.update;
window.ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;
window.shallowCompare = React.addons.shallowCompare;

window.Anchor = React.createClass({
	propTypes: {
	    href: React.PropTypes.string,
	    title: React.PropTypes.string,
	    className: React.PropTypes.string,
	    onClick: React.PropTypes.func,
	},
	getDefaultProps: function() {
	    return {
	      	href: '',
	      	title: '',
	      	className: '',
	    };
	},
	render: function(){

		var anchorProps = {
			href: this.props.href,
			title: this.props.title,
			className: this.props.className,
		}

		if( typeof this.props.onClick == 'function' ) {
			anchorProps.onClick = this.props.onClick;
		}

		return (
			<a {...anchorProps}> {this.props.title} </a>	
		)
	}
});

window.Textarea = React.createClass({
	getDefaultProps: function() {
	    return {
	    	id: '',
	      	name: '',
	      	text: '',
	      	formName: 'form',
	      	rows: '3',
	      	className: 'form-control',
	      	disabled: false,
	      	placeholder: '',
	      	maxLength: '200',
	      	autoResize: false,
	      	autoFocus: false,
	    };
	},
	componentWillReceiveProps: function(nextProps){
		if( this.props.autoResize && this.props.id ) {
			this._initDOMSize(nextProps.text);
		}
	},
	componentDidMount: function(){
		if( this.props.autoResize && this.props.id ) {
			this._initDOMSize(this.props.text);
			this._handleAutoResize();
		}

		if( this.props.autoFocus ) {
			ReactDOM.findDOMNode(this.refs[this.props.id]).focus(); 
		}
	},
	componentWillUnmount: function(){
		var selector = document.querySelector('#' + this.props.id);
		selector.removeEventListener('keydown', this._autoResizeDOM);
	},
	_initDOMSize: function(text){
		var selector = document.querySelector('#' + this.props.id);
		var scrollHeight = selector.scrollHeight;

		if( !text ){
			scrollHeight = 70;
		}

		var style1 = 'height:auto; display: inline-block; min-height: 72px; resize: none; word-wrap: break-word; overflow: hidden; outline: none;';
		var style2 = 'resize:none; min-height: 72px; outline: none; overflow: hidden; height:' + scrollHeight + 'px';
		
		selector.style.cssText = style1;
		selector.style.cssText = style2;
	},
	_autoResizeDOM: function(selector){
		var selector = document.querySelector('#' + this.props.id);
		setTimeout(function(){
			selector.style.cssText = 'height:auto; display: inline-block; min-height: 50px; resize: none; word-wrap: break-word; overflow: hidden; outline: none;';
			selector.style.cssText = 'resize:none; min-height: 50px; outline: none; overflow: hidden; height:' + selector.scrollHeight + 'px';
		},0);
	},
	_handleAutoResize: function(){
		var selector = document.querySelector('#' + this.props.id);
		selector.addEventListener('keydown', this._autoResizeDOM);
	},
	_handleValueChange: function(e){
		this.props._handleValueChange(e);
	},
	_handleKeyDown: function(e){
		this.props._handleKeyDown(e);
	},
	render: function(){

		var textareaProps = {
			id: this.props.id || null,
			ref: this.props.id || null,
			name: this.props.name,
			['data-form']: this.props.formName,
			value: this.props.text.replace(/<br \/>/g, '\n'),
			rows: this.props.rows,
			className: this.props.className,
			disabled: this.props.disabled,
			placeholder: this.props.placeholder,
			maxLength: this.props.maxLength,
			onChange: this._handleValueChange,
		}

		if( typeof this.props._handleKeyDown == 'function' ){
			textareaProps.onKeyDown = this._handleKeyDown;
		}

		return (
			<textarea {...textareaProps} />
		);
	},
});

window.ShareToFacebook = React.createClass({
	propTypes: {
	    url: React.PropTypes.string,
	    slug: React.PropTypes.string,
	    shareIcon: React.PropTypes.node,
	},
	getDefaultProps: function() {
	    return {
	      	url: '',
	      	slug: '',
	      	shareIcon: <span>
	      		<img src="http://www.cookindo.com/resources/icons/facebook.png" data-disable-progressive="1" /> 
	      		<span className="mr10 iconText">Share</span> 
	      	</span>,
	    };
	},
	_handleClick: function(){
		window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
		return false;
	},
	render: function(){
		return (
			<a href={"https://www.facebook.com/sharer/sharer.php?u=" + encodeURI(this.props.url) + "&t=" + this.props.slug}
			   onClick={this._handleClick} target="_blank" title="Share on Facebook">
			   { this.props.shareIcon }
			</a>
		)
	}
});

window.Loading = React.createClass({
	propTypes: {
	    text: React.PropTypes.string,
	    withIcon: React.PropTypes.bool,
	    withText: React.PropTypes.bool,
	    className: React.PropTypes.string,
	},
	getDefaultProps: function() {
	    return {
	      	text: 'Loading...',
	      	withIcon: true,
	      	withText: true,
	      	className: '',
	    };
	},
	render: function(){
		return (
			<span>
				{ this.props.withIcon ? <img data-disable-progressive='1' src={serviceUri + "resources/images/reload.gif"} className={"loading-icon " + this.props.className} /> : '' }
				{ this.props.withText ? this.props.text : '' }
			</span>
		)
	}
});

window.Image = React.createClass({
	getInitialState: function(){
		return {
			errorImage: false,
		}
	},
	propTypes: {
		src: React.PropTypes.string,
	    dataDisableProgressive: React.PropTypes.number,
	    onImageErrorSrc: React.PropTypes.string,
	    title: React.PropTypes.string,
	    className: React.PropTypes.string,
	    showFirstLetter: React.PropTypes.bool,
	},
	getDefaultProps: function() {
	    return {
	    	src: '',
	      	dataDisableProgressive: 1,
	      	onImageErrorSrc: serviceUri + 'resources/images/placeholder/recipe.jpg',
	      	title: '',
	      	className: '',
	      	showFirstLetter: false,
	      	firstLetterText : '',
	    };
	},
	_onImageError: function(){
		this.setState({
			errorImage: true,
		});
	},
	render: function(){

		var imgProps = {
			title: this.props.title,
			className: this.props.className,
			onError: this._onImageError,
			src: this.props.src,
			['data-disable-progressive']: this.props.dataDisableProgressive || null,
		}

		var DOM = <img {...imgProps} />;

		if( this.state.errorImage ) {
			if( this.props.showFirstLetter ) {
				DOM = <div className="alphabet-placeholder"> { this.props.firstLetterText } </div>;
			} else {
				imgProps.src = this.props.onImageErrorSrc;
				DOM = <img {...imgProps} />;
			}
		}

		return DOM;
	}
});

window.LoadingTimeline = function(){
	return (
	    <div className="background-masker-wrapper">
	        <div className="animated-background timeline">
	            <div className="background-masker-timeline header-top"></div>
	            <div className="background-masker-timeline header-left"></div>
	            <div className="background-masker-timeline header-right"></div>
	            <div className="background-masker-timeline header-bottom"></div>
	            <div className="background-masker-timeline subheader-left"></div>
	            <div className="background-masker-timeline subheader-right"></div>
	            <div className="background-masker-timeline subheader-bottom"></div>
	            <div className="background-masker-timeline content-top"></div>
	            <div className="background-masker-timeline content-first-end"></div>
	            <div className="background-masker-timeline content-second-line"></div>
	            <div className="background-masker-timeline content-second-end"></div>
	            <div className="background-masker-timeline content-third-line"></div>
	            <div className="background-masker-timeline content-third-end"></div>
	        </div>
	    </div>
	)
}

window.LoadingComment = function(){
	return (
	    <div class="background-masker-wrapper">
		    <div class="animated-background comment">
		        <div class="background-masker-comment header-top"></div>
		        <div class="background-masker-comment header-left"></div>
		        <div class="background-masker-comment subheader-left"></div>
		        <div class="background-masker-comment subheader-right"></div>
		        <div class="background-masker-comment subheader-bottom"></div>
		        <div class="background-masker-comment content-top"></div>
		        <div class="background-masker-comment content-first-end"></div>
		        <div class="background-masker-comment content-second-end"></div>
		        <div class="background-masker-comment content-third-end"></div>
		    </div>
		</div>
	)
}

//Returns the object's class, Array, Date, RegExp, Object are of interest to us
var getClass = function(val) {
	return Object.prototype.toString.call(val).match(/^\[object\s(.*)\]$/)[1];
};

//Defines the type of the value, extended typeof
var whatis = function(val) {

	if (val === undefined)
		return 'undefined';
	if (val === null)
		return 'null';

	var type = typeof val;

	if (type === 'object')
		type = getClass(val).toLowerCase();

	if (type === 'number') {
		if (val.toString().indexOf('.') > 0)
			return 'float';
		else
			return 'integer';
	}

	return type;
};

var compareObjects = function(a, b) {
	if (a === b)
		return true;
	for (var i in a) {
		if (b.hasOwnProperty(i)) {
			if (!equal(a[i],b[i])) return false;
		} else {
			return false;
		}
	}

	for (var i in b) {
		if (!a.hasOwnProperty(i)) {
			return false;
		}
	}
	return true;
};

var compareArrays = function(a, b) {
	if (a === b)
		return true;
	if (a.length !== b.length)
		return false;
	for (var i = 0; i < a.length; i++){
		if(!equal(a[i], b[i])) return false;
	};
	return true;
};

var _equal = {};
_equal.array = compareArrays;
_equal.object = compareObjects;
_equal.date = function(a, b) {
	return a.getTime() === b.getTime();
};
_equal.regexp = function(a, b) {
	return a.toString() === b.toString();
};

/*
 * Are two values equal, deep compare for objects and arrays.
 * @param a {any}
 * @param b {any}
 * @return {boolean} Are equal?
 */
window.equal = function(a, b) {
	if (a !== b) {
		var atype = whatis(a), btype = whatis(b);

		if (atype === btype)
			return _equal.hasOwnProperty(atype) ? _equal[atype](a, b) : a==b;

		return false;
	}

	return true;
};