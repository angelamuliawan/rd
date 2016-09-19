$(document).ready(function(){
	if( $("#birthday").length ) {
		$("#birthday").dateDropper({
			animate: true,
			init_animation: "fadein",
			lang: "id",
			format : 'Y-m-d',
			dropPrimaryColor: "#E66909",
			dropTextColor: "#333333",
			dropBackgroundColor: "#FFFFFF",
			dropBorder: "2px solid #E66909",
		});
	}
});