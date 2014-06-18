// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
    $( document ).tooltip({
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
    });
  });

$(function() {

  var availableTags = ["Angels", "Arizona", "Astros", "Athletics", "Atlanta", "Baltimore", "Blue Jays", "Boston", "Braves", "Brewers", "Cardinals", "Chicago", "Cincinnati", "Cleveland", "Colorado", "Cubs", "Detroit", "Diamondbacks", "Dodgers", "Giants", "Houston", "Indians", "Kansas City", "Los Angeles", "Mariners", "Marlins", "Mets", "Miami", "Milwaukee", "Minnesota", "Nationals", "New York", "Oakland", "Orioles", "Padres", "Philadelphia", "Phillies", "Pirates", "Pittsburgh", "Rangers", "Rays", "Red Sox", "Reds", "Rockies", "Royals", "San Diego", "San Francisco", "Seattle", "St. Louis", "Tampa Bay", "Texas", "Tigers", "Toronto", "Twins", "Washington", "White Sox", "Yankees"];

  $( "#tags" ).autocomplete({
    source: availableTags
  });
});