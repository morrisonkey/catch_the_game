// function Count() {
//   this.count = 0;
// }

CollectionOfDays.prototype.counter = function() {
  this.count += 1;
}

// model
function Broadcast(data){
  this.id     = data.id;
  this.title  = data.title;
  this.time   = data.time;
  this.home_team = data.home_team;
  this.visitor_team = data.visitor_team;
  this.events = data.events;
  this.events_venue_names = data.events_venue_names;
  this.likes_count = data.likes_count;
  this.date_and_year = data.date_and_year;
}

// collection (of models)
function DayOfBroadcasts() {
  this.models = [];
  // this.collection = [];
}

function CollectionOfDays() {
  this.count = 0;
  this.collection = [];
  this.last = function() {
    if ((this.collection.length - 1) < 0) {
        return 0;  
    } else {
        return this.collection.length - 1;
    }
  };
}

// function timeConversion(date) {
//   var newDate = new Date(parseInt(date));
//   return encodeURIComponent(newDate);
// };
// timeConversion(self.date)

CollectionOfDays.prototype.fetch = function(){
  var self = this;
  var todaysBroadcasts = new DayOfBroadcasts;
  debug("CollectionOfDays fetching: count = " + this.count );

  $.ajax({
    url:      '/broadcasts?days_from_now=' + this.count, //convert 11 digit mishmosh to a date 
    dataType: 'json',
    method:   'get'
  }).done(function(data){
    debug("CollectionOfDays fetch AJAX done");
    data.forEach(function(model){
      var broadcast = new Broadcast(model);
      todaysBroadcasts.models.push(broadcast);
    });
    //as the index of the collection array increases, models stored therein correspond to a day farther into the future from today
    self.collection.push(todaysBroadcasts);

    $(self).trigger("fetch-complete");
  });
}

// view
function BroadcastView(model){
  this.model = model;
  this.el = "";
  this.id;
}

BroadcastView.prototype.render = function(){
  debug("Broadcast view rendering");
  var broadcastTemplate = _.template($("#broadcastTemplate").text());
  var broadcastHTML     = broadcastTemplate(this.model);
  this.el = $( broadcastHTML );
  return this;
}


function BroadcastCollectionView(collectionOfDays){
  this.collectionPointer = collectionOfDays;
  this.el = $("<div>").addClass("dayOfBroadcasts");
}


BroadcastCollectionView.prototype.render = function(){
  debug("BroadcastCollection view rendering");
  var self = this;
  self.collectionPointer.collection[self.collectionPointer.last()].models.forEach(function(model){
    var modelView = new BroadcastView(model);
    // when we have time, we need to create a function that accumulates the below functions and only calls them once the broadcast view has been appended to the DOM 
    self.el.append(modelView.render().el);
  });
  return self;
}


BroadcastCollectionView.prototype.renderLikeListeners = function() {
  debug("BroadcastCollection rendering LikeListeners");
  
  this.collectionPointer.collection[this.collectionPointer.last()].models.forEach(function(broadcastModel){
    if (likeCollection.hasLikeableBeenLikedByUser(broadcastModel.id)){
      debug("LikeListener rendering");
      //at this point, the like/unlike "text-swap" button has already been set up.  This "if"
      //statement is supposed to change the text in a blink indiscernable to the naked eye
      //and add the data "like_id" => Like_id (corresponding to the this broadcast and current_user)
      //to the data() hash
      var $button = $("#" + broadcastModel.id);
      $button.data("text-original", $button.text());
      $button.text($button.data("text-swap"));
      $button.data("like_id", likeCollection.currentModelInHasLikeBeenFunction);
    }
    bindLikeClickEvents(broadcastModel.id);
  });
}

// function CollectionOfBroadcastCollectionViews(BroadcastCollectionView) {
//   this.collectionOfCollections = [];
//   this.el = "";
//   this.collectionOfCollections.push(BroadcastCollectionView);
//   this.last = this.collectionOfCollections.length - 1; 

// }


// global variables
// var todaysBroadcasts;
// var todaysBroadcastsView;
// var today = Date.now();
var collectionOfDays = new CollectionOfDays();
// var todaysBroadcasts     = new BroadcastCollection();
var todaysBroadcastsView = new BroadcastCollectionView(collectionOfDays);
// var theMostIntheFutureBroadcastsView = new CollectionOfBroadcastCollectionViews(todaysBroadcastsView);

var likeFetchPromise;

$(document).ready(function() {

  debug("Fetching like collection");
  likeFetchPromise = likeCollection.fetch("Broadcast"); //need to figure out how to pull the url of the page on which it is being deployed to make this more general


  $(collectionOfDays).on("fetch-complete", function(){
    debug("CollectionOfDays fetch complete");
    $(".forever_scroll").append(todaysBroadcastsView.render().el);

    $.when(likeFetchPromise).done(function(){
      debug("render like listeners promise wait is now finished");
      todaysBroadcastsView.renderLikeListeners();
    });
  });

  $(window).scroll(function() {
    if ($(this).scrollTop() + $(this).height() == $(document).height()) {
      collectionOfDays.counter();
      collectionOfDays.fetch();
    }
  });

  debug("CollectionOfDays fetching");
  collectionOfDays.fetch();

});
