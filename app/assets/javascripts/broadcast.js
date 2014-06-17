// model
function Broadcast(data){
  this.id     = data.id;
  this.title  = data.title;
  this.time   = data.time;
  this.events = data.events;
}

// collection (of models)
function BroadcastCollection(date){
  this.models = [];
  this.date = date;
}

function timeConversion(date) {
  var newDate = new Date(parseInt(date));
  return encodeURIComponent(newDate);
};

BroadcastCollection.prototype.fetch = function(){
  var self = this;
  $.ajax({
    url:      '/broadcasts?date=' + timeConversion(self.date), //convert 11 digit mishmosh to a date 
    dataType: 'json',
    method:   'get'
  }).done(function(data){
    data.forEach(function(model){
      var broadcast = new Broadcast(model);
      self.models.push(broadcast);
    });
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
  self.collection.models.forEach(function(model){
    var modelView = new BroadcastView(model);
    self.el.append(modelView.render().el);
  });
  return self;
}


// global variables
var todaysBroadcasts;
var todaysBroadcastsView;
var today = Date.now();

$(document).ready(function() {
  todaysBroadcasts     = new BroadcastCollection(today);
  todaysBroadcastsView = new BroadcastCollectionView(todaysBroadcasts);
  $(todaysBroadcasts).on("fetch-complete", function(){
    $(".forever_scroll").append(todaysBroadcastsView.render().el);
    bindLikeClickEvents(); //this is here (and not in document.ready) so that $("button") exists when its listeners are called
  });

  todaysBroadcasts.fetch();


});
