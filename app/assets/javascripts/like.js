
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
	this.currentModelInHasLikeBeenFunction;
}

likeCollection.prototype.add = function(likeJSON){
		var newLike = new Like(likeJSON);
		this.models[likeJSON.id] = newLike;
		// displayEntireCollection();
	};

likeCollection.prototype.create = function(likeableObject){
		var self = this;
		$.ajax({
			url: '/likes',
			method: 'post',
			dataType: 'json',
			data: likeableObject
		}).done(function(likeModel){	
			self.add(likeModel);	
			self.lastModelId = likeModel.id;
		})
	};

likeCollection.prototype.destroy = function(like_id){
		var self = this;
		$.ajax({
			url: '/likes/' + like_id,
			method: 'delete',
			dataType: 'json'
		}).done(function(like_id){
			delete likeCollection.models[like_id]
		})
	};


likeCollection.prototype.fetch = function(likeableType) {
		var self = this;
		$.ajax({
		    url: '/likes?likeable_type=' + likeableType, 
		    dataType: 'json',
		    method: 'get'
	  	}).done(function(userLikes){
		    userLikes.forEach(function(model){
		      var like = new Like(model);
		      self.models[like.id] = like;
		    });
		    $(self).trigger("like-fetch-complete");
		});
	}	

likeCollection.prototype.hasLikeableBeenLikedByUser = function(likeable_id) {
// $.each( obj, function( key, value ) {
//   alert( key + ": " + value );
// });
	var bool = false;
	var self = this;
	$.each(self.models, function(key, value) {
		if (value.likeable_id === likeable_id) {
			bool = true
			self.currentModelInHasLikeBeenFunction = key
		}
	});
	debug("hasLikeableBeenLikedByUser determined");
	return bool;
}

var likeCollection = new likeCollection();

function bindLikeClickEvents(broadcast_id){
  // 'like' button click event!
  $("#" + broadcast_id).on("click", function() {
    var el = $(this);
    // var likeable_type = el.val();
    // var likeable_id = el.attr("id");
    var likeable_data = {
        likeable_type: el.val(),
        likeable_id: el.attr("id")
      };

	
    // if (el.text())  
	    if (el.text() == el.data("text-swap")) {
	        
	        //"unlike" button
	        
	        el.text(el.data("text-original"));
	        like_id = el.data("like_id");
	        
	        var like_count_el = el.parent().find(".likes_number");
	        num = parseInt(like_count_el.text()) - 1;
	        like_count_el.text(num.toString());

	        likeCollection.destroy(like_id);


	      } else {
	        //"like" button
	        
	        el.data("text-original", el.text());
	        el.text(el.data("text-swap"));

	        var like_count_el = el.parent().find(".likes_number");
	        num = parseInt(like_count_el.text()) + 1;
	        like_count_el.text(num.toString());
	     
	     
	      // create a Like, store it in DB, and return the corresponding like_id which I set equal to like_id
	      likeCollection.create(likeable_data);
	      // try to change this to a chainable .done event (chainable to the above .create function)
	      setTimeout(function(){el.data("like_id", likeCollection.lastModelId)}, 100);
	    
	    }

  });
}


// function setDefaultLikeValues() {

// 	// $("button").load(function() {
// 	//     var el = $(this);
// 	//     var likeable_data = {
// 	//         likeable_type: el.val(),
// 	//         likeable_id: el.attr("id")
// 	//       };

// 	//       console.log(likeable_data);

// 	// });



// }


// likeCollection.prototype.fetch = function(likeable_type){
//   var self = this;
//   // console.log(this.count);
  // $.ajax({
  //   url:      '/likes?likeable_type=', //convert 11 digit mishmosh to a date 
  //   dataType: 'json',
  //   method:   'get'
  // }).done(function(data){
  //   data.forEach(function(model){
  //     var broadcast = new Broadcast(model);

  //     self.models.push(broadcast);
  //   });
//     //as the index of the collections array increases, models stored therein correspond to a day farther into the future from today
//     self.collections.push(self.models);
//     self.models = [];
//     $(self).trigger("fetch-complete");
//   });
// }
// BroadcastCollection.prototype.fetch = function(){
//   var self = this;
//   console.log(this.count);
//   $.ajax({
//     url:      '/broadcasts?days_from_now=' + this.count, //convert 11 digit mishmosh to a date 
//     dataType: 'json',
//     method:   'get'
//   }).done(function(data){
//     data.forEach(function(model){
//       var broadcast = new Broadcast(model);

//       self.models.push(broadcast);
//     });
//     //as the index of the collections array increases, models stored therein correspond to a day farther into the future from today
//     self.collections.push(self.models);
//     self.models = [];
//     $(self).trigger("fetch-complete");
//   });
// }



$( document ).ready(function() {
	console.log("hello now");
  // jquery tooltip plugin
  $(function() {
    $( document ).tooltip();
  });

  
});