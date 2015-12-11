$(document).ready(function() {

	var serviceUri = 'http://localhost/rd/';

	$('#btnLogin').click(function(e){
		e.preventDefault();

		var datalogin = {
			username : $("#txtEmail").val(),
			password : $("#txtPassword").val()
		}
		$.ajax({
			url: serviceUri + 'users/login',
			type: 'post',
			dataType: 'json',
			data:JSON.stringify(datalogin),
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				// if(data[0].UserID == -1)
				// 	$("#errorLogin").text("Invalid Username or Password");
				// else 
				// {
				// 	$("#errorLogin").text("");
				// 	$.session.set('userlogin', 'loggedin');
				// 	window.location.href= AB.dashboardUri;
				// }
			}	
		});
	});
});