window.FormMixin = {
	_autoSetState: function(name, value, formName){
        this.setState({
        	[formName] : update(this.state[formName], { [name] : {$set: value} })
        });
	},
	_handleSelectChange: function(e){
		var text = e.target.options[e.target.selectedIndex].text;
		var value = e.target.options[e.target.selectedIndex].value;

		this._autoSetState(e.target.name, value, e.target.getAttribute('data-form'));
	},
	_handleValueChange: function(e) {
		this._autoSetState(e.target.name, e.target.value, e.target.getAttribute('data-form'));
    },
    _handleRadioChange: function(e){
    	this._autoSetState(e.target.name, e.target.value, e.target.getAttribute('data-form'));
    },
    _handleCheckboxChange: function(e){
    	this._autoSetState(e.target.name, e.target.checked, e.target.getAttribute('data-form'));
    },
};