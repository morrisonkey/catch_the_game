
// ************ Model *************
function Like(likeJSON){
	this.id = likeJSON.id;
	this.likeable_id = likeJSON.likeable_id;
	this.likeable_type = likeJSON.likeable_type;
	this.liker_id = likeJSON.liker_id;
	this.liker_type = likeJSON.liker_type;
}

// // ************ Collection *************
// function likeCollection(){
// 	this.models = {};

// 	this.add = function(likeJSON){
// 		var newLike = new Like(likeJSON);
// 		this.models[likeJSON.id] = newLike;
// 		// displayEntireCollection();
// 	};

// 	this.create = function()
// }

// CustomerCollection.prototype.create = function(paramObject){
// 	var self = this
// 	$.ajax({
// 		url: '/customers',
// 		method: 'post',
// 		dataType: 'json',
// 		data: {customer: paramObject}
// 	}).done(function(data){	
// 		self.add(data); 
// 	})
// }
$( document ).ready(function() {

	$("button").on("click", function() {
	  var el = $(this);
	  var likeable_type = el.val();
	  console.log(likeable_type);
	  var likeable_id = el.attr("id");
	  console.log(likeable_id);	

	    // $( this ).effect( "slide", 90 );
      if (el.text() == el.data("text-swap")) {
        //"unlike" button
        // console.log(el.text()); //=> "Unlike"
        el.text(el.data("text-original"));
      } else {
        //"like" button
   		// console.log(el.text()); //=> "Like"       
        el.data("text-original", el.text());
        el.text(el.data("text-swap"));
	    $.ajax({
			url: '/likes',
			dataType: 'json',
			method: 'post',
			data: {
				likeable_type: likeable_type,
				likeable_id: likeable_id
			}
		}).done(function(data){
			console.log(data);
			
			
		});
    }

	});


});