

$(document).ready(function() {

	console.log("hello");

	$.ajax({
	    url: "http://api.sportsdatallc.org/mlb-t4/schedule/2014.xml?api_key=tcxmhrf8u2vyk8s5ukxgjrz4",
	    type: "GET",
	    dataType: "json"
	}).done(function(data) {
		console.log(data)
	   
	});
	// var url = "http://api.sportsdatallc.org/mlb-t4/schedule/2014.xml?api_key=tcxmhrf8u2vyk8s5ukxgjrz4";

	// // var url = "http://graph.facebook.com/jbmilgrom?%20fields=id,name,picture";
	// $("#broadcast_test").load(url)


	

});