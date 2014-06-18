// function Count() {
//   this.count = 0;
// }

BroadcastCollection.prototype.counter = function() {
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
  this.date_and_year = data.date_and_year;
}

// collection (of models)
function BroadcastCollection(){
  this.models = [];
  this.collections = [];
  this.last = function() {
    if ((this.collections.length - 1) < 0) {
        return 0;  
      } else {
        return this.collections.length - 1;
    }
  };
  // this.date = date;
  this.count = 0;
}

// function timeConversion(date) {
//   var newDate = new Date(parseInt(date));
//   return encodeURIComponent(newDate);
// };
// timeConversion(self.date)

BroadcastCollection.prototype.fetch = function(){
  var self = this;
  console.log(this.count);
  $.ajax({
    url:      '/broadcasts?days_from_now=' + this.count, //convert 11 digit mishmosh to a date 
    dataType: 'json',
    method:   'get'
  }).done(function(data){
    data.forEach(function(model){
      var broadcast = new Broadcast(model);

      self.models.push(broadcast);
    });
    //as the index of the collections array increases, models stored therein correspond to a day farther into the future from today
    self.collections.push(self.models);
    self.models = [];
    $(self).trigger("fetch-complete");
  });
}

// view
function BroadcastView(model){
  this.model = model;
  this.el = "";
}

BroadcastView.prototype.render = function(){
  var broadcastTemplate = _.template($("#broadcastTemplate").text());
  var broadcastHTML     = broadcastTemplate(this.model);
  this.el = $( broadcastHTML );
  return this;
}

function BroadcastCollectionView(broadcastCollection){
  this.collection = broadcastCollection;
  this.el = $("<div>").addClass("dayOfBroadcasts");
}

BroadcastCollectionView.prototype.render = function(){
  var self = this;
  self.collection.collections[self.collection.last()].forEach(function(model){
    var modelView = new BroadcastView(model);
    self.el.append(modelView.render().el);
  });
  return self;
}

function CollectionOfBroadcastCollectionViews(BroadcastCollectionView) {
  this.collectionOfCollections = [];
  this.el = "";
  this.collectionOfCollections.push(BroadcastCollectionView);
  this.last = this.collectionOfCollections.length - 1; 

}


// global variables
// var todaysBroadcasts;
// var todaysBroadcastsView;
// var today = Date.now();
var todaysBroadcasts     = new BroadcastCollection();
var todaysBroadcastsView = new BroadcastCollectionView(todaysBroadcasts);
var theMostIntheFutureBroadcastsView = new CollectionOfBroadcastCollectionViews(todaysBroadcastsView);


$(document).ready(function() {

  $(todaysBroadcasts).on("fetch-complete", function(){
    // debugger
    $(".forever_scroll").append(todaysBroadcastsView.render().el);
    bindLikeClickEvents(); //this is here (and not in document.ready) so that $("button") exists when its listeners are called
    
  });

  $(window).scroll(function() {
   if ($(this).scrollTop() + $(this).height() == $(document).height()) {
       todaysBroadcasts.counter();
       todaysBroadcasts.fetch();
   }
  });

  todaysBroadcasts.fetch();


});
