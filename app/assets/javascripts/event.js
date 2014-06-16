//MODEL

function Event(eventJSON){
  this.name = eventJSON.name;
  this.blurb = eventJSON.blurb;
  this.info = eventJSON.info;
  this.id = eventJSON.id;
  this.venue = eventJSON.venue;
  this.venue_id = eventJSON.venue_id;
  this.broadcast = eventJSON.broadcast;
  this.broadcast_id = eventJSON.venue_id;
}

//VIEW
function EventView(model){
  this.model = model;
  this.el = undefined;
}

EventView.prototype.render = function(){
  var eventTemplate = _.template($("#eventTemplate").text());
  var eventHTML = eventTemplate(this.model);
  var newElement = eventHTML;
  this.el = newElement;
  return this
}

//Collection
function EventCollection(){
  this.models = {};
}

EventCollection.prototype.create = function(paramObject){
  $.ajax({
    url: '/events/' + paramObject["id"],
    method: 'POST',
    dataType: 'json',
    data: {events: paramObject}
  }).done(function(data){
    debugger
    //INSERT CALLBACK CODE HERE
    console.log(data);
    EventCollection.add(data);
  })
}

EventCollection.prototype.update = function(paramObject){
  $.ajax({
    url: '/events/' + paramObject["id"],
    method: 'PATCH',
    dataType: 'json',
    data: {events: paramObject}
  }).done(function(data){
    console.log(data);
  })
  eventCollection.fetch();
  $(this).trigger('refresh');
}

EventCollection.prototype.fetch = function(){
  var self = this;
  $.ajax({
    url: '/events',
    dataType: 'json',
    method: 'get'
  }).done(function(data){
    debugger
    for(id in data){
      self.add(data[id]);
    }
  })
}

var eventCollection = new EventCollection();

EventCollection.prototype.add = function(eventJSON){
  var newEvent = new Event(eventJSON);
  this.models[eventJSON.id] = newEvent;
  $(this).trigger('refresh');
}

function displayEntireCollection(){
  $('.events').empty().html('');
  for(id in eventCollection.models){
    var events = eventCollection.models[id];
    var eventView = new EventView(events);
    $('.events').append(eventView.render().el);
  }
  updateItem();
  setEditForm();
}

function setEditForm(){
  $( ".edit" ).click(function() {
    var ItemId = $(this).parent().attr( "id" );
  // console.log($(this).parent().children('li').eq(0).text());
  // console.log($(this).parent().children('li').eq(1).text());
  // console.log($(this).parent().children('li').eq(2).text());
  // console.log$(this).parent().children('li').eq(2).text());
  var name = $(this).parent().children('li').eq(0).text().replace(/^[^_]*:/, "").trim();;
  var blurb = $(this).parent().children('li').eq(1).text().replace(/^[^_]*:/, "").trim();;
  var info = $(this).parent().children('li').eq(2).text().replace(/^[^_]*:/, "").trim();;
  $(this).parent().children('li').eq(0).replaceWith( "<input type='text' name='name' value='" + name + "'>" );
  $(this).parent().children('li').eq(0).replaceWith( "<input type='text' name='blurb' value='" + blurb + "'>" );
  $(this).parent().children('li').eq(0).replaceWith( "<input type='text' name='info' value='" + info + "'>" );
  //$(this).parent().children('input').eq(3).after("</form>");
  //$(this).parent().find('h1').replaceWith( "<input>" );
  // console.log($("#"+ ItemId).find('h1').replaceWith( "<input>" ));
  $(this).replaceWith("<input type='submit'>");
  $(this).after("</form>");
});
}

function updateItem(){
 $('.edit-form').on('submit', function(e){
  console.log(e);
  e.preventDefault();
  var updatedItems = $(this).serializeArray();
  console.log("i'm clicked");
  console.log({id: updatedItems[3].value, name: updatedItems[0].value, blurb: updatedItems[1].value, info: updatedItems[2].value});
    //FIX THIS!!!!!!
    eventCollection.update({id: updatedItems[3].value, name: updatedItems[0].value, blurb: updatedItems[1].value, info: updatedItems[2].value});
  })
}


$(function(){

  eventCollection.fetch();

  $(eventCollection).on('refresh', function(){
    displayEntireCollection();
  })


  $('.event-form').on('submit', function(e){
    console.log(e);
    e.preventDefault();
  // var newEventInput = $('.event-form input[name="name"]');
  var newEventInput = $(this).serializeArray();
  console.log({name: newEventInput[0].value, blurb: newEventInput[1].value, info: newEventInput[2].value});

  // Insert AJAX call below
  eventCollection.create({name: newEventInput[0].value, blurb: newEventInput[1].value, info: newEventInput[2].value});

  resetForm($('.event-form'));
})

})





