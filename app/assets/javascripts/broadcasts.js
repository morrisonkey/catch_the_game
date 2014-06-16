
// ************ Model *************
function Like(likeJSON){
	this.id = likeJSON.id;
	this.likeable_id = likeJSON.likeable_id;
	this.likeable_type = likeJSON.likeable_type;
	this.liker_id = likeJSON.liker_id;
	this.liker_type = likeJSON.liker_type;
}

// ************ Collection *************
function likeCollection(){
	this.models = {};
	this.lastModelId;
}

likeCollection.prototype.add = function(likeJSON){
		var newLike = new Like(likeJSON);
		this.models[likeJSON.id] = newLike;
		// displayEntireCollection();
	};

likeCollection.prototype.create = function(paramObject){
		var self = this;
		$.ajax({
			url: '/likes',
			method: 'post',
			dataType: 'json',
			data: paramObject
		}).done(function(data){	
			self.add(data);	
			self.lastModelId = data.id;
		})
	};

likeCollection.prototype.destroy = function(like_id){
		var self = this;
		$.ajax({
			url: '/likes/' + like_id,
			method: 'delete',
			dataType: 'json'
		}).done(function(like_id){
			debugger
			delete likeCollection.models[like_id]
		})
	};
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
var likeCollection = new likeCollection();

$( document ).ready(function() {

	$("button").on("click", function() {
	  var el = $(this);
	  // var likeable_type = el.val();
	  // var likeable_id = el.attr("id");
	  var likeable_data = {
				likeable_type: el.val(),
				likeable_id: el.attr("id")
			};

      if (el.text() == el.data("text-swap")) {
      	
        //"unlike" button
        el.text(el.data("text-original"));
        
        like_id = el.data("like_id");
        debugger
        likeCollection.destroy(like_id);

      } else {
        //"like" button
        el.data("text-original", el.text());
        el.text(el.data("text-swap"));
     
     
	   	// create a Like, story it in DB, and return the corresponding like_id which I set equal to like_id
	   	likeCollection.create(likeable_data).done(function() {
	   		el.data("like_id", likeCollection.lastModelId);
		});
    }

});